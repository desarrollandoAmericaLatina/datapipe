<?php

define('UNDER_INDEX', true);

require('config.php');
require('functions.php');
require('database.php');
require('parser.php');
require('component.php');

class DataPipe {

    private $database;

    public function __construct() {

        $this->database = new Database();
        $this->database->connect($GLOBALS['DB']['host'], $GLOBALS['DB']['port'], $GLOBALS['DB']['username'], $GLOBALS['DB']['password'], $GLOBALS['DB']['dbname']);

        $this->route();

    }

    public function route() {
        $section = (!empty($_GET['section'])) ? $_GET['section']: '';

        switch ($section) {
            case 'index':
                $this->indexSection();
                break;
            case 'sources':
                $this->sourcesSection();
                break;
            case 'attributes':
                $this->attributesSection();
                break;
            case 'process':
                $this->processSection();
                break;
            default:
                $this->indexSection();
        }
    }

    public function getSources() {

        $sql = "
            SELECT tablename
            FROM pg_tables
            WHERE (
                tablename NOT LIKE 'pg_%'
            ) AND (
                tablename NOT LIKE 'sql_%'
            );
        ";

        $sources = $this->database->execute($sql);

        $result = array();
        foreach ($sources as $source) {
            $result[] = $source['tablename'];
        }

        return $result;

    }

    private function getAttributes($source) {

        $sql = "
            SELECT attname
            FROM pg_attribute JOIN pg_type ON (attrelid = typrelid)
            WHERE (
                typname = :source
            ) AND (
                attname NOT IN ('cmin', 'cmax', 'ctid', 'oid', 'tableoid', 'xmin', 'xmax')
            ) AND (
                attname NOT LIKE '.%'
            );
        ";

        $attributes = $this->database->execute($sql, array('source' => $source));

        $result = array();
        foreach ($attributes as $attribute) {
            $result[] = $attribute['attname'];
        }

        return $result;

    }

    public function indexSection() {
        include('template.php');
    }

    public function sourcesSection() {
        $sources = $this->getSources();

        $result = array();
        foreach ($sources as $source) {
            $result[$source] = $this->getAttributes($source);
        }

        echo json_encode($result);
    }

    public function attributesSection() {
        if (empty($_GET['source'])) {
            return;
        }
        $source = $_GET['source'];

        echo json_encode($this->getAttributes($source));
    }

    public function processSection() {

        if (empty($_POST['flow'])) {
            echo '{"error": "Datos inválidos"}';
            return;
        }

        $flow = json_decode($_POST['flow'], true);

        $parser = new Parser();

        try {
            $sql = $parser->parse($flow);

            try {
                $result = $this->database->execute($sql);

                //FIXME!
                $data = '';

                if (count($result) > 0) {

                    $attributes = array_keys($result[0]);

                    $head = '';
                    foreach ($attributes as $attribute) {
                        $head .= '<div class="head">'.$attribute.'</div>';
                    }
                    $data .= '
                        <div class="row">
                            '.$head.'
                        </div>';

                    foreach ($result as $key => $resultRow) {
                        $row = '';
                        foreach ($resultRow as $attribute => $value) {
                            $row .= '<div class="column">'.$value.'</div>';
                        }
                        $data .= '
                            <div class="row">
                                '.$row.'
                            </div>';
                    }

                } else {
                    $data = 'No hay registros con estas características';
                }

                echo $data;
            } catch (Exception $e) {
                throw new Exception('Error en la integridad, revise el flujo');
            }

        } catch (Exception $e) {
            echo $e->getMessage();
        }

    }

}

$datapipe = new DataPipe();

?>
<?php

if (!defined('UNDER_INDEX')) {
    header('Location: /');
}

class Component {

    private $id;
    private $type;
    private $settings;
    private $previousCount;
    private $previous;

    public function __construct($component) {

        $this->id = $component['id'];
        $this->type = $component['type'];
        $this->settings = $component['settings'];
        $this->previousCount = $component['previousCount'];

        $this->previous = array();

    }

    public function addPrevious($component) {
        $this->previous[] = $component;
    }

    public function getQuery() {
        $sql = '';
        switch ($this->type) {
            case 'source':
                $sql = $this->getQuerySource();
                break;
            case 'proyection':
                $sql = $this->getQueryProyection();
                break;
            case 'condition':
                $sql = $this->getQueryCondition();
                break;
            case 'order':
                $sql = $this->getQueryOrder();
                break;
            case 'limit':
                $sql = $this->getQueryLimit();
                break;
            case 'join':
                $sql = $this->getQueryJoin();
                break;
            case 'union':
                $sql = $this->getQueryUnion();
                break;
            case 'intersection':
                $sql = $this->getQueryIntersection();
                break;
            case 'difference':
                $sql = $this->getQueryDifference();
                break;
            case 'visualizer':
                $sql = $this->getQueryVisualizer();
                break;
        }
        return $sql;
    }

    public function getQuerySource() {
        $sql = '';

        $source = $this->settings['source'];

        if (!empty($source)) {
            $sql = 'SELECT * FROM '.$source;
        } else {
            throw new Exception('No se encontró una fuente');
        }

        return $sql;
    }

    public function getQueryProyection() {
        if (!empty($this->settings)) {

            $proyections = array();

            foreach ($this->settings as $proyection => $state) {
                $attributePart = explode('#', $proyection);
                $proyections[] = $attributePart[1]; //FIXME
            }

            $proyection = implode(', ', $proyections);

            $sql = 'SELECT '.$proyection.' FROM ('.$this->previous[0]->getQuery().') AS M'.$this->id;

        } else {
            $sql = 'SELECT * FROM ('.$this->previous[0]->getQuery().') AS M'.$this->id;
        }

        return $sql;
    }

    public function getQueryCondition() {
        $sources = array();
        foreach ($this->previous as $previousComponent) {
            $sources[] = '('.$previousComponent->getQuery().') AS M'.$this->id.'_'.$previousComponent->id;
        }

        if (!empty($this->settings)) {

            $conditions = array();

            $conditionsCount = count($this->settings['attribute1']);
            for ($i=0; $i < $conditionsCount; $i++) {

                $attribute1 = $this->settings['attribute1'][$i];
                $type = $this->settings['type'][$i];
                $attribute2 = $this->settings['attribute2'][$i];

                preg_match('|^\w+#\w+$|', $attribute1, $matches);
                if (!empty($matches)) {
                    $attributePart = explode('#', $attribute1);
                    $attribute1 = $attributePart[1]; //FIXME
                } else {
                    $attribute1 = "'$attribute1'";
                }

                preg_match('|^\w+#\w+$|', $attribute2, $matches);
                if (!empty($matches)) {
                    $attributePart = explode('#', $attribute2);
                    $attribute2 = $attributePart[1]; //FIXME
                } else {
                    $attribute2 = "'$attribute2'";
                }

                $conditions[] = '('.$attribute1.' '.$type.' '.$attribute2.')';

            }

            $sql = '
                SELECT *
                FROM '.implode(', ', $sources).'
                WHERE (
                    '.implode(' AND ', $conditions).'
                )';

        } else {
            $sql = '
                SELECT *
                FROM '.implode(', ', $sources);
        }

        return $sql;
    }

    public function getQueryOrder() {
        if (!empty($this->settings)) {

            $orders = array();

            $orderCount = count($this->settings['attribute']);
            for ($i=0; $i < $orderCount; $i++) {
                $attributePart = explode('#', $this->settings['attribute'][$i]);
                $attribute = $attributePart[1]; //FIXME
                $order = $this->settings['order'][$i];
                $orders[] = $attribute.' '.$order;
            }

            $order = implode(', ', $orders);

            $sql = '
                SELECT *
                FROM (
                    '.$this->previous[0]->getQuery().'
                ) AS M'.$this->id.'
                ORDER BY '.$order;

        } else {
            $sql = '
                SELECT *
                FROM (
                    '.$this->previous[0]->getQuery().'
                ) AS M'.$this->id;
        }

        return $sql;
    }

    public function getQueryLimit() {
        $sql = '
            SELECT *
            FROM (
                '.$this->previous[0]->getQuery().'
            ) AS M'.$this->id.'
        ';

        if (!empty($this->settings)) {

            if (!empty($this->settings['limit'])) {
                $limit = $this->settings['limit'];
                $sql .= 'LIMIT '.$limit;
            }

            if (!empty($this->settings['offset'])) {
                $offset = $this->settings['offset'];
                $sql .= 'OFFSET '.$offset;
            }

        }

        return $sql;
    }

    public function getQueryJoin() {
        $joins = array();

        foreach ($this->previous as $previousComponent) {
            $joins[] = '('.$previousComponent->getQuery().') AS M'.$this->id.'_'.$previousComponent->id;
        }

        $sql = 'SELECT * FROM '.implode(', ', $joins);

        return $sql;
    }

    public function getQueryUnion() {
        $unions = array();

        foreach ($this->previous as $previousComponent) {
            $unions[] = $previousComponent->getQuery();
        }

        $sql = '('.implode(') UNION (', $unions).')';

        return $sql;
    }

    public function getQueryIntersection() {
        $union = array();

        foreach ($this->previous as $previousComponent) {
            $unions[] = $previousComponent->getQuery();
        }

        $sql = '('.implode(') INTERCEPT (', $unions).')';

        return $sql;
    }

    public function getQueryDifference() {
        $union = array();

        foreach ($this->previous as $previousComponent) {
            $unions[] = $previousComponent->getQuery();
        }

        $sql = '('.implode(') EXCEPT (', $unions).')';

        return $sql;
    }

    public function getQueryVisualizer() {
        return $this->previous[0]->getQuery();
    }

}

?>
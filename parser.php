<?php

if (!defined('UNDER_INDEX')) {
    header('Location: /');
}

class Parser {

    private $flow;
    private $components;
    private $chartType;
    private $includeTable;

    public function parse($flow) {
        $this->flow = $flow;

        if ($this->flow[count($this->flow)-1]['type'] != 'visualizer') {
            throw new Exception('No se encontró el visualizador');
            return;
        }

        $this->components = array();

        $visualizer = null;

        while (count($this->flow) > 0) {

            $flowComponent = array_pop($this->flow);

            if (!isset($this->components[$flowComponent['id']])) {

                $component = new Component($flowComponent);
                $this->components[$flowComponent['id']] = $component;

                if (!isset($visualizer)) {
                    $visualizer = $component;
                    $this->chartType = (($flowComponent['settings']) && ($flowComponent['settings']['type'])) ? $flowComponent['settings']['type'] : 'line';
                    $this->includeTable = (($flowComponent['settings']) && ($flowComponent['settings']['table'])) ? $flowComponent['settings']['table'] : false;
                }

            } else {
                $component = $this->components[$flowComponent['id']];
            }

            if (isset($lastFlowComponent)) {
                $lastFlowComponent->addPrevious($component);
            }

            if ($flowComponent['type'] != 'source') {
                $lastFlowComponent = $component;
            } else {
                $lastFlowComponent = null;
            }

        }

        return $visualizer->getQuery();

    }

    public function getChartType() {
        return $this->chartType;
    }

    public function getIncludeTable() {
        return $this->includeTable;
    }

}

?>
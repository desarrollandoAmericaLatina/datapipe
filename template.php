<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <link rel="stylesheet" href="css/reset.css" type="text/css" />
        <link rel="stylesheet" href="css/jQueryUI.css" type="text/css" />
        <link rel="stylesheet" href="css/FlowDesigner.css" type="text/css" />
        <link rel="stylesheet" href="css/DataPipe.css" type="text/css" />
        <script type="text/javascript" src="js/jQuery.js"></script>
        <script type="text/javascript" src="js/jQueryUI.js"></script>
        <script type="text/javascript" src="js/jsPlumb.js"></script>
        <script type="text/javascript" src="js/form2js.js"></script>
        <script type="text/javascript" src="js/js2form.js"></script>
        <script type="text/javascript" src="js/FlowDesigner.js"></script>
        <script type="text/javascript" src="js/json2.js"></script>
        <script type="text/javascript" src="js/DataPipe.js"></script>
    </head>
    <body>
        <div class="title">DATAPIPE</div>
        <div id="flow_designer">
            <div id="components"></div>
            <div id ="available_components">
                <div class="type" id ="source">FUENTE</div>
                <div class="type" id ="proyection">SELECCIONAR</div>
                <div class="type" id ="condition">CONDICIÓN</div>
                <div class="type" id ="order">ORDENAR</div>
                <div class="type" id ="limit">LIMITAR</div>
                <div class="type" id ="join">CONCATENAR</div>
                <div class="type" id ="union">UNIÓN</div>
                <div class="type" id ="intersection">INTERSECCIÓN</div>
                <div class="type" id ="difference">EXCLUIR</div>
                <div class="type" id ="visualizer">VISUALIZAR</div>
            </div>
            <div class="separator"></div>
            <input type="button" onClick="javascript:DataPipe.process();" id="process" value="PROCESAR" />
        </div>
    </body>
</html>
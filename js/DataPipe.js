var DataPipe = new function() {

    var sources;
    var processButton;

    this.initialize = function() {

        processButton = $('#process').button();
        processButton.button('disable');

        $.ajax({
            url: '/?section=sources',
            dataType: 'json',
            async: false,
            success: function(availableSources) {
                sources = availableSources;
            }
        });

        FlowDesigner.initialize(function(type, position) {
            switch (type) {
                case 'source':
                    createSource(position);
                    break;
                case 'proyection':
                    createProyection(position);
                    break;
                case 'condition':
                    createCondition(position);
                    break;
                case 'order':
                    createOrder(position);
                    break;
                case 'limit':
                    createLimit(position);
                    break;
                case 'join':
                    createJoin(position);
                    break;
                case 'union':
                    createUnion(position);
                    break;
                case 'intersection':
                    createIntersection(position);
                    break;
                case 'difference':
                    createDifference(position);
                    break;
                case 'visualizer':
                    createVisualizer(position);
                    break;
            }
        }, {
            complete: function() {
                processButton.button('enable');
            },
            incomplete: function() {
                processButton.button('disable');
            }
        });

    };

    var createSource = function(position) {
        var config = {
            type: 'source',
            name: 'FUENTE',
            hasInput: false,
            position: position,
            settings: function(context) {

                var settings = $('\
                    <div class="field">\
                        <div class="name">Fuente</div>\
                        <div class="value"><select name="source"></select></div>\
                    </div>\
                ');

                var select = settings.find('select');

                select.append('<option value="">---</option>');
                for (var source in sources) {
                    if (source) {
                        select.append('<option value="'+source+'">'+source+'</option>');
                    }
                }

                return settings;

            },
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.settings.source) {
                        for (var i=0; i < sources[context.settings.source].length; i++) {
                            attributes.push(context.settings.source+"#"+sources[context.settings.source][i]);
                        }
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createProyection = function(position) {
        var config = {
            type: 'proyection',
            name: 'SELECCIONAR',
            position: position,
            settings: function(context) {

                var previous = context.previous[0];

                var customHandlers = previous.getCustomHandlers();
                var previousContext = previous.getContext();

                var attributes = customHandlers.getAttributes(previousContext);

                var settings;
                if (attributes.length > 0) {
                    settings = $('<div></div>');
                    for (var i=0; i < attributes.length; i++) {
                        var attributeParts = attributes[i].split('#');
                        $('<div class="field"><label><input type="checkbox" name="'+attributes[i]+'"> '+attributeParts[1]+' ('+attributeParts[0]+')</label></div>').appendTo(settings);
                    }
                } else {
                    settings = 'No hay columnas para seleccionar';
                }

                return settings;

            },
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = new Array();
                    for (var attribute in context.settings) {
                        if (attribute) {
                            attributes.push(attribute);
                        }
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createCondition = function(position) {
        var config = {
            type: 'condition',
            name: 'CONDICIÓN',
            maxInputConnections: 2,
            position: position,
            settings: function(context) {

                var previous = context.previous[0];

                var customHandlers = previous.getCustomHandlers();
                var previousContext = previous.getContext();

                var attributes1 = customHandlers.getAttributes(previousContext);

                var attributes2 = [];
                if (context.previous.length == 2) {
                    var previous = context.previous[1];

                    var customHandlers = previous.getCustomHandlers();
                    var previousContext = previous.getContext();

                    attributes2 = customHandlers.getAttributes(previousContext);
                }

                if (attributes1.length > 0) {

                    var createCondition = function(config) {

                        config = $.extend({
                            forceInputSide1: false,
                            forceInputSide2: false
                        }, config);

                        var newCondition = $('\
                            <div class="field">\
                                <div class="value">\
                                    <select name="type[]">\
                                        <option value="=">=</option>\
                                        <option value="!=">!=</option>\
                                        <option value=">">></option>\
                                        <option value="<"><</option>\
                                    </select>\
                                </div>\
                            </div>\
                        ');

                        var conditionSide1;
                        var conditionType = $(newCondition.find('select')[0]);
                        var conditionSide2;

                        var insertValueHandler = function(side) {
                            var conditionSide;
                            if (side == 1) {
                                conditionSide = conditionSide1;
                            } else {
                                conditionSide = conditionSide2;
                            }
                            var inputField = $('<input type="text" name="attribute'+side+'[]" />');
                            conditionSide.after(inputField);
                            conditionSide.remove();
                            inputField.focus();
                        };

                        if (!config.forceInputSide1) {
                            conditionSide1 = $('<select name="attribute1[]"></select>');

                            for (var i=0; i < attributes1.length; i++) {
                                var attributeParts = attributes1[i].split('#');
                                conditionSide1.append('<option value="'+attributes1[i]+'">'+attributeParts[1]+' ('+attributeParts[0]+')</option>');
                            }

                            if (attributes2.length > 0) {

                                var insertValue1 = $('<option value="">Ingresar valor</option>');
                                insertValue1.click(function() {
                                    insertValueHandler(1);
                                });
                                conditionSide1.append(insertValue1);

                            }
                        } else {
                            conditionSide1 = $('<input type="text" name="attribute1[]" />');
                        }
                        conditionType.before(conditionSide1);

                        if ((!config.forceInputSide2) && (attributes2.length > 0)) {

                            conditionSide2 = $('<select name="attribute2[]"></select>');

                            for (var i=0; i < attributes2.length; i++) {
                                var attributeParts = attributes2[i].split('#');
                                conditionSide2.append('<option value="'+attributes2[i]+'">'+attributeParts[1]+' ('+attributeParts[0]+')</option>');
                            }

                            var insertValue2 = $('<option value="">Ingresar valor</option>');
                            insertValue2.click(function() {
                                insertValueHandler(2);
                            });
                            conditionSide2.append(insertValue2);

                        } else {
                            conditionSide2 = $('<input type="text" name="attribute2[]" />');
                        }
                        conditionType.after(conditionSide2);

                        var deleteButton = $('<img class=\"remove_button\" src=\"images/FlowDesigner/remove.png\" />');
                        conditionSide2.after(deleteButton);
                        deleteButton.click(function() {
                            newCondition.remove();
                        });

                        return newCondition;

                    };

                    var settings = $('<div></div>');

                    if (context.settings.attribute1) {
                        for (var i=0; i < context.settings.attribute1.length; i++) {
                            settings.append(createCondition({
                                forceInputSide1: ((!context.settings.attribute1) || (!(/^[a-zA-Z0-9_]+#[a-zA-Z0-9_]+$/.test(context.settings.attribute1[i])))),
                                forceInputSide2: ((!context.settings.attribute2) || (!(/^[a-zA-Z0-9_]+#[a-zA-Z0-9_]+$/.test(context.settings.attribute2[i]))))
                            }));
                        }
                    }

                    var addButton = $('<input type="button" value="Agregar" />').button();
                    addButton.click(function() {
                        addButton.before(createCondition());
                    });
                    settings.append(addButton);

                } else {
                    settings = 'No hay columnas para restringir';
                }

                return settings;

            },
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.previous.length > 0) {
                        var previous = context.previous[0];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();
                        attributes = customHandlers.getAttributes(previousContext);
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createOrder = function(position) {
        var config = {
            type: 'order',
            name: 'ORDENAR',
            position: position,
            settings: function(context) {

                var previous = context.previous[0];

                var customHandlers = previous.getCustomHandlers();
                var previousContext = previous.getContext();

                var attributes = customHandlers.getAttributes(previousContext);

                if (attributes.length > 0) {

                    var createOrder = function() {

                        var newOrder = $('\
                            <div class="field">\
                                <div class="value">\
                                    <select name="attribute[]"></select>\
                                    <select name="order[]">\
                                        <option value="asc">ASC</option>\
                                        <option value="desc">DESC</option>\
                                    </select>\
                                </div>\
                            </div>\
                        ');

                        var selectAttribute = $(newOrder.find('select')[0]);
                        var selectOrder = $(newOrder.find('select')[1]);

                        for (var i=0; i < attributes.length; i++) {
                            var attributeParts = attributes[i].split('#');
                            selectAttribute.append('<option value="'+attributes[i]+'">'+attributeParts[1]+' ('+attributeParts[0]+')</option>');
                        }

                        var deleteButton = $('<img class=\"remove_button\" src=\"images/FlowDesigner/remove.png\" />');
                        selectOrder.after(deleteButton);
                        deleteButton.click(function() {
                            newOrder.remove();
                        });

                        return newOrder;

                    };

                    var settings = $('<div></div>');

                    if (context.settings.attribute) {
                        for (var i=0; i < context.settings.attribute.length; i++) {
                            settings.append(createOrder());
                        }
                    }

                    var addButton = $('<input type="button" value="Agregar" />').button();
                    addButton.click(function() {
                        addButton.before(createOrder());
                    });
                    settings.append(addButton);

                } else {
                    settings = 'No hay columnas para ordenar';
                }

                return settings;

            },
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.previous.length > 0) {
                        var previous = context.previous[0];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();
                        attributes = customHandlers.getAttributes(previousContext);
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createLimit = function(position) {
        var config = {
            type: 'limit',
            name: 'LIMITAR',
            position: position,
            settings: function(context) {

                var settings;

                settings = $('\
                    <div class="field">\
                        <div class="name">Desplazamiento</div>\
                        <div class="value"><input type="text" name="offset" /></div>\
                    </div>\
                    <div class="field">\
                        <div class="name">Límite</div>\
                        <div class="value"><input type="text" name="limit" /></div>\
                    </div>\
                ');

                return settings;

            },
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.previous.length > 0) {
                        var previous = context.previous[0];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();
                        attributes = customHandlers.getAttributes(previousContext);
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createJoin = function(position) {
        var config = {
            type: 'join',
            name: 'CONCATENAR',
            maxInputConnections: -1,
            position: position,
            disableSettings: true,
            customHandlers: {
                getAttributes: function(context) {
                    var attributesList = new Array();
                    for (var i=0; i < context.previous.length; i++) {
                        var previous = context.previous[i];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();

                        var attributes = customHandlers.getAttributes(previousContext);

                        for(var j=0; j < attributes.length; j++) {
                            attributesList.push(attributes[j]);
                        }

                    }
                    return attributesList;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createUnion = function(position) {
        var config = {
            type: 'union',
            name: 'UNIÓN',
            maxInputConnections: -1,
            position: position,
            disableSettings: true,
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.previous.length > 0) {
                        var previous = context.previous[0];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();
                        attributes = customHandlers.getAttributes(previousContext);
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createIntersection = function(position) {
        var config = {
            type: 'intersection',
            name: 'INTERSECCIÓN',
            maxInputConnections: -1,
            position: position,
            disableSettings: true,
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.previous.length > 0) {
                        var previous = context.previous[0];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();
                        attributes = customHandlers.getAttributes(previousContext);
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createDifference = function(position) {
        var config = {
            type: 'difference',
            name: 'EXCLUIR',
            maxInputConnections: -1,
            position: position,
            disableSettings: true,
            customHandlers: {
                getAttributes: function(context) {
                    var attributes = [];
                    if (context.previous.length > 0) {
                        var previous = context.previous[0];
                        var customHandlers = previous.getCustomHandlers();
                        var previousContext = previous.getContext();
                        attributes = customHandlers.getAttributes(previousContext);
                    }
                    return attributes;
                }
            }
        };
        FlowDesigner.createComponent(config);
    };

    var createVisualizer = function(position) {
        var config = {
            type: 'visualizer',
            name: 'VISUALIZAR',
            hasOutput: false,
            instancesLimit: 1,
            cleanOnRemove: false,
            position: position,
            disableSettings: true,
            settings: function(context) {

                var settings = $('\
                    <div class="field">\
                        <div class="name">Tipo</div>\
                        <div class="value">\
                            <select name="type">\
                                <option value="line">Lineas</option>\
                                <option value="bar">Barras</option>\
                                <option value="cake">Torta</option>\
                                <option value="bubble">Burbujas</option>\
                            </select>\
                        </div>\
                    </div>\
                    <div class="field">\
                        <div class="value"><label><input type="checkbox" name="table"> incluir tabla</label></div>\
                    </div>\
                ');

                return settings;

            }
        };
        FlowDesigner.createComponent(config);
    };

    this.process = function() {
        var flow = FlowDesigner.getFlow('source');
        $.ajax({
            url: '/?section=process',
            type: 'POST',
            data: {flow: JSON.stringify(flow)},
            dataType: 'html',
            cache: false,
            success: function(data, textStatus, jqXHR) {

                var processDialog = $('<div>'+data+'</div>');
                processDialog.dialog({
                    title: "RESULTADO",
                    closeOnEscape: true,
                    draggable: true,
                    resizable: false,
                    closeText: "Cerrar",
                    minWidth: 500,
                    width: 'auto',
                    buttons: {
                        "Ok": function() {
                            $(this).dialog("close");
                            $(this).remove();
                        }
                    },
                    close: function() {
                        $(this).remove();
                    }
                });

                /*
                    if (data.result) {
                        processDialog.append('<img src="data:image/png;base64,'+data.result+'" />');
                    } else {
                        processDialog.append(data.error);
                    }
                */

            }
        });
    };

};

$(document).ready(function() {
    DataPipe.initialize();
});
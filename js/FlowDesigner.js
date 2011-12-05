var FlowDesigner = new function() {

    var components = new Array();
    var componentsId = 0;
    var currentComponents = new Array();

    var valid = true;
    var connected = true;

    var input = {
        endpoint: "Dot",
        paintStyle: {
            fillStyle: "#5D85A1",
            radius: 6
        },
        isTarget: true,
        maxConnections: 1,
        anchor: "LeftMiddle",
        dropOptions: {
            cursor: 'pointer',
            zIndex: 2000,
            hoverClass: "hover",
            activeClass: "active"
        }
    };

    var output = {
        endpoint: "Rectangle",
        paintStyle: {
            width: 10,
            height: 10,
            fillStyle: "#5D85A1"
        },
        isSource: true,
        connector: ["Flowchart", {stub: 40}],
        anchor: "RightMiddle",
        connectorStyle: {
            lineWidth: 3,
            strokeStyle: "#555"
        },
        connectorHoverStyle: {
            lineWidth: 3,
            strokeStyle: "#000"
        },
        connectorOverlays: [
            ["Arrow", {location: 1}]
        ]
    };

    var completeHandler;
    var incompleteHandler;

    this.initialize = function(createComponentsHandler, config) {

        config = $.extend({
            complete: function() {},
            incomplete: function() {}
        }, config);

        completeHandler = config.complete;
        incompleteHandler = config.incomplete;

        components = $("#components");

        jsPlumb.setRenderMode(jsPlumb.CANVAS);
        jsPlumb.Defaults.Container = components;

        components.droppable({
            drop: function(event, ui) {
                createComponentsHandler(ui.draggable.attr("id"), ui.draggable.position());
            }
        });

        $(".type").draggable({revert: true});

        jsPlumb.bind("jsPlumbConnection", function(event) {

            var sourceComponent = $(event.source[0]).data("component");
            var targetComponent = $(event.target[0]).data("component");

            $(event.target[0]).find('.settings_button').css({
                opacity: 1
            });

            if (sourceComponent.getId() != targetComponent.getId()) {
                sourceComponent.addNext(targetComponent);
                targetComponent.addPrevious(sourceComponent);
                if (!checkValidity()) {
                    jsPlumb.detach(event.connection);
                }
            } else {
                jsPlumb.detach(event.connection);
            }

        });

        jsPlumb.bind("dblclick", function(event) {
            jsPlumb.detach(event.source, event.target);
        });

        jsPlumb.bind("jsPlumbConnectionDetached", function(event) {

            var sourceComponent = $(event.source[0]).data("component");
            var targetComponent = $(event.target[0]).data("component");
            sourceComponent.removeNext(targetComponent);
            targetComponent.removePrevious(sourceComponent);

            if ((targetComponent.hasInput()) && (!targetComponent.hasPrevious())) {
                $(event.target[0]).find('.settings_button').css({
                    opacity: 0.3
                });
            }

            checkValidity();
        });

    };

    var checkValidity = function() {

        var components = currentComponents;

        valid = true;
        connected = true;

        var limits = {};

        for (var i=0; i < components.length; i++) {
            var component = components[i];

            var limit = component.getInstancesLimit();
            if (limit != -1) {
                if (!limits[component.getType()]) {
                    limits[component.getType()] = 0;
                }
                if (limits[component.getType()]+1 <= limit) {
                    limits[component.getType()]++;
                } else {
                    return false; //Limit reached
                }
            }

            var waitingComponents = new Array(component);

            var checked = {};

            while (waitingComponents.length > 0) {
                var examined = waitingComponents.shift();

                if (checked[examined.getId()]) {
                    valid = false;
                    incompleteHandler();
                    return false; //Cycle!
                }

                if (examined.hasOutput()) {
                    if (examined.hasNext()) {
                        waitingComponents.push(examined.getNext());
                    } else {
                        connected = false;
                    }
                }

                if ((examined.hasInput()) && (!examined.hasPrevious())) {
                    connected = false;
                }

                checked[examined.getId()] = true;
            }

        }

        if ((valid) && (connected)) {
            completeHandler();
        } else {
            incompleteHandler();
        }

        return true;

    };

    var Component = function(config) {

        var id = componentsId++;
        var type = config.type;
        var name = config.name;
        var settingsFormHandler = config.settings;
        var hasInput = config.hasInput;
        var hasOutput = config.hasOutput;
        var instancesLimit = config.instancesLimit;
        var customHandlers = config.customHandlers;
        var cleanOnRemove = config.cleanOnRemove;

        var settings = {};
        var next = null;
        var previous = new Array();

        this.getId = function() {
            return id;
        };

        this.getType = function() {
            return type;
        };

        this.getName = function() {
            return name;
        };

        this.getSettingForm = function() {
            return settingsFormHandler({
                next: next,
                previous: previous,
                settings: settings
            });
        };

        this.saveSettings = function(data) {
            settings = data;
        };

        this.getSettings = function() {
            return settings;
        };

        this.hasInput = function() {
            return hasInput;
        };

        this.hasNext = function() {
            return (next != null);
        };

        this.hasOutput = function() {
            return hasOutput;
        };

        this.hasPrevious = function() {
            return (previous.length > 0);
        };

        this.getNext = function() {
            return next;
        };

        this.getPrevious = function() {
            return previous;
        };

        this.removeComponent = function() {
            if (hasInput) {
                for (var i=0; i < previous.length; i++) {
                    previous[i].removeNext();
                }
            }
            if (hasOutput) {
                if (next) {
                    next.removePrevious(this);
                }
            }
            var domComponent = $("#component_"+id);
            if (domComponent[0]) {
                jsPlumb.removeAllEndpoints(domComponent);
                domComponent.fadeOut(function() {
                    domComponent.remove();
                });
            }
        };

        this.addNext = function(component) {
            next = component;
        };

        this.removeNext = function() {
            next = null;
        };

        this.addPrevious = function(component) {
            previous.push(component);
        };

        this.removePrevious = function(component) {
            for (var i=0; i < previous.length; i++) {
                if (previous[i].getId() == component.getId()) {
                    previous.splice(i, 1);
                    break;
                }
            }
            if (cleanOnRemove) {
                settings = {};
            }
        };

        this.getInstancesLimit = function() {
            return instancesLimit;
        };

        this.getCustomHandlers = function() {
            return customHandlers;
        };

        this.getContext = function() {
            return {
                next: next,
                previous: previous,
                settings: settings
            };
        };

    };

    /* Config object:
        {
            type: '', //Type identifier
            name: '', //Name to display
            hasInput: true, //true to add an input endpoint
            hasOutput: true, //true to add an ouput endpoint
            maxInputConnections: 1, //maximum number of input connections, -1 for not limit
            instancesLimit: -1, //Maximum number of instances of this type
            cleanOnRemove: true, //Clean settings when the input changes
            disableSettings: false, //Disable settings buttom
            position: { //Start position
                top: 0,
                left: 0
            },
            settings: function(context) {}, //Settings form
            customHandlers: {} //Custom handlers that to help other components
        }
    */
    this.createComponent = function(config) {

        config = $.extend({
            type: '',
            name: '',
            hasInput: true,
            hasOutput: true,
            maxInputConnections: 1,
            instancesLimit: -1,
            cleanOnRemove: true,
            disableSettings: false,
            position: {
                top: 0,
                left: 0
            },
            settings: function() {},
            customHandlers: {}
        }, config);

        var component = new Component(config);

        currentComponents.push(component);

        if (!checkValidity()) {
            FlowDesigner.removeComponent(component.getId());
            return;
        }

        var flowComponent = $("<div class=\"component\" id=\"component_"+component.getId()+"\">"+component.getName()+"</div>");

        flowComponent.data({
            component: component
        });

        var removeButton = $("<img class=\"remove_button\" src=\"images/FlowDesigner/remove.png\" />");
        removeButton.appendTo(flowComponent);

        removeButton.click(function(event) {

            var remove = $("<div class=\"remove\">¿Seguro que desea eliminar el componente?</div>");

            remove.dialog({
                title: "ELIMINAR "+component.getName(),
                closeOnEscape: true,
                draggable: true,
                resizable: false,
                closeText: "Cerrar",
                minWidth: 300,
                width: 'auto',
                buttons: {
                    "Eliminar": function() {
                        FlowDesigner.removeComponent(component.getId());
                        $(this).dialog("close");
                        $(this).remove();
                    },
                    "Cancelar": function() {
                        $(this).dialog("close");
                        $(this).remove();
                    }
                },
                close: function() {
                    $(this).remove();
                }
            });

        });

        if (!config.disableSettings) {
            var settingsButton = $("<img class=\"settings_button\" src=\"images/FlowDesigner/settings.png\" />");
            settingsButton.appendTo(flowComponent);

            if (config.hasInput) {
                settingsButton.css({
                    opacity: 0.3
                });
            }

            settingsButton.click(function(event) {

                if ((component.hasInput()) && (!component.hasPrevious())) {
                    return;
                }

                var settings = $("<div class=\"settings\"></div>");
                settings.append(component.getSettingForm());
                js2form(settings[0], component.getSettings());

                settings.dialog({
                    title: "CONFIGURAR "+component.getName(),
                    closeOnEscape: true,
                    draggable: true,
                    resizable: false,
                    closeText: "Cerrar",
                    minWidth: 300,
                    width: 'auto',
                    buttons: {
                        "Guardar": function() {
                            component.saveSettings(form2js(this));
                            $(this).dialog("close");
                            $(this).remove();
                        },
                        "Cancelar": function() {
                            $(this).dialog("close");
                            $(this).remove();
                        }
                    },
                    close: function() {
                        $(this).remove();
                    }
                });

            });
        }

        flowComponent.appendTo(components);

        flowComponent.css(config.position);
        if (config.hasInput) {
            input.maxConnections = config.maxInputConnections;
            jsPlumb.addEndpoint(flowComponent, input);
        }
        if (config.hasOutput) {
            jsPlumb.addEndpoint(flowComponent, output);
        }
        jsPlumb.draggable(flowComponent, {
            containment: components,
            start: function() {
                flowComponent.click();
            }
        });

        flowComponent.click(function(event) {
            $(".selected").removeClass("selected");
            $(this).addClass("selected");
        });

    };

    this.removeComponent = function(id) {
        for (var i=0; i < currentComponents.length; i++) {
            if (currentComponents[i].getId() == id) {
                currentComponents[i].removeComponent();
                currentComponents.splice(i, 1);
                break;
            }
        }
    };

    this.isValid = function() {
        return valid;
    };

    this.isConnected = function() {
        return connected;
    };

    this.getFlow = function(startType) {

        if ((!valid) || (!connected) || (!startType) || (startType.length == 0)) {
            return;
        }

        if (!$.isArray(startType)) {
            startType = [startType];
        }

        var flow = new Array();

        var components = currentComponents;

        for (var i=0; i < components.length; i++) {
            var component = components[i];

            if ($.inArray(component.getType(), startType) != -1) {

                var waitingComponents = new Array(component);

                while (waitingComponents.length > 0) {
                    var examined = waitingComponents.shift();

                    if (examined.hasNext()) {
                        waitingComponents.push(examined.getNext());
                    }

                    flow.push({
                        id: examined.getId(),
                        type: examined.getType(),
                        settings: examined.getSettings(),
                        previousCount: examined.getPrevious().length
                    });
                }

            }

        }

        return flow;

    };

};
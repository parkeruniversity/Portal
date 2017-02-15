;(function ( $, window, document, undefined ) {

    //global vars
    var peopleChooserPlugin = "peopleChooser",
        peopleChooserData = "plugin_" + peopleChooserPlugin;       

    //boilerplate plugin logic
    $.fn.peopleChooser = function ( options ) {

        var args, chooser;

        // only allow the plugin to be instantiated once
        if (!( this.data( peopleChooserData ) instanceof PeopleChooser )) {
            this.data(peopleChooserData, new PeopleChooser(this, options));
        }

        chooser = this.data( peopleChooserData );

        if (typeof options === 'undefined' || typeof options === 'object') {
            if ( typeof chooser['render'] === 'function' ) {
                chooser.render();
            }
        } else if (typeof options === 'string' && typeof chooser[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return chooser[options].apply( chooser, args );

        }
        else if (options === 'destroy') { 
            this.removeData(peopleChooserData);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + peopleChooserPlugin);
        }
        return this;
    };

    //people chooser object/logic
    function PeopleChooser(element, options) {
        var pc = this;
        pc.render = render;
        pc.getPeople = getPeople;
        pc.addPeople = addPeople;
        pc.setRoles = setRoles;
        pc.openModal = openModal;

        var _ctr = element, _peopleSearch = null, _roleSeletor = null, _selectableCtr = null, _selectedCtr = null, _prev = null, _more = null,
            _settings = null, _options = $.extend(getDefaults(), options), _selectedPeople = [], _modalLink = null, _modalSelectedPeople=[], _isOpen = false;

        //verify blockUI exists
        if (!jQuery().block)
            $.getScript("UI/Common/Scripts/jquery.blockui.js");

        function render() {
            //get settings THEN render control
            _ctr.empty();
            renderPlaceholder(_options.showFull);

            $.get('rpc/peoplechooser/GetSettings/?contextId=' + _options.contextId, function (settings) {
                _settings = settings;
                _ctr.empty();

                if (_options.roles == null || _options.roles.length == 0)
                    _options.roles = [_settings.defaultRoleId];

                processModal();

                if (_options.showFull)
                    renderFull();
                else
                    renderAutoComplete();

            }).done(function(e) { _options.loaded(); })
                .fail(function (e) { console.error(e.responseText); });
        }

        function getDefaults() {
            //default settings per instance
            return  {
                showFull: false,
                showHostId: false,
                showContextOnly:false,
                onSelect: function (obj) { },
                onRemove: function (obj) { },
                loaded: function () { },
                resultCount: 15,
                contextId: '',
                initPeople: [],
                initPeopleIds: [],
                roles: [],
                modal: null, //{title: '', okTxt: '', cancelTxt:'', openTxt:'', onOk:func(people), onCancel:func(people), onClose:func(people)}
                watermark: '',
                peopleSource: 'rpc/peoplechooser/GetSearchResults',
            };
        }

        function processModal() {
            if (_options.modal == null) return;

            var modal = $("<div title='" + _options.modal.title + "' >");
            _modalLink = $("<a href='#' class='pc-modalLink'>").text(_options.modal.openTxt).unbind('click').click(function (e) { e.preventDefault(); modal.dialog("open"); });

            _ctr.append(_modalLink).append(modal);
            _ctr = modal; //rendering will append to this control now.
            modal.dialog({
                autoOpen: false, width: _options.showFull ? 700 : 250, resizable: false, modal: true,
                dialogClass: "pc-modal", draggable: false, closeOnEscape: false,
                buttons: [{ text: _options.modal.okTxt, click: function () { $(this).data("pc-save", true); $(this).dialog("close"); }, 'class': 'pc-ok' }],
                open: function (event, ui) {
                    _isOpen = true;
                    _modalSelectedPeople = _selectedPeople.slice(0); //copy
                    if ($(this).parent().find(".ui-dialog-buttonpane > a.pc-cancel").length == 0) {
                        $('<a />', { 'class': 'pc-cancel', text: _options.modal.cancelTxt, href: '#' })
                            .appendTo($(this).parent().find(".ui-dialog-buttonpane")).click(function (e) {
                                e.preventDefault();
                                modal.dialog('close');
                            });
                    }
                },
                beforeClose: function () {
                    _isOpen = false;
                    if ($(this).data("pc-save")) {
                        _selectedPeople = _modalSelectedPeople.splice(0);
                        _modalSelectedPeople.length = 0;
                        if (_options.modal.onOk != null)
                            _options.modal.onOk(_selectedPeople);
                    } else {
                        _modalSelectedPeople.length = 0;
                        if (_options.modal.onCancel != null)
                            _options.modal.onCancel(_selectedPeople);
                    }
                    $(this).removeData("pc-save");
                    rebind();
                    if (_options.modal.onClose != null)
                        _options.modal.onClose(_selectedPeople);
                }
            }); 
        }

        function renderFull() {
            var wrapperCtr = $("<div class='peoplechooser pc-full'>");
            if (_options.contextId != '' && !_options.showContextOnly && _settings.contextName != '') {
                var contextChooser = $("<div class='pc-contextChooser'>")
                    .append($("<span>").html(_settings.g11n.show))
                    .append($("<input type='radio' name='context' value='' id='radAll' >").prop('checked', true).click(function () { bindRoles($(this).val()); }))
                    .append($("<label for='radAll'>").html(_settings.g11n.allUsers))
                    .append($("<input type='radio' name='context' value='" + _options.contextId + "' id='radContext' >").click(function () { bindRoles($(this).val()); }))
                    .append($("<label for='radContext'>").html(_settings.g11n.usersIn));
                wrapperCtr.append(contextChooser);
            }
            var filterCtr = $("<div class='pc-filter'>");
            filterCtr.append($("<span class='pc-filter-txt'>").html(_settings.g11n["filterBy"]));
            _peopleSearch = $("<input type='text' class='pc-filterbox'/> ");
            applyWatermark(_peopleSearch);
            _peopleSearch.appendTo(filterCtr);
            filterCtr.append(" " +_settings.g11n["andOr"] + " ");
            _roleSeletor = $(" <select />");
            _roleSeletor.appendTo(filterCtr);
            filterCtr.appendTo(wrapperCtr);
            _selectableCtr = $("<div class='pc-selectable pc-selection-area'></div>");
            _selectedCtr = $("<div class='pc-selected pc-selection-area'></div>");
            var selectableWrapper = $("<div class='pc-selectable-wrapper'>").append($("<span class='pc-selectable-header'>").html(_settings.g11n.clickToAdd));
            var selectedWrapper = $("<div class='pc-selected-wrapper'>").append($("<span class='pc-selected-header'>").html(_settings.g11n.clickToRemove));
            selectableWrapper.append(_selectableCtr);
            selectedWrapper.append(_selectedCtr);
            wrapperCtr.append(selectableWrapper).append(selectedWrapper);
            var actionCtr = $("<div class='pc-action'>");
            var leftCtr = $("<div class='pc-selectable-wrapper'>");
            _prev = $("<a class='pc-prev'><i class='fa fa-angle-double-left'></i> " + _settings.g11n["prev"] + "</a>").addClass('pc-disabled'); //init pageNum will be 1
            _more = $("<a class='pc-more'>" + _settings.g11n["more"] + " <i class='fa fa-angle-double-right'></i></a>");
            leftCtr.append(_prev.append("&nbsp;")).append(_more);
            var remove = $("<a class='pc-removeAll'><i class='fa fa-minus-circle'></i> " + _settings.g11n["removeAll"] + "</a>");
            var rightCtr = $("<div class='pc-selected-wrapper'>");
            rightCtr.append(remove);
            actionCtr.append(leftCtr).append(rightCtr);
            wrapperCtr.append(actionCtr).appendTo(_ctr);

            _prev.click(function (e) { processPaging(e, $(this), _more, false);  });
            _more.click(function (e) { processPaging(e, _prev, $(this), true); });
            remove.click(function (e) { e.preventDefault(); _selectedCtr.find("div.pc-item").each(function () { moveContainers($(this)); }); });

            addPeople(_options.initPeople);
            processInitPeopleIds();
            bindRoles(_options.contextId != '' && _options.showContextOnly ? _options.contextId : '');
            keyUpTrigger(_peopleSearch, function () { search(1); });
        }

        function processPaging(e, prev, more, isMore) {
            e.preventDefault();
            if (isMore) {
                if (more.hasClass('pc-disabled')) return;
                prev.removeClass('pc-disabled');
                search(_selectableCtr.data("pgNum") + 1,function (users) { if (users.length < _options.resultCount) more.addClass('pc-disabled'); });
            } else {
                if (prev.hasClass('pc-disabled')) return;
                more.removeClass('pc-disabled');
                var pgNum = _selectableCtr.data("pgNum");
                search(pgNum > 1 ? pgNum - 1 : 1,function (users){ if(pgNum <= 2 ){ prev.addClass('pc-disabled');}});
            }
        }
        function renderPlaceholder(isFull) {
            if (isFull) return;
            var div = $("<div class='peoplechooser pc-small'>");
            $("<input type='text' class='pc-autocomplete' disabled='disabled'>").appendTo(div).after($("<i class='fa fa-search'></i>"));
            _ctr.append(div);
        }

        function renderAutoComplete() {
            var wrapperCtr = $("<div class='peoplechooser pc-small'>");
            _peopleSearch = $("<input type='text' class='pc-autocomplete'>").appendTo(wrapperCtr).after($("<i class='fa fa-search'></i>"));
            wrapperCtr.appendTo(_ctr);
            addPeople(_options.initPeople);
            applyWatermark(_peopleSearch);

            _peopleSearch.autocomplete({
                source: function (request, response) {
                    processRequest(request.term, '', $.map(_options.roles, function (role) { return role; }).join(','), 1, function (names) { response(names); });
                },
                minLength: 2,
                focus: function (event, ui) {
                    _peopleSearch.val(ui.item.name);
                    return false;
                },
                select: function (event, ui) {
                    if(_options.modal == null)
                        _selectedPeople = [ui.item];
                    else
                        _modalSelectedPeople = [ui.item];
                   
                    _options.onSelect(ui.item);
                    return false;
                },
                change: function (event, ui) {
                    var tempArray = getPeopleArray();
                    if (tempArray != null && tempArray.length > 0 && _peopleSearch.val() != tempArray[0].name) {
                        tempArray.length = 0;
                    }
                }
            })
            .data("ui-autocomplete")._renderItem = function (ul, person) {
                if (!ul.hasClass('pc-autocomplete-menu'))
                    ul.addClass('pc-autocomplete-menu');

                return $("<li>").append($("<a>").append(getPersonTemplate(person,false, false))).appendTo(ul);
            };
        }

        function applyWatermark(ctr) {
            if (_options.watermark.length == 0 || ctr.val().length > 0) return;

            ctr.val(_options.watermark);
            ctr.addClass('pc-watermark');
            ctr.focus(function () {
                var input = $(this);
                if (input.val() == _options.watermark) {
                    input.val('');
                    input.removeClass('pc-watermark');
                }
            });
            ctr.blur(function() {
                var inputCtr = $(this);
                if (inputCtr.val() == '') {
                    inputCtr.val(_options.watermark);
                    inputCtr.addClass('pc-watermark');
                }
            });
        }

        function getPersonTemplate(person, showInfo, isSelected) {
            var personWrapper = $("<div class='pc-item'>");
            personWrapper.data('personInfo', person);
            if (_options.showFull)
                personWrapper.append("<i class='fa pc-fa " + (isSelected ? "fa-minus-circle" : "fa-plus-circle") + "'>");

            if (person.imgUrl != null) {
                if (!_options.showFull || (_options.showFull && isSelected))
                    personWrapper.append("<i class='fa pc-fa-selected fa-check'>");
                personWrapper.append("<img class='pc-itemImg' src='" + person.imgUrl + "'></image>");
            }
            if (person.myInfoHtml != null && showInfo) {
                personWrapper.append(person.myInfoHtml);
                personWrapper.find("[type='image']").click(function(e) { e.preventDefault(); return false; });
            }
            var personName = $("<div class='pc-name'>"); //name info start
            personName.append("<strong>" + person.name + "</strong>");
            if (person.isCurrentUser)
                personName.append(" <span class='pc-me'>(" + _settings.g11n["me"] +")</span>");
            if (person.hostId != null)
                personName.append("<span class='pc-itemId'>(" + person.hostId + ")</span>");
            if (person.roles != null)
                personName.append("<span class='pc-itemRoles'>" + person.roles + "</span>");
            if (person.details != null)
                personName.append($("<span class='pc-details'>").html(person.details));
            personName.appendTo(personWrapper);

            return personWrapper;
        }

        function bindRoles(contextId) {
            $.get('rpc/peoplechooser/GetRoles/?contextId=' + contextId, function (baseRoles) {
                _roleSeletor.empty();
                _roleSeletor.data('contextId', contextId);
                $.each(baseRoles, function (i, role) {
                    _roleSeletor.append($("<option>").val(role.key).html(role.value));
                });
                search(1); //kick off the initial load
            }).fail(function (e) { console.error(e.responseText); });

            _roleSeletor.unbind('change').change(function () { search(1); });
        }

        var timer = null;
        function keyUpTrigger(keyupCtr, triggerMethod) {
            keyupCtr.keyup(function (e) {
                clearTimeout(timer);
                if (e.keyCode == 10 || e.keyCode == 13) {
                    triggerMethod();
                    return;
                }
                timer = setTimeout(function () { triggerMethod(); }, 500);
            });
        }

        function search(pageNumber, postSearchAction) {
            var searchTerm =  _peopleSearch.val() == _options.watermark ? "":_peopleSearch.val(); 
            var roleId = _roleSeletor.val();
            if (roleId == null || $.trim(roleId) == '') {
                _selectableCtr.html('');
                return;
            }

            _selectableCtr.block({ message: '<div class="pc-loading"><img src="ui/common/images/PortletImages/Icons/ajax_loader_large.gif"/> ' + _settings.g11n["loading"] + '</div>', css: { border: 'none', background: 'transparent', cursor: 'default' }, overlayCSS: { backgroundColor: '#000', opacity: 0.2 } });

            processRequest(searchTerm, _roleSeletor.data('contextId'), roleId, pageNumber, function(users) {
                _selectableCtr.html('').data("pgNum", pageNumber);
                $.each(users, function(i, user) {
                    $(getPersonTemplate(user, true, false)).appendTo(_selectableCtr).click(function() { moveContainers($(this)); });
                });
                _selectableCtr.unblock();

                if (postSearchAction != null) {
                    postSearchAction(users);
                }
            });
        }

        function processRequest(searchTerm, contextId, roleIds, pageNumber, processAction) {

            $.get(_options.peopleSource, { term: searchTerm, contextId: contextId, roleIds: roleIds, showHostId: _options.showHostId, pageNum: pageNumber, perPageNum: _options.resultCount, excludedIds: (!_options.showFull ? '' : $.map(getPeopleArray(), function (person) { return person.id; }).join(',')) },
                function (users) { processAction(users); }).fail(function (e) { console.error(e.responseText); });
        }

        function moveContainers(personElem) {
            var person = personElem.data('personInfo');
            var exists = false;
            if (personElem.parent()[0] === _selectableCtr[0]) {
                //moving to selected container
                _selectedCtr.find("div.pc-item").each(function() {
                    if ($(this).data('personInfo').id == person.id)
                        exists = true;
                });
                if (!exists) {
                    personElem.appendTo(_selectedCtr);
                    personElem.find("i.pc-fa").removeClass('fa-plus-circle').addClass('fa-minus-circle');
                    if (!personElem.has('i.pc-fa-selected').length)
                        personElem.find("img.pc-itemImg").before("<i class='fa pc-fa-selected fa-check'>");
                    getPeopleArray().push(person);
                    _options.onSelect(person);
                }
                    
            } else {
                //move back to selectable, need to find where to add it
                var index = -1;
                var name = personElem.find("strong").text();
                _selectableCtr.find("div.pc-item").each(function (i) {
                    if ($(this).data("personInfo").id == person.id) {
                        exists = true;
                        return false;
                    }

                    if ($(this).find("strong").text() >= name) {
                        index = i;
                        return false;
                    }
                });

                getPeopleArray().splice($.inArray(person, getPeopleArray()), 1);
                _options.onRemove(person);

                if (exists) {
                    personElem.remove();
                    return;
                }
                if (index != -1)
                    personElem.insertBefore(_selectableCtr.find("div.pc-item")[index]);
                else
                    personElem.appendTo(_selectableCtr);
                personElem.find("i.pc-fa").removeClass('fa-minus-circle').addClass('fa-plus-circle');
            }
        }

        function processInitPeopleIds() {
            if (_options.initPeopleIds == null || _options.initPeopleIds.length == 0) return;

            $.ajax({
                type: 'GET',
                async: false, //load users before moving on (freeze thread)
                data:{ ids: options.initPeopleIds.join(","), showHostId: _options.showHostId },
                url: 'rpc/peoplechooser/GetInitPeople/',
                success: function (people) {
                    addPeople(people);
                },
                error:function(jqXHR, textStatus, errorThrown ){console.error(errorThrown);} 
            });
        }

        function addPeople(people) {
            if (people == null) return;
            if (!(people instanceof Array) && isPerson(people))
                people = [people]; //if passing in a person object

            var person = null;
            if (!_options.showFull) { //autocomplete
                person = people[0];
                if (isPerson(person)) {
                    _selectedPeople = [person]; //only accept 1
                    _peopleSearch.val(person.name);
                }
            } else {
                $.each(people, function (i,x) {
                    person = x;
                    if (!isPerson(person)) return;
                    $(getPersonTemplate(person, true, true)).appendTo(_selectedCtr).click(function () { moveContainers($(this)); });
                    _selectedPeople.push(person);
                });
            }
        }

        function rebind() {
            var person = null;
            if (!_options.showFull) { //autocomplete
                person = _selectedPeople[0];
                _peopleSearch.val(isPerson(person) ? person.name : '');    
            } else {
                _selectedCtr.html('');
                $.each(_selectedPeople, function (i, x) {
                    person = x;
                    if (!isPerson(person)) return;
                    $(getPersonTemplate(person, true, true)).appendTo(_selectedCtr).click(function () { moveContainers($(this)); });
                });
                search(1);
                _prev.addClass('pc-disabled');
                _more.removeClass('pc-disabled');
            }
        }

        function getPeopleArray() {
            return _options.modal != null && _isOpen ? _modalSelectedPeople : _selectedPeople;
        }

        function getPeople() {
            return _selectedPeople;
        }

        function setRoles(roles) {
            if (roles == null || roles.length == 0 || !(roles instanceof Array))
                _options.roles = [_settings.defaultRoleId];
            else
                _options.roles = roles;
        }

        function openModal() {
            if (_modalLink != null)
                _modalLink.click();
        }

        function isPerson(person) {
            return person != null && person.id != undefined && person.name != undefined;
        }
    }

}(jQuery, window, document));
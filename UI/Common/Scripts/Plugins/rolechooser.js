; (function ($, window, document, undefined) {
    //global vars
    var roleChooserPlugin = "roleChooser",
        roleChooserData = "plugin_" + roleChooserPlugin;

    //boilerplate plugin logic
    $.fn.roleChooser = function (options) {

        var args, chooser;

        // only allow the plugin to be instantiated once
        if (!(this.data(roleChooserData) instanceof RoleChooser)) {
            this.data(roleChooserData, new RoleChooser(this, options));
        }

        chooser = this.data(roleChooserData);

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof chooser['render'] === 'function') {
                chooser.render();
            }
        } else if (typeof options === 'string' && typeof chooser[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return chooser[options].apply(chooser, args);

        }
        else if (options === 'destroy') {
            this.removeData(roleChooserData);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + roleChooserPlugin);
        }
        return this;
    };

    function RoleChooser(element, options) {
        var rc = this;
        rc.render = render; _options
        rc.getRoles = getRoles;

        var _ctr = $("<div class='rc-container'>"), _options = $.extend(getDefaults(), options), _g11n =[];

        element.empty().append(_ctr);

        function render() {
            var filter = { selectedRoleIds :_options.roleIds != null ? _options.roleIds.join(',') : '',
                contextIds:_options.showContextIds != null ? _options.showContextIds.join(',') : '',
                showGuestRole: _options.showGuest, showBaseRoles: _options.showBaseRoles, showOtherCourses: _options.showCourses };

            $.get(_options.roleSource, filter, function (rc) { renderRoles(rc); _options.loaded(); }).fail(function (e) { console.error(e.responseText); });
        }

        function getDefaults() {
            return {
                roleIds: [], //guids
                showContextIds: [], //guids
                loaded: function () { },
                showGuest: false,
                showCourses: false,
                showBaseRoles: true,
                modal: null, //{title: '', okTxt: '', cancelTxt:'', openTxt:'', onOk:func(roles), onCancel:func(), onClose:func()}
                roleSource: 'rpc/rolechooser/GetRoles',
            };
        }

        function renderRoles(roleChooser) {
            _g11n = roleChooser.g11n;
            if (roleChooser.contextRoles != null) {
                $.each(roleChooser.contextRoles, function (i, contextRole) {
                    renderContextRole(_ctr, contextRole, '');
                });
            }
            renderCourses(roleChooser.otherRoles);
            renderContextRole(_ctr, roleChooser.baseRoles, 'rc-context-base');
            renderGuestBaseRole(roleChooser);
            processModal();
        }

        function renderCourses(otherRoles) {
            if (!_options.showCourses || otherRoles == null || otherRoles.length == 0) return;

            var wrapper = $("<div class='rc-context-course' style='display:none'>");
            $.each(otherRoles, function(i, other) {
                renderContextRole(wrapper, other, '');
            });
            _ctr.append(wrapper);
            _ctr.append($("<a href='' class='rc-mycourses'>").html(_g11n.chooseMyCourses)
                .click(function (e) {
                    e.preventDefault();
                    var isShowing = wrapper.css('display') == 'none';
                    $(this).html(isShowing ? _g11n.chooseCurrentCourses : _g11n.chooseMyCourses);
                    wrapper.slideToggle('slow');
                    if (!isShowing) { //clear selections
                        $("div.rc-context-course input:checked").each(function(i, input) { $(input).prop('checked', false).attr('disabled',false); } );
                    }
                }));
        }

        function renderGuestBaseRole(roleChooser) {
            if (!_options.showGuest || roleChooser.guestRole == null || roleChooser.baseRoles == null) return;

            var baseContextId = roleChooser.baseRoles.id;
            var guestSelector = $("<div class='rc-guest-selector'>").append($("<label>").html(_g11n.includeGuests).prepend($("<input type='checkbox'>").prop('checked', roleChooser.guestRole.isSelected).data('role',roleChooser.guestRole)));
            _ctr.find('div.rc-context').filter(function () { return $(this).data('contextRole').id == baseContextId; })
                .find('div.rc-context-everyone').append(guestSelector);    
        }

        function renderContextRole(ctr, contextRole, css) {
            if (contextRole == null || contextRole.roles == null || contextRole.roles.length == 0) return;

            var contextWrapper = $("<div class='rc-context " + css +"'>").data('contextRole', contextRole);
            contextWrapper.append($("<div class='rc-context-name'>").html(stringUtil.format(_g11n.rolesIn, contextRole.name)));
            if(contextRole.description != null && contextRole.description.length > 0)
                contextWrapper.append($("<div class='rc-context-description'>").html(contextRole.description));
            var everyone = $("<div class='rc-context-everyone'>");
            everyone.append($("<label>").html(stringUtil.format(_g11n.everyoneIn,contextRole.name))
                            .prepend($("<input type='checkbox'>").click(function () {
                                var isChecked = $(this).prop('checked');
                                contextWrapper.find('div.rc-selectors input').each(function(i, input) {
                                    $(input).prop('checked', isChecked).attr("disabled", isChecked);
                                    $(input).parent().removeClass().addClass(isChecked ? 'rc-disabled-selector' : '');
                                });
                            })
            ));
            contextWrapper.append(everyone);

            var halfCount = Math.ceil(contextRole.roles.length / 2);
            var left = $("<ul>");
            var right = $("<ul>");
            $.each(contextRole.roles, function (i, role) {
                var container = (i < halfCount ? left : right);
                container.append($("<li>").append($("<label>").html(role.name).prepend($("<input type='checkbox'>").prop('checked', role.isSelected).data('role',role))));
            });
            var selectors = $("<div class='rc-selectors'>");
            selectors.append($("<div class='rc-first-column' >").append(left)).append($("<div class='rc-second-column' >").append(right));
            contextWrapper.append(selectors);
            ctr.append(contextWrapper);
        }
        
        function processModal() {
            if (_options.modal == null) return;

            _ctr.attr('title', _options.modal.title);
            var modalLink = $("<a class='rc-modalLink'>").text(_options.modal.openTxt).click(function () { _ctr.dialog("open"); });
            _ctr.after(modalLink);

            var actions = $("<div class='rc-actions'>");
            var save = $("<button class='rc-save'>").html(_options.modal.okTxt).click(function() {
                if (_options.modal.onOk != null)
                    _options.modal.onOk(getRoles());
                _ctr.dialog('close');
            });
            var cancel = $("<a href='' class='rc-cancel'>").html(_options.modal.cancelTxt).click(function(e) {
                e.preventDefault();
                _ctr.find("input").each(function(i, input) { //reset selection
                    var cbx = $(input);
                    cbx.prop('checked', cbx.data('role') != null ? _options.roleIds.indexOf(cbx.data('role').id) >= 0  : false).attr('disabled', false);
                });
                if (_options.modal.onCancel != null)
                    _options.modal.onCancel();
                _ctr.dialog('close');
            });
            actions.append(save).append(cancel);
            _ctr.append(actions);
            
            _ctr.dialog({
                autoOpen: false, width: 650, resizable: false, modal: true,
                dialogClass: "rc-modal", draggable: false, closeOnEscape: false,
                beforeClose: function () { if (_options.modal.onClose != null) _options.modal.onClose(); }
            });
        }

        function getRoles() {
            var contexts = [];
            _ctr.find("div.rc-context").each(function(i,e) {
                var context = $(e);
                var tempRoles = [];
                context.find("div.rc-selectors input:checked, div.rc-guest-selector input:checked")
                        .each(function () { var role = $(this).data('role'); role.isSelected = true; tempRoles.push(role); });
                if (tempRoles.length > 0) {
                    var contextRole = context.data('contextRole');
                    contexts.push({ id: contextRole.id, name: contextRole.name, roles: tempRoles });
                }
            });
            return contexts;
        }
    }
}(jQuery, window, document));
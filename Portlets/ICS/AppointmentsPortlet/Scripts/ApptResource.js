; (function ($, window, document, undefined) {
    var apptResource = "apptResource",
        apptResourceData = "plugin_" + apptResource;

    $.fn.apptResource = function (options) {

        var args, apptDets;
        var container = this;

        if (textEditor.exists(getTextEditorCtr(container, options))) {
            textEditor.destroy(getTextEditorCtr(container, options));
        }

        if (!(container.data(apptResourceData) instanceof ApptResource)) {
            container.data(apptResourceData, new ApptResource(container, options));
        }

        apptDets = container.data(apptResourceData);

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof apptDets['render'] === 'function') {
                apptDets.render(options);
            }
        } else if (typeof options === 'string' && typeof apptDets[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return apptDets[options].apply(apptDets, args);

        } else if (options === 'destroy') {
            this.removeData(apptResourceData);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + apptResource);
        }
        return apptDets;
    };
    function getTextEditorCtr(ctr, options) {
        var id = options.id != undefined && options.id != null && options.id.length > 0 ? options.id : '';
        if (ctr.find("#txtDescrip" + id).length == 0)
            ctr.find("#txtDescrip").attr('id', "txtDescrip" + id);

        return ctr.find("#txtDescrip" + id);
    }

    function ApptResource(elem, options) {
        var appt = this, _ctr = $(elem), _g11n = options.g11n, _options = $.extend(getDefaultOptions(), options), _defaultImg ='ui/common/images/PortletImages/Icons/resource-default-image.gif';
        appt.render = render;
        appt.editEnabled = editEnabled;

        function getDefaultOptions() {
            return { resource: null, id: '', portletId: '', controller: {}, apptApp: {}, g11n: null, createResource: false, isCampus: false, userName: '', onCancel: function (resource) { }, onSave: function (resource) { }, onDelete: function (resource) { }, onBeforeEdit: function (resource) { } }
        }

        function render(apptOptions) {
            _ctr.empty();
            _options = $.extend(getDefaultOptions(), apptOptions);
            if (_options.resource != null)
                _options.id = _options.resource.id;

            $.ajax({
                type: 'GET',
                async: false,
                url: 'portlets/ics/appointmentsportlet/templates/apptResource.htm',
                success: function (source) {
                    var template = Handlebars.compile(source);
                    var temp = $(template({ g11n: _options.g11n }));
                    _ctr.empty();
                    _ctr.append(temp);
                    _ctr.find(".rg-edit, .rg-render").hide();
                    if (_options.id != '')
                        renderResource();
                    else if (_options.createResource)
                        renderEdit();
                    else _ctr.empty();
                }
            });
        }
        function renderResource() {
            _ctr.find(".rg-edit").hide();

            var resource = getResource();
            if (resource == null) return;

            _ctr.find(".rg-render").show();
            _ctr.find(".rg-name").html(resource.name);
            _ctr.find(".rg-location").html(resource.location);
            _ctr.find(".rg-description").html(resource.description);
            _ctr.find(".rg-render .rg-img").attr('src', resource.imgUrl != null && resource.imgUrl.length > 0 ? resource.imgUrl : _defaultImg);

            if (resource.canEdit) {
                _ctr.find("#btnEditRG").unbind('click').click(function () { _options.onBeforeEdit(resource); renderEdit(); }).show();
                _ctr.find(".rg-managers-hosts").show();
                renderUsers(resource.managers, false);
                renderUsers(resource.hosts, true);
                _ctr.find("#manageHosts").unbind('click').click(function (e) {
                    e.preventDefault();
                    $.apptManageHosts({
                        g11n: _options.g11n, resource: resource, isResource: true, portletId: _options.portletId,
                        onSave: function (res) { _options.resource = res; renderResource(); }
                    });
                });
            } else
                _ctr.find("#btnEditRG, .rg-managers-hosts").hide();

            if (_options.isCampus) {
                _ctr.find(".rg-name").addClass('rg-lnk-action').click(function () { _options.apptApp.history = { name: 'campus resource', view: 'campus', isSchedule: false }; _options.controller.transitionTo('scheduleResource', resource.id); });
                _ctr.find("#btnEditRG").html("<i class='fa fa-pencil'></i> " + _options.g11n.edit);
            }
        }
        function renderUsers(users, isHost) {
            _ctr.find("#" + (isHost ? 'hostsRender' : 'managersRender') + " , #"  + (isHost ? 'hosts' : 'managers')).html($(users).map(function (i, u) { return u.name; }).toArray().join(', '));
        }
        function renderEdit() {
            _ctr.find(".rg-edit").show();
            _ctr.find(".rg-render").hide();
            bindResource();
        }
        function getResource() {
            if (_options.resource != null) {
                $(".rg-wrapper").data('resource', _options.resource);
                return _options.resource;
            }

            var resource = _ctr.find(".rg-wrapper").data('resource');
            if (_options.id != '' && (resource == null || resource.id == null || resource.id == '')) {
                $.ajax({
                    type: 'GET',
                    async: false,
                    url: 'rpc/appointmentsSettings/GetResource?id=' + _options.id + "&portletId=" + _options.portletId,
                    success: function (ret) {
                        resource = ret;
                        $(".rg-wrapper").data('resource', resource);
                    }
                });
            }
            return resource;
        }
        function editEnabled(isEnabled) {
            if (!isEnabled)
                _ctr.find("#btnEditRG").attr('disabled', 'disabled');
            else
                _ctr.find("#btnEditRG").removeAttr('disabled');
        }
        function bindResource() {
            var resource = getResource();
            _ctr.find("#saveResource").unbind('click').attr('disabled','disabled').click(function (e) { e.preventDefault(); saveResource(); });
            _ctr.find("#cancelResource").unbind('click').click(function (e) {
                e.preventDefault();
                $.post('rpc/appointmentsSettings/RemoveTempImage?imgUrl=' + _ctr.find('.rg-edit .rg-img').attr('src'));
                if (textEditor.exists(getTextEditorCtr(_ctr, _options))) {
                    textEditor.destroy(getTextEditorCtr(_ctr, _options));
                }
                _options.onCancel(resource);
                if (_options.id != '' && resource != null)
                    renderResource();
            });
            _ctr.find("#txtResourceName").unbind('blur').blur(function () { validateName($(this)); });
            
            if (_options.id == '') {
                _ctr.find("#managers").html(_options.userName.full);
                _ctr.find("#hosts").html(_options.g11n.addHosts);
                _ctr.find(".requiredFilled").show();
                _ctr.find("#btnDeleteRG").hide();
                _ctr.find(".rg-create-header").html(_options.g11n.createResource).show();
                _ctr.find(".rg-img-placeholder").attr('src', _defaultImg);
            } else if(resource != null) {
                //get resource and bind values
                _ctr.find("#saveResource").removeAttr('disabled');
                _ctr.find("#txtResourceName").removeClass('invalidItem');
                _ctr.find(".resourceNameWrapper > .invalidItem").remove();
                _ctr.find(".rg-create-header").html(_options.g11n.editResource).show();
                _ctr.find("#txtResourceName").val(resource.name);
                _ctr.find("#txtResourceLocation").val(resource.location);
                renderUsers(resource.managers, false);
                renderUsers(resource.hosts, true);
                getTextEditorCtr(_ctr, _options).val(resource.description);

                //need to set confirm's ID since confirm div gets moved to end of <body> (multiple instances on campus resource view)
                _ctr.find("#btnDeleteRG").unbind('click').click(function () { bindConfirmModalCtr($("#confirm" + resource.id), _options.g11n.deleteResourceQuestion, _options.g11n.deleteResourceInfo, _options.g11n.keepResource, _options.g11n.deleteResource, deleteResource); }).show();
                _ctr.find(".confirmModal").attr('id', "confirm" + resource.id).dialog({ autoOpen: false, modal: true, draggable: false, resizable: false, width: 570, dialogClass: 'confirmModalWrapper' });
                if(resource.imgUrl != null && resource.imgUrl.length > 0)
                    renderImage(resource.imgUrl);
                else
                    _ctr.find(".rg-img-placeholder").attr('src', _defaultImg);
            }
            _ctr.find("#lnkRgImg").unbind('click').click(function (e) { e.preventDefault(); bindUploadFileModal(); });
            if (textEditor.exists(getTextEditorCtr(_ctr, options))) {
                textEditor.destroy(getTextEditorCtr(_ctr, options));
            }
            textEditor.create(getTextEditorCtr(_ctr, _options), { height: '150px' });
        }
        function bindUploadFileModal() {
            var modal = $("#uploadImg");
            if (!modal.hasClass(".ui-dialog-content ")) {
                modal.dialog({ autoOpen: false, modal: true, draggable: false, resizable: false, width: 450, dialogClass: 'rg-uploadModal' });
                modal.find("#uploadImgForm").ajaxForm({
                    beforeSend: function () { modal.find("button.activeAction").attr('disabled', 'disabled'); },
                    success: function (img) { modal.dialog('close'); renderImage(img); },
                    error: function () { alert('an error occurred during image upload'); }
                });
            }
          
            modal.find("#uploadImgForm")[0].reset();
            modal.find("a.activeItem").unbind('click').click(function (e) { e.preventDefault(); modal.dialog('close'); });
            modal.find("button").attr('disabled', 'disabled');
            modal.find("p.rg-img-restriction").removeClass('invalidItem').find('i.fa').remove();
            modal.find("[name='fileUpload']").unbind('change').change(function () {
                var ext = $(this).val().split('.').pop().toLowerCase();
                modal.find("p.rg-img-restriction").removeClass('invalidItem').find('i.fa').remove();
                if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg', 'bmp']) == -1) {
                    modal.find("button").attr('disabled', 'disabled');
                    modal.find("p.rg-img-restriction").addClass('invalidItem').prepend("<i class='fa fa-exclamation-circle pull-left'></i>");
                } else {
                    modal.find("button").removeAttr('disabled');
                }
            });
            modal.dialog("option", "title",  _g11n.uploadAnImg);
            modal.dialog("open");
        }
        function renderImage(img) {
            _ctr.find(".rg-edit .rg-img").remove();
            _ctr.find(".rg-img-placeholder").hide().after($("<img>", {'class':'rg-img',src:img}).data('isNew',true));
        }
        function validateName(txtName) {
            txtName.removeClass('invalidItem');
            $(".resourceNameWrapper > .invalidItem").remove();
            if (txtName.val().length <= 0) {
                _ctr.find("#saveResource").attr('disabled', 'disabled');
                _ctr.find(".requiredFilled").show();
                return;
            }
            $.get('rpc/appointmentsSettings/GetResourceName', { portletId: _options.portletId, 'id': _options.id, name: txtName.val() }, function(bVal) {
                if (bVal) {
                    txtName.addClass('invalidItem').removeClass('invalidItem');
                    _ctr.find("#saveResource").removeAttr('disabled');
                    _ctr.find(".requiredFilled").hide();
                }
                else {
                    _ctr.find("#saveResource").attr('disabled', 'disabled');
                    _ctr.find(".requiredFilled").show();
                    txtName.addClass('invalidItem').after($("<span class='invalidItem'>").html(_options.g11n.resourceExists)).after($("<i class='fa fa-exclamation-circle invalidItem'>"));
                }
            });
        }
        function saveResource() {
            var resource = { id: _options.id, name: _ctr.find("#txtResourceName").val(), location: _ctr.find("#txtResourceLocation").val(), description:getTextEditorCtr(_ctr, _options).html() };
            if (_ctr.find(".rg-img").data('isNew') === true)
                resource.imgUrl = _ctr.find(".rg-img").attr('src');

            $.post('rpc/appointmentsSettings/SaveResource/?portletId=' + _options.portletId, resource, function (id) {
                if (id.length > 0) {
                    resource.id = id;
                    textEditor.destroy(getTextEditorCtr(_ctr, _options));
                    _options.onSave(resource);
                    updateResource(resource);
                }
                else {
                    alert('error saving resource');
                }
            });
        }
        function updateResource(newResource) {
            var origResource = getResource();
            if (origResource == null) return;

            origResource.name = newResource.name;
            origResource.location = newResource.location;
            origResource.description = textEditor.decodeForHtmlDisplay(newResource.description);
            origResource.imgUrl = newResource.imgUrl;
            $(".rg-wrapper").data('resource', origResource);
            renderResource();
        }
        function deleteResource(modal) {
            var resource = getResource();
            $.post('rpc/appointmentsSettings/RemoveResource/?portletId=' + _options.portletId + "&resourceId=" + resource.id, function (bVal) {
                if (!bVal) {
                    alert('error deleting resource');
                }
                modal.dialog('close');
                $(".rg-wrapper").removeData();
                textEditor.destroy(getTextEditorCtr(_ctr, _options));
                _ctr.empty();
                _options.onDelete(resource);
            });
        }
    }
}(jQuery, window, document));
; (function ($, window, document, undefined) {
    //global vars
    var apptDetailsPlugin = "apptDetails",
        apptDetailsData = "plugin_" + apptDetailsPlugin;

    //boilerplate plugin logic
    $.apptDetails = function (options) {

        var args, apptDets;
        var container = $("#apptDetailPlugin");
        if (container.attr('id') === undefined) {
            $.ajax({
                type: 'GET',
                async: false,
                url: 'portlets/ics/appointmentsportlet/templates/apptDetails.htm',
                success: function (source) {
                    var template = Handlebars.compile(source);
                    container = $(template({ g11n: options.g11n }));
                    $("#appointmentWrapper").append(container);
                }
            });
        }

        // only allow the plugin to be instantiated once
        if (!(container.data(apptDetailsData) instanceof ApptDetails)) {
            container.data(apptDetailsData, new ApptDetails(container, options));
        }

        apptDets = container.data(apptDetailsData);

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof apptDets['render'] === 'function') {
                apptDets.render(options);
            }
        } else if (typeof options === 'string' && typeof apptDets[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return apptDets[options].apply(apptDets, args);

        } else {
            $.error('Method ' + options + ' does not exist on jQuery.' + apptDetailsPlugin);
        }
        return apptDets;
    };

    function ApptDetails(element, options) {
        var appt = this;
        appt.render = render;
        var _ctr = $(element), _options = $.extend(getDefaultOptions(), options), _g11n = options.g11n, _appointment = null, _isPast = false;

        function getDefaultOptions() {
            return {
                controller: null,
                appointment: null,
                resource: null,
                hostId:null,
                g11n: {},
                hideHostLink: false,
                canAddAttendees: false,
                showAttendeeFunc: null,
                rerender: function () { },
                onRemoveAttendees: function (){},
            };
        }

        function render(apptOptions) {
            if (apptOptions != null) {
                _options = $.extend(getDefaultOptions(), apptOptions); //create new eachtime
                _g11n = $.extend(_g11n, apptOptions.g11n); //override default g11n
                _appointment = _options.appointment;
            }

            var end = _appointment.isOwner ? moment(_appointment.end).add('minutes', 30) : _appointment.end;// 30 min grace period for edits
            _isPast = end.isBefore(moment());
            setupDialog();
            renderApptInfo();
        }
        function setupDialog() {
            if (_ctr.hasClass('ui-dialog-content')) return;

            _ctr.dialog({
                autoOpen:false,
                modal: true,
                draggable: false,
                resizable: false,
                width: 740,
                dialogClass: 'apptDetailContainer',
                beforeClose: closeModal
            });
            _ctr.find(".confirmModal").dialog({
                autoOpen: false,
                modal: true,
                draggable: false,
                resizable: false,
                width: 570,
                dialogClass: 'confirmModalWrapper'
            });
            var uploadModal = _ctr.find("#uploadFileComment");
            uploadModal.dialog({
                autoOpen: false,
                modal: true,
                draggable: false,
                resizable: false,
                width:450,
                dialogClass: 'uploadModalWrapper'
            });

            uploadModal.find("#uploadFileForm").ajaxForm({
                beforeSend: function() { uploadModal.find("button.activeAction").attr('disabled','disabled'); },
                success: function (response) {var comment = $.parseJSON(response);  renderNewComment(comment); uploadModal.dialog('close'); },
                error:function () { alert('an error occurred during upload'); }
            });

            _ctr.find("#postComment").attr('title',_g11n.enterComment).click(function () { postComment(); });
            _ctr.find("#postFile").click(function () { bindUploadFileModal(); });
        }
        function renderApptInfo() {
            renderApptHeader();
            _ctr.removeData('fromEdit');
            _ctr.find(".discussionPhoto").attr("src", apptPortlet.imgUrl).removeClass().addClass( "discussionPhoto " + (_appointment.isOwner ? 'commentHost' : 'commentAttendee'));
            _ctr.find(".attendeesWrapper, .discussionWrapper ").empty();
            _ctr.find(".whoThere").text(_isPast ? _g11n.whoWasAttending : _g11n.whoAttending);
            _ctr.find(".apptAttendees, .apptHostAttendees, .addAttendeeChooser, .editApptWrapper").hide();
            _ctr.find(".apptMainAction, .apptDetailContent, div.apptDetailContainer button.ui-dialog-titlebar-close").show();

            var discussion = _ctr.find("#txtDiscussion");
            discussion.val('');
            applyWatermark(discussion, _ctr.find("#postComment"));
            processEditAppointment();
           
            $.getJSON('rpc/appointmentsDetail/GetAppointmentDetails/' + _appointment.id,
                        function (data) {
                            renderAttendees(data);
                            renderDiscussions(data.comments);
                            if (_options.showAttendeeFunc != null) {
                                bindAddAttendees();
                                _ctr.find("#addAttendees").click();
                            }
                            _ctr.dialog('open');
                        });
        }
        function renderApptHeader() {
            var isResource = _appointment.resourceId != undefined && _appointment.resourceId.length > 0;
            var inProgress = moment(_appointment.start).isBefore(moment()) && moment(_appointment.end).isAfter(moment());
            _ctr.find(".userPhoto").attr("src", isResource ? _appointment.resourceImg : _appointment.ownerImg);
            _ctr.find(".apptOwnerSchedule").html(stringUtil.format(_g11n.apptWithUser,isResource ? _appointment.resourceName : _appointment.owner))
                    .click(function (e) {
                        e.preventDefault();
                        if (closeModal(true)) {
                            if (isResource)
                                _options.controller.transitionTo('scheduleResource', _appointment.resourceId);
                            else
                                _options.controller.transitionTo('userSchedule', { id: _appointment.ownerId, imgUrl: _appointment.ownerImg, name: { full: _appointment.owner } });
                        }
                    });
            _ctr.find(".apptOwnerName").html(isResource && (_appointment.isOwner || _appointment.resourceEdit) ? ("(" + _appointment.owner + ")") : "");
            if (_options.hideHostLink) {
                _ctr.find(".apptOwnerSchedule").hide();
                _ctr.find(".apptOwnerName").html(stringUtil.format(_g11n.apptWithUser,_appointment.owner));
            }
                
            _ctr.find(".apptTitle").html(_appointment.title);
            _ctr.find(".apptDateLocation").html(getDateAndLocation(_appointment));
            _ctr.find(".apptDescription").html(_appointment.description);
            _ctr.find(".apptOver").text(inProgress ? _g11n.inProgress : (_isPast ? _g11n.apptOver : ""));
            _ctr.find(".apptIcs").attr('href', "rpc/appointmentsdetail/geticsfile?id=" + _appointment.id);
            if (_isPast) _ctr.find(".apptIcs").hide();
            else _ctr.find(".apptIcs").show();
        }
        function processEditAppointment() {
            var editAppt = _ctr.find(".editAppt");
            var icsLink = _ctr.find(".apptIcs").show();
            
            if ((!_appointment.isOwner && !_appointment.editable) || _isPast || ((_appointment.resourceId != null && _appointment.resourceId.length > 0) && !_appointment.resourceEdit)) {
                editAppt.hide();
                icsLink.hide();
                return;
            }

            editAppt.show().click(function () {
                var closeBtn = $("div.apptDetailContainer button.ui-dialog-titlebar-close");
                closeBtn.hide();
                icsLink.hide();
                editAppt.hide('slow');
                var editWrapper = _ctr.find(".editApptWrapper");
                _ctr.find(".apptDetailContent").hide();
                $.addAppointment({ g11n: _g11n }).open({
                    appointment: _appointment,
                    resource: _options.resource,
                    hostId: _options.hostId,
                    appendCtr: editWrapper,
                    sections: _options.resource == null || !_options.resource.id ?  apptPortlet.sections : [],
                    parentModal: _ctr,
                    bypassTimeCheck: true,
                    canAddAttendees: _options.canAddAttendees,
                    onOk: function (editedAppt, isReoccurring) {
                        //editing can't be reoccurring
                        if (editedAppt != null) {
                            editWrapper.fadeOut('fast', function () { $(this).empty(); });
                            _options.appointment = _appointment = editedAppt;
                            renderApptHeader(); //rerender appt info
                            _options.rerender();
                            _ctr.find(".apptDetailContent").fadeIn({ duration: 800, step: function () { recenterModal(); } });
                            editAppt.fadeIn('slow');
                            closeBtn.show();
                            icsLink.show();
                        }
                    },
                    onAddAttendee: function () { editWrapper.empty(); $("#addAttendees").click(); _ctr.data('fromEdit',true); _ctr.find(".apptDetailContent").hide(); },
                    onCancel: function () { editWrapper.empty(); _ctr.find(".apptDetailContent").fadeIn({ duration: 800, step: function () { recenterModal(); } }); editAppt.show('slow'); closeBtn.show(); icsLink.show(); },
                    onRemove: function () { closeModal(true); closeBtn.show(); _options.rerender(); }
                });
                editWrapper.hide().slideDown({ duration: 'normal', step: function () { recenterModal(); } });
           });
        }
        function renderAttendees(details) {
            if (details.attendees == null) 
                return;
            
            if (_appointment.isOwner || _appointment.editable)
                renderHostAttendees(details);
            else
                renderAttendeeAtendees(details.attendees);
        }
        function renderHostAttendees(details) {
            $(".apptHostAttendees").show();
            var txtNotes = $("#txtNotes");
            txtNotes.unbind("change").removeData('isDirty').change(function() { $(this).data('isDirty', true); }).val(details.notes);
            var notesWrapper = _ctr.find(".notesWrapper");
            $("#saveNotes").unbind("click").click(function () {
                var btn = $(this);
                btn.attr('disabled', 'disabled');
                notesWrapper.block({ message: '<div class="pc-loading"><img src="ui/common/images/PortletImages/Icons/ajax_loader_large.gif"/> ' + _g11n.saving + '</div>', css: { border: 'none', background: 'transparent', cursor: 'default' }, overlayCSS: { backgroundColor: '#000', opacity: 0.2 } });
                $.post('rpc/appointmentsDetail/SaveNotes/', { appointmentId: _appointment.id, comment: txtNotes.val() },
                    function (bVal) {
                        if (bVal == false) {alert('unable to save notes');}
                        btn.removeAttr('disabled');
                        notesWrapper.unblock();
                        txtNotes.removeData('isDirty');
                    });
            });
            $("#sendEmail").unbind("click").click(function () {
                var btn = $(this);
                btn.attr('disabled', 'disabled');
                btn.html(_g11n.sending);
                $.post('rpc/appointmentsDetail/EmailNotes/', { appointmentId: _appointment.id, comment: txtNotes.val() },
                    function (bVal) {
                        if (bVal == false) { alert('unable to email notes'); }
                        btn.removeAttr('disabled');
                        btn.html('<i class="fa fa-envelope pull-left"></i>' + _g11n.emailNotes);
                        txtNotes.removeData('isDirty');
                    });
                
            }).attr('title',_g11n.sendToMyself);
            bindAttendees(_ctr.find(".hostAttendees"), details.attendees, true);
            bindAddAttendees();
        }
        function bindAddAttendees() {
            var addAttendee =_ctr.find("#addAttendees");
            addAttendee.hide().unbind('click');
            if (_isPast || !_options.canAddAttendees) return;

            addAttendee.show().click(function (e) { e.preventDefault();
                _ctr.find(".apptDetailContent").fadeToggle('fast', function () {
                    _ctr.find(".editAppt, .apptIcs").hide();
                    $("div.apptDetailContainer button.ui-dialog-titlebar-close").hide();
                    var content = $(this);
                    var chooser = _ctr.find(".addAttendeeChooser");
                    var people = new Array();
                    $.each(_ctr.find(".hostAttendees li.attendee"), function (i, li) { people.push($(li).data('attId')); });

                    chooser.find("#attPeopleChooser").peopleChooser('destroy'); //clear out any previously rendered chooser
                    chooser.find("#attPeopleChooser").empty().peopleChooser({
                                        showFull: true,
                                        initPeopleIds: people,
                                        loaded: function () { recenterModal(); }
                                    });
                    chooser.find("#savePeople").unbind('click').click(function () {
                        _ctr.removeData('fromEdit');
                        var userIds = $.map(chooser.find("#attPeopleChooser").peopleChooser('getPeople'), function (person) { return person.id; }).join(',');
                        var isRemoveAll = (userIds == null || userIds.length == 0);
                        $.post('rpc/appointmentsDetail/AddAttendees/', { appointmentId: _appointment.id, attendeeIds: userIds, removeAll: isRemoveAll, portletId: apptPortlet.portletId },
                              function (updatedAttendees) {
                                  if (updatedAttendees == null) { alert('unable to modify attendees'); }
                                  else {
                                      if (isRemoveAll) {
                                          _appointment.attendeeCount = 0;
                                          _appointment.hasAttendees = false;
                                          chooser.find("#cancelPeople").click();
                                          closeModal(true);
                                          _options.onRemoveAttendees(_appointment);
                                      } else {
                                          _appointment.attendeeCount = updatedAttendees.length;
                                          _appointment.hasAttendees = true;

                                          bindAttendees(_ctr.find(".hostAttendees"), updatedAttendees, true);
                                          chooser.find("#cancelPeople").click();
                                      }
                                      _options.rerender();
                                  }
                              });
                    });
                    chooser.find("#cancelPeople").unbind('click').click(function(e) {
                        e.preventDefault();
                        chooser.find("#attPeopleChooser").peopleChooser('destroy');
                        chooser.fadeToggle('fast'); content.fadeToggle('slow');
                        $("div.apptDetailContainer button.ui-dialog-titlebar-close").show();
                        processEditAppointment();
                        if (_ctr.data('fromEdit') == true) {
                            _ctr.removeData('fromEdit');
                            _ctr.find(".editAppt").show().click();
                        }
                            
                        if (_options.showAttendeeFunc != null && !_ctr.find(".hostAttendees li").length) {
                            _ctr.dialog('close');
                            _options.showAttendeeFunc();
                        }
                        recenterModal();
                    });
                    chooser.fadeToggle('slow', function () { recenterModal(); });
                });
            });
        }
        function renderAttendeeAtendees(attendees) {
            $(".apptAttendees").show();
            bindAttendees(_ctr.find(".attendeesWrapper"), attendees, false);
        }
        function bindAttendees(ctr, attendees, renderCheckIns) {
            ctr.empty();
            $.each(attendees, function (i, att) {
                var li = $('<li class="attendee">');
                var attData = $("<div>");
                li.append($("<img>", { src: att.imgUrl, 'class': 'attendeePhoto' }));
                if (renderCheckIns) {
                    li.data('attId', att.id);
                    renderCheckin(attData, att);
                }
                attData.append($("<span>").html(att.name));
                var actions = $("<div class='attendeeActions'>");
                if (att.isMe && !_isPast && !renderCheckIns) {
                    actions.append($("<button class='cancelAction'>").html("<i class='fa fa-dot-circle-o'></i> " + _g11n.cancel).click(function () { bindCancelModal(); }));
                } else {
                    var info = $(att.myInfoHtml).css('display', 'none');
                    actions.append(info)
                        .append("<i class='fa fa-info-circle fa-cus-info'></i>")
                        .append($("<a class='activeItem'>").html(_g11n.info).click(function (e) { e.preventDefault(); info.click(); }));
                }
                actions.appendTo(attData);
                attData.appendTo(li);
                ctr.append(li);
            });
        }
        function checkInUser(ctr, attendee, isCheckingIn) {
            $.post('rpc/appointmentsDetail/CheckIn/', { appointmentId: _appointment.id, attendeeId: attendee.id, isCheckingIn: isCheckingIn },
                   function (bVal) {
                       if (bVal == false) { alert('unable to check in attendee'); }
                       else {
                           attendee.isCheckedIn = isCheckingIn;
                           renderCheckin(ctr, attendee, true);
                       }
                   });
        }
        function renderCheckin(ctr, att, animate) {
            var checkInDiv = $("<div class='checkInWrapper'>");
            if (att.isCheckedIn) {
                $("<div>").html("<i class='fa fa-check'></i> " + _g11n.checkedIn).appendTo(checkInDiv);
                $("<div>").prepend("(").append($("<a href='' class='activeItem'>").html(_g11n.undo).click(function (e) { e.preventDefault(); checkInUser(ctr, att, false); })).append(")").appendTo(checkInDiv);
            } else {
                $("<button>", { 'class': 'checkInAction' }).html("<i class='fa fa-check'></i> " + _g11n.checkIn).appendTo(checkInDiv).click(function () { checkInUser(ctr, att, true); });
            }
            if (!_isPast && !att.isCheckedIn) {
                $("<button>", { 'class': 'cancelAction' }).html("<i class='fa fa-dot-circle-o'></i> " + _g11n.cancel).appendTo(checkInDiv)
                    .click(function () { bindCancelModal(att.id, stringUtil.format(_g11n.cancelFor, att.name), function (modal) { modal.dialog('close'); $("li.attendee").filter(function () { return $(this).data('attId') == att.id; }).hide('normal', function () { $(this).remove(); }); }); });
            }
            ctr.find("div.checkInWrapper").remove(); //clear

            if (animate)
                checkInDiv.css('display','none').prependTo(ctr).show('normal');
            else
                ctr.prepend(checkInDiv);
        }
        function renderDiscussions(comments) {
            var discussion = _ctr.find(".discussionWrapper");
            if (comments == null || comments.length === 0) {
                 discussion.hide();
                 return;
            }
            discussion.empty();
            discussion.show();
            $(comments).each(function(i, comment) {
                bindComment(discussion,comment);
            });
            discussion.animate({ scrollTop: discussion.prop("scrollHeight") - discussion.height() }, 1000);
            clearNewComments();
        }
        function clearNewComments() {
            setTimeout(function () { _ctr.find(".discussionWrapper").find(".commentNew").removeClass('commentNew'); }, 15000);
        }
        function bindComment(container, comment) {
            var wrapper = container.find("[data-id='" + comment.id + "']");
            var isNew = false;
            if (!wrapper.hasClass('comment')) {
                wrapper = $("<div class='comment' data-id='" + comment.id + "'>");
                isNew = true;
            }
            wrapper.empty();
            wrapper.data('comment', comment);
            var content = $("<div class='commentContent " + (comment.isHost ? "leftComment" : "rightComment") + "'>");
            if(comment.isNew) {
                comment.isNew = false;
                content.addClass('commentNew');
            }
            var hasFile = comment.fileName != null && comment.fileName.length > 0;
            if (hasFile) {
                content.append($("<div class='commentFile'>").append($("<i class='fa fa-file fa-cus-info'>")).append($("<a href='" + comment.fileUrl + "' class='activeItem' target='_blank'>").html(comment.fileName)));
            }
            content.append($("<div class='commentTxt'>").html((hasFile && comment.comment.length > 0 ? "&ndash; " : "") + comment.comment));
            var info = $("<div class='commentInfo'>").html(stringUtil.format((hasFile ? _g11n.commentFileFrom : _g11n.commentFrom), comment.name, comment.date));
            if (comment.canEdit) {
                info.append($('<i class="fa fa-pencil activeItem">').click(function() {
                    if (hasFile) {
                        bindUploadFileModal(comment);
                    } else {
                        bindEditComment(comment);
                    }
                }));
                info.append($('<i class="fa fa-trash-o activeItem">').click(function () { bindDeleteCommentModal(wrapper.data('comment')); }));
            }
            content.append(info);
            var img = $("<img>", { src: comment.img, 'class': 'commentPhoto ' + (comment.isHost ? 'commentHost' : 'commentAttendee') });

            wrapper.prepend(img).append(content);
            if(isNew)
                container.append(wrapper);
        }
        function bindEditComment(comment) {
            _ctr.find(".discussionWrapper").find('a.activeItem').each(function (i, elem) { $(elem).click(); }); //cancel any open editing
            _ctr.find(".apptMainAction").slideUp('normal');
            var wrapper = _ctr.find("[data-id='" + comment.id + "']");
            wrapper.find(".commentContent").hide();
            var txtArea = $("<textarea class='activeInput' maxlength='1000'>");
            txtArea.html(wrapper.find(".commentTxt").html());
            var actions = $("<div class='apptDetailAction'>");
            actions.append($("<button class='activeAction'>").html(_g11n.saveChanges).click(function() {
                $.post('rpc/appointmentsDetail/PostComment/', { appointmentId: _appointment.id, comment: txtArea.val(), commentId:comment.id },
                    function (data) {
                        if (data != '') {
                            bindComment(_ctr.find(".discussionWrapper"), data);
                            clearNewComments();
                        }
                        else { alert('unable to edit comment'); }
                    });
                $(this).next('a').click();
            }));
            actions.append($("<a href='' class='activeItem'>").html(_g11n.cancel).click(function (e) {
                e.preventDefault();
                txtArea.remove();
                actions.remove();
                wrapper.find(".commentContent").show('normal');
                _ctr.find(".apptMainAction").slideDown('normal');
            }));
            wrapper.append(txtArea).append(actions);
        }
        function bindCancelModal(attendeeId, mesg, action) {
            var txt = mesg == null ? _g11n.cancelYourself : mesg;
            bindConfirmModal(txt, $(""), _g11n.keepAppt, _g11n.cancelAppt,
                function (confirmModal) {
                    $.post('rpc/appointmentsDetail/CancelAttendee/?id=' + _appointment.id + "&aId=" + attendeeId,
                            function (data) {
                                if (data == true) {
                                    _appointment.attendeeCount--;
                                    _options.rerender();
                                }
                                else { alert('unable to cancel appointment'); }

                                if (action != null) {
                                    action(confirmModal);
                                } else {
                                    confirmModal.dialog('close');
                                    closeModal(true);
                                }
                                if (_appointment.attendeeCount <= 0) {
                                    closeModal(true);
                                    _appointment.hasAttendees = false;
                                    _appointment.className = '';
                                    _options.onRemoveAttendees(_appointment);
                                }
                            });
            });
        }
        function bindDeleteCommentModal(comment) {
            var g11n = comment.fileName.length > 0 && comment.comment.length > 0 ? _g11n.deleteFileComment : (comment.fileName.length > 0 && comment.comment.length == 0 ? _g11n.deleteFile : _g11n.deleteComment);
            var commentTxt = comment.comment.length > 0 ? '"' + comment.comment + '"' : '';
            var commentWrapper = $("<div>");
            if (comment.fileName.length > 0) {
                commentWrapper.append($("<div class='commentFile'>").append($("<i class='fa fa-file fa-cus-info'>")).append($("<a href='" + comment.fileUrl + "' class='activeItem' target='_blank'>").html(comment.fileName)));
            }
            commentWrapper.append($("<div>").html(commentTxt));
            bindConfirmModal(g11n, commentWrapper, _g11n.keepIt, _g11n.deleteIt, function (confirmModal) {
                $.post('rpc/appointmentsDetail/RemoveComment/' + comment.id,
                           function (data) {
                               if (data == true) {
                                   var elem = _ctr.find("[data-id='" + comment.id + "']");
                                   elem.hide('normal', function () { elem.remove(); });
                               }
                               else { alert('unable to remove comment'); }
                               confirmModal.dialog('close');
                           });
            });
        }
        function applyWatermark(ctr, btn) {
            ctr.val($.trim(ctr.val()));  
            if (ctr.val().length > 0) return;

            ctr.val(_g11n.addComment);
            ctr.addClass('pc-watermark');
            btn.attr('disabled', 'disabled');
            ctr.click(function () {
                var input = $(this);
                if (input.val() == _g11n.addComment) {
                    input.val('');
                    input.removeClass('pc-watermark');
                    input.unbind('click');
                    btn.removeAttr('disabled');
                }
            });
            ctr.blur(function() { if ($.trim($(this).val()) == '') {applyWatermark(ctr, btn);}});
        }
        function getDateAndLocation(appt) {
            var str = appt.start.format('MM/DD/YYYY h:mm a');
            var todayDiff = moment().diff(appt.start,'day');
            if (todayDiff >= -1 && todayDiff <= 1)
                str = appt.start.calendar().replace(' AM',' am').replace(' PM',' pm');
            
            str += ' - ' + appt.end.format('h:mm a');
            if (appt.location != null && appt.location.length > 0)
                str += ' ' + _g11n.at +' ' + appt.location;
            return str;
        }
        function postComment() {
            var txt = $("#txtDiscussion");
            var commentVal = txt.val();
            if (commentVal == _g11n.addComment) return;

            $.post('rpc/appointmentsDetail/PostComment/',{appointmentId:_appointment.id, comment: commentVal},
                function (comment) {
                    if (comment != null) {
                        txt.val('');
                        applyWatermark(txt, _ctr.find("#postComment"));
                        renderNewComment(comment);
                    } else { alert('unable to post comment');}
                });
        }
        function renderNewComment(comment) {
            if (comment == null) return;
            var container = _ctr.find(".discussionWrapper");
            container.show();
            bindComment(container, comment);
            container.animate({ scrollTop: container.prop("scrollHeight") - container.height() }, 1000);
            recenterModal();
            clearNewComments();
        }
        function bindUploadFileModal(comment) {
            var modal = $("#uploadFileComment");
            modal.find("#uploadFileForm")[0].reset();
            modal.find(".uploadInfo").empty();
            modal.find("a.activeItem").unbind('click').html(_g11n.noThanks).click(function (e) { e.preventDefault(); modal.dialog('close'); });
            modal.find("button").removeAttr('disabled').html("<i class='fa fa-upload'></i> " + _g11n.uploadFile);
            modal.find("[name='apptId']").val(_appointment.id);
            modal.find("[name='portletId']").val(apptPortlet.portletId);
            modal.find("[name='commentId']").val('');
            if (comment != null) {
                modal.find("[name='comment']").val(comment.comment);
                modal.find("[name='commentId']").val(comment.id);
                modal.find(".uploadInfo").append($("<i class='fa fa-file fa-cus-info'>")).append($("<a href='" + comment.fileUrl + "' class='activeItem' target='_blank'>").html(comment.fileName));
            }
            modal.dialog("option","title", comment == null ? _g11n.uploadAFile : _g11n.uploadADiffFile);
            modal.dialog("open");
        }

        function closeModal(forceClose) {
            //check for unposted comments n' such
            var txtBx = $("#txtDiscussion");
            var notesTxt = $("#txtNotes");
            if (forceClose === true) {
                notesTxt.val('').removeData('isDirty');
                txtBx.val('');
                _ctr.dialog('close');
                return true;
            }

            var txt = txtBx.val();
            if (txt.length > 0 && txt != _g11n.addComment) {
                bindConfirmModal(_g11n.postYourComment, $("<span>").html(_g11n.enteredNoPost), _g11n.doNotClose, _g11n.postNClose,
                    function (confirmModal) {
                        postComment();
                        confirmModal.dialog('close');
                        closeModal(true);
                    }, _g11n.discardNClose, function (confirmModal) { confirmModal.dialog('close'); closeModal(true); });
                return false;
            }
            if (_appointment.isOwner && notesTxt.data('isDirty') != null) {
                bindConfirmModal(_g11n.saveYourNotes, $("<span>").html(_g11n.unsavedNotes), _g11n.doNotClose, _g11n.saveChangesClose,
                   function (confirmModal) {
                       $("#saveNotes").click();
                       confirmModal.dialog('close');
                       closeModal(true);
                   }, _g11n.discardChanges, function (confirmModal) { confirmModal.dialog('close'); closeModal(true); });
                return false;
            }
            return true;
        }
        function recenterModal() {
            _ctr.dialog("option", "position", { my: "center", at: "center", of: window });
        }
    }

}(jQuery, window, document));
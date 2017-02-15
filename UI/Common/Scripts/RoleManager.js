/**
* Role Manager
* This module enables the adding and editing of roles in JICS environment. 
*/
(function (rm, $) {

    
    /**
    * Role Presenter
    */
    var RolePresenter = function($) {

        var load,
            bindToDOM,
            roleToEdit,
            options,
            setOnbackCall,
            container,
            onbackCall,
            getGlobalizations,
            onSaveHandler,
            onCancelHandler,
            userMembers,
            roleMembers,
            onUserSelectHandler,
            onUserSelectionChangedHandler,
            onRoleSelectionChangeHandler,
            onRoleSelectHandler;

        onCancelHandler = function () {
            if (typeof onbackCall != "undefined") {
                onbackCall();
            }
        };
        onSaveHandler = function () {
            var newRoleInfo;
            
            var roles = typeof roleMembers == "undefined" ? new Array() : roleMembers;
            var users = typeof userMembers == "undefined" ? new Array() : userMembers;
            
            if (options.Mode == "Edit" && typeof roleToEdit != "undefined" && typeof roleToEdit.id != "undefined") {
                newRoleInfo =
                {
                    Id : roleToEdit.id,
                    Name: roleView.RoleName(),
                    Members: $.merge(roles, users),
                    Context: options.context
                };
            } else {
                newRoleInfo =
                {
                    Name: roleView.RoleName(),
                    Members: $.merge(roles, users),
                    Context: options.context
                };
            }
            
            addEditRole(newRoleInfo, function (roleInfo) {
                if (typeof onbackCall != "undefined") {
                    onbackCall(roleInfo);
                }
            });
        };
        
        onUserSelectionChangedHandler = function (selectedMembers) {
            userMembers = selectedMembers;
            roleView.UpdateUsers(selectedMembers);
        };
        onRoleSelectionChangeHandler = function (selectedMembers) {
            roleMembers = selectedMembers;
            roleView.UpdateRoles(selectedMembers);
        };
        onUserSelectHandler = function () {
            var roleInfo = { Name: roleView.RoleName(), ContextID : options.context, roleMembers: userMembers };
            userSelectionView.Init(roleInfo, onUserSelectionChangedHandler);
        };
        
        onRoleSelectHandler = function () {
            var roleInfo = { Name: roleView.RoleName(), ContextID : options.context,roleMembers: roleMembers};
            roleSelectionView.Init(roleInfo, onRoleSelectionChangeHandler);
        };
        
        getGlobalizations = function (callBackOnDone) {
            $.get(window.portalSettings.globalizerWebServiceUrl + "roleManager").done(
                function (source) {
                    callBackOnDone(source);
                }
            );
        };
     
        addEditRole = function (role, onSuccessCallBack) {
            
            $.ajax({
                type: "POST",
                url: window.portalSettings.webApiRootUrl +"RoleManager",
                data: role,
                success: function (response) {
                    onSuccessCallBack(response);
                },
                fail: function (error) {
                    if (confirm("Could not save : " + eval(error))) {
                        onSuccessCallBack();
                    } else {
                        onSuccessCallBack();
                    }
                },
                dataType: "json"
            });
        };
        
        bindToDOM = function (data, bindListeners) {
            $(container).html(data.html);
            bindListeners();
        };

        /*Public methods. */
        var setOnbackCall = function (callBack) {
            onbackCall = callBack;
        };
        
        load = function (cntr, opt) {

            options = opt;
            container = cntr;

            if (options.Mode == "Edit") {
                
                getGlobalizations(function (globalizer) {
                    //TODO: since we are on edit mode, 
                    // check if the members are defined. 
                    // if not then try to get them. 
                    $.ajax({
                        type: "GET",
                        url: window.portalSettings.webApiRootUrl + "RoleManager",
                        data: options.roleInfo,
                        dataType: "json",
                        success: function (roleInfo) {
                            roleToEdit = roleInfo;
                            userMembers = roleInfo.members.filter(function (member) { return member.memberType == 2;});
                            roleMembers = roleInfo.members.filter(function (member) { return member.memberType == 1; });
                            
                            roleView.Init({
                                context: options.context,
                                roleToEdit: roleInfo,
                                loadDone: bindToDOM,
                                validator: Validator,
                                globalizer: globalizer,
                                onSaveClick: onSaveHandler,
                                onCancelClick: onCancelHandler,
                                onUserSelectClick: onUserSelectHandler,
                                onRoleSelectClick: onRoleSelectHandler,
                            });
                        },
                    });
                    
                        
                 });
            } else if (options.Mode == "Add") {
                getGlobalizations(function (globalizer) {
                    roleView.Init({
                        context: options.context,
                        loadDone: bindToDOM,
                        validator : Validator,
                        globalizer: globalizer,
                        onSaveClick: onSaveHandler,
                        onCancelClick: onCancelHandler,
                        onUserSelectClick: onUserSelectHandler,
                        onRoleSelectClick: onRoleSelectHandler,
                    });
                });
            }
        };
        return {
            Load: load,
            SetOnContainerBack: setOnbackCall
        };
    }($);
    
    var roleSelectionView = function ($) {
        var roleInformation;
        
        bindListeners = function (callback, onRoleSelectSaveHandler, onRoleSelectCancelHandler) {
            $.ajax({
                type: "GET",
                url: window.portalSettings.webApiRootUrl + "UserManager",
                data: { id: window.Portal.uid },
                error: function (data) {

                },
                success: function (userInfo) {
                    if (userInfo != null) {
                        $.get(window.portalSettings.webApiRootUrl + "PortalSettings").done(function (portalSettings) {
                            var ids = new Array();
                            if (typeof roleInformation.roleMembers != "undefined")
                                roleInformation.roleMembers.forEach(function (item) { ids.push(item.id); });
                            //TODO: to use real data.
                            $(".roleChooser").roleChooser({
                                roleIds: ids,
                                showContextIds: [roleInformation.ContextID],
                                showGuest: true,
                                showBaseRoles: true,
                                showCourses: roleInformation.ContextID != portalSettings.rootContextID && userInfo.isFaculty && portalSettings.islmsAvailable,
                                loaded: function () { callback(); }
                            });

                            $(".selectRole>.saveContainer>.save").click(function () {
                                var selectedRoles = $(".roleChooser").roleChooser('getRoles');
                                var selectMembers = new Array();

                                if (selectedRoles.length > 0) {
                                    selectedRoles.forEach(function (contextInfo) {
                                        contextInfo.roles.forEach(function (item) { selectMembers.push({ id: item.id, name: item.name, MemberType: 1 }); });
                                    });
                                }

                                $(".selectRole>.saveContainer>.save").addClass("saving");
                                $(".selectRole>.saveContainer>.cancel").addClass("saving");
                                $(".selectRole>.saveContainer>.save").text("Saving...");

                                onRoleSelectSaveHandler(selectMembers);
                            });
                            $(".selectRole>.saveContainer>.cancel").click(function () {
                                onRoleSelectCancelHandler();
                            });
                        });
                    }
                },
            });
        };
        
        config = function (roleInfo, onroleSelectHandler) {
            roleInformation = roleInfo;
            var template = "<div class=\"selectRole\">"
                + "<div class=\"info\">"
                + "<span class=\"title\">Add or remove members</span>"
                + "<span class=\"description\">Choose the roles who should be in <span class=\"roleName\">" + roleInfo.Name + " role </span>"
                + "</div>"
                + "<div class=\"roleChooser\"></div>"
                + "<div class=\"saveContainer\">"
                + "<a class=\"save\">Ok</a>"
                + "<a class=\"cancel\">No Thanks</a>"
                + "</div>"
                + "</div>";
            var data = { html: template, selector: ".selectRole" };
            
            onUserSelectCancelHandler = function () {
                $(data.selector).dialog('close');
            };
            roleSelectedHandler = function (selectedMembers) {
                onroleSelectHandler(selectedMembers);
                $(data.selector).dialog('close');
            };
            
            $(data.html).dialog(
                {
                    autoOpen: false,
                    resizable: false,
                    height: "auto",
                    position: { my: 'center', at: 'center', of: window },
                    width: "800",
                    dialogClass: 'AsPopupView ',
                    modal: true,
                    close: function () {
                        $(this).dialog('destroy');
                    },
                    create: function (dt) {
                        bindListeners(function () {
                            $(data.selector).dialog("open");
                            $(data.selector).dialog('option', 'position', 'center');
                        }, roleSelectedHandler, onUserSelectCancelHandler);
                    }
                });
            //callBack(data, bindListeners);
        };
        return {Init:config};
    }($);
    
    userSelectionView = function ($) {
        var config,_roleInfo, bindListeners,selectedUsers = new Array();

        turnFirtCharacterToUpderCase = function(name) {
            return name.toLowerCase().substring(0, 1).toUpperCase() + name.toLowerCase().substring(1);
        };
        bindListeners = function (callback,onUserSelectSaveHandler, onUserSelectCancelHandler) {
            var ids = new Array();
            if (typeof _roleInfo.roleMembers != "undefined") {
                selectedUsers = _roleInfo.roleMembers;
                _roleInfo.roleMembers.forEach(function (item) { ids.push(item.id);});
            } else {
                selectedUsers = new Array();
            }
            
            $(".peopleChooser").peopleChooser({
                showHostId : true,
                showFull: true,
                showContextOnly: false,
                contextId: _roleInfo.ContextID,
                initPeopleIds: ids,
                watermark: "Type a name or id...",
                
                onSelect: function (obj) {
                    var firstName = turnFirtCharacterToUpderCase(obj.fullName.substring(0,obj.fullName.indexOf(" ")))
                    var lastName =  turnFirtCharacterToUpderCase(obj.fullName.substring(obj.fullName.indexOf(" ")+1,obj.fullName.length));
                    selectedUsers.push({ id: obj.id ,name:firstName + " " + lastName,MemberType:2});
                },
                onRemove: function(obj) {
                    selectedUsers = jQuery.grep(selectedUsers, function (value) {
                        return value.id != obj.id; 
                    });
                },
                loaded: function () {
                    
                    $(".selectUser>.saveContainer>.save").click(function () {
                        $(".selectUser>.saveContainer>.save").addClass("saving");
                        $(".selectUser>.saveContainer>.cancel").addClass("saving");
                        $(".selectUser>.saveContainer>.save").text("Saving...");
                        onUserSelectSaveHandler(selectedUsers);
                    });
                    $(".selectUser>.saveContainer>.cancel").click(function () {
                        onUserSelectCancelHandler();
                    });
                    callback();
                }
            });
        };
        
        config = function (roleInfo, onUserSelectHandler) {
            _roleInfo = roleInfo;
            var template = "<div class=\"selectUser\">"
                + "<div class=\"info\">"
                + "<span class=\"title\">Add or remove members</span>"
                + "<span class=\"description\">Choose the people who should be in <span class=\"roleName\">"+roleInfo.Name+" role </span>"
                +"</div>"
                + "<div class=\"peopleChooser\"></div>"
                + "<div class=\"saveContainer\">"
                + "<a class=\"save\">Ok</a>"
                + "<a class=\"cancel\">No Thanks</a>"
                + "</div>"
                + "</div>";
            
            onUserSelectCancelHandler = function () {
                $(data.selector).dialog('close');
            };
            
            userSelectedHandler = function (selectedMembers) {
                onUserSelectHandler(selectedMembers);
                $(data.selector).dialog('close');
            };
            
            var data = { html: template, selector: ".selectUser" };
            $(data.html).dialog(
               {
                   autoOpen: false,
                   resizable: false,
                   height: "auto",
                   position: { my: 'center', at: 'center', of: window },
                   width: "800",
                   dialogClass: 'AsPopupView ',
                   modal: true,
                   close: function () {
                       $(this).dialog('destroy');
                   },
                   create: function (dt) {
                       bindListeners(function () {
                           $(data.selector).dialog("open");
                           $(data.selector).dialog('option', 'position', 'center');
                       }
                            , userSelectedHandler, onUserSelectCancelHandler);
                   }
               });
            
            //callBack(data, onUserSelectHandler);
        };
        
        return { Init: config };
    }($);
    
   
    roleView = function ($) {
        var config,
            uniqueName,
            timer,
            roleName,
            validate,
            validator,
            roleToEdit,
            globalizer,
            bindData,
            updateRoles,
            updateUsers,
            bindListeners,
            contexToCustomise,
            OnSaveClick = function () { },
            OnCancelClick = function() {},
            OnSelectUsersClick = function() {},
            OnSelectRolesClick = function () { },
            bindOnSelectUsersListener,
            bindOnSelectRolesListener,
            turnFirtCharacterToUpderCase,
            bindRealtimeRoleNameChangeLinstener;
        
         roleMembersView = function ($) {
             var config;

             bindRoleData = function (htmlSource,roleMembers) {
                 var template = Handlebars.compile(htmlSource);
                 roleMembers.sort(function (a, b) {
                     var aChar = a.name.charAt(a.name.indexOf(" ") + 1);
                     var bChar = b.name.charAt(b.name.indexOf(" ") + 1);
                     return aChar.localeCompare(bChar);
                 });
                 
                 var context = { members: roleMembers };
                 return template(context);
             };
             
             turnFirtCharacterToUpderCase = function(name) {
                  return name.toLowerCase().substring(0, 1).toUpperCase() + name.toLowerCase().substring(1);
             };
                 
             loadView = function (template, options,showAll) {
                 
                                 
                 //TODO: if the members are more then 10 then compile two lists. 
                 //TODO : add the paging if the number is over 20. 
                 var html1, html2;
                 options.roleMembers.forEach(function (item) {
                    var firstName = turnFirtCharacterToUpderCase(item.name.substring(0,item.name.indexOf(" ")))
                    var lastName =  turnFirtCharacterToUpderCase(item.name.substring(item.name.indexOf(" ")+1,item.name.length));
                    var revisedName = firstName + " " + lastName; 
                    item.name = revisedName;
                 });
                 //TODO: sort here the names based on last name. 
                 options.roleMembers.sort(function (a, b) {
                     var aChar = a.name.charAt(a.name.indexOf(" ") + 1);
                     var bChar = b.name.charAt(b.name.indexOf(" ") + 1);
                     var result = aChar.localeCompare(bChar);
                     if(result == 0){
                        return (a.name.charAt(0)).localeCompare(b.name.charAt(0));
                     }else{
                         return result;
                     }
                 });
                 
                 if(options.roleMembers.length > 10){
                     if (showAll == true) {
                         html1 = bindRoleData(template, options.roleMembers.slice(0, options.roleMembers.length/2));
                         html2 = bindRoleData(template, options.roleMembers.slice(options.roleMembers.length / 2, options.roleMembers.length));
                         return html1.concat(html2);
                     } else {
                          html1 = bindRoleData(template, options.roleMembers.slice(0, 10));
                          html2 = bindRoleData(template, options.roleMembers.slice(10, options.roleMembers.length <= 10 ? options.roleMembers.length : 20));
                          return  html1.concat(html2);
                       
                     }
                     
                                            
                 }else{
                     bindRoleData(template,options.roleMembers);
                 }
                 return bindRoleData(template, options.roleMembers);
             };
             
             uniqueName = function (options) {
                 var name = typeof options.name != "undefined" ? options.name : "New Role";
                 $.ajax({
                     type: "GET",
                     url: window.portalSettings.webApiRootUrl + "RoleInfo",
                     data: { name: name , contextId : options.contextId },
                     dataType: "json",
                     error: function (data) {
                         if (typeof options.done != "undefined" && typeof options.done == "function") {
                             options.done("");
                         }
                     },
                     success: function (data) {
                         if (typeof options.done != "undefined" && typeof options.done == "function") {
                             options.done(data.name);
                         }
                     },
                 });
             };
             config = function (options) {
                 
                 $.get('UI/Controls/Templates/RoleMembersTemplate.htm')
                    .done(function (source) {
                        var data = { html: loadView(source, options,false), selector: ".roleMembers" };
                        $(options.container+">" + data.selector).remove();
                        $(options.container).find(".expandAll").remove();
                        
                         var result = $(options.container).append(data.html);
                        
                        if (options.roleMembers.length > 20) {
                            $(result).append("<a class=\"expandAll\">And " + (options.roleMembers.length - 20).toString() + " more...</a>");
                         }else{
                             $(options.container).find(".expandAll").remove();
                         } 

                        $(".expandAll").click(function () {
                            if($(".expandAll").text() == "Compact view")
                            {
                                var data = { html: loadView(source, options, false), selector: ".roleMembers" };
                                $(options.container + ">" + data.selector).remove();
                                $(data.html).insertBefore(".expandAll");
                                $(".expandAll").text("And " + (options.roleMembers.length - 20).toString() + " more...");
                                
                            }else {
                                $(".expandAll").text("Compact view");
                                var data = { html: loadView(source, options,true), selector: ".roleMembers" };
                                $(options.container + ">" + data.selector).remove();
                                $(data.html).insertBefore(".expandAll");
                            
                            }
                        });
                        if (typeof (options.done) == "function")
                            options.done(data);
                    });
             };
             
             return {
                     Init: config,
             };    
         }($);
        
         keyUpTrigger = function(keyupCtr, triggerMethod) {
             keyupCtr.keyup(function(e) {
                 clearTimeout(timer);
                 if (e.keyCode == 10 || e.keyCode == 13) {
                     triggerMethod(keyupCtr.val());
                     return;
                 }
                 timer = setTimeout(function() { triggerMethod(keyupCtr.val()); }, 500);
             });
         };
         updateUsers = function (roleMembers) {
             //TODO: to update the list of users and roles 
             roleMembersView.Init({
                 roleMembers: roleMembers,
                 container:".users",
                 done: function (data) {
                     if (roleMembers.length > 0) {
                         $(".addPeople-link").addClass("hasMembers");
                         $(".addPeople-link>a").text("Add or remove members");
                         if (roleMembers.length == 1)
                             $(".users>.title").text(roleMembers.length + " person in this role");
                          else
                            $(".users>.title").text(roleMembers.length + " people in this role");
                     } else {
                         $(".addPeople-link").removeClass("hasMembers");
                         $(".users>"+data.selector).remove();
                         $(".users>.title").html(globalizer.txT_ROLE_MANAGER_ADD_TITLE + "<span class=\"roleName\"> " + roleName() + "</span>");
                         $(".addPeople-link>a").html(globalizer.txT_ROLE_MANAGER_ADD_PEOPLE_LINK + "<span class=\"roleName\"> " + roleName() + "</span>");
                     }
                 }
             });
         };
       
         updateRoles = function (roleMembers) {
             //TODO: to update the list of users and roles 
             roleMembersView.Init({
                 globalizer:globalizer,
                 roleMembers: roleMembers,
                 container: ".roles",
                 done: function (data) {
                     if (roleMembers.length > 0) {
                         $(".addOthersRoles-link").addClass("hasMembers");
                         $(".addOthersRoles-link").text("Add or remove roles");
                         if (roleMembers.length == 1) 
                             $(".roles>.title").text(roleMembers.length + " other role");
                         else
                            $(".roles>.title").text(roleMembers.length + " other roles");
                     } else {
                         $(".addOthersRoles-link").removeClass("hasMembers");
                         $(".roles>"+data.selector).remove();
                         $(".roles>.title").html(globalizer.txT_ROLE_MANAGER_ADD_OTHER_TITLE + "<span class=\"roleName\"> " + roleName() + "</span>");
                         $(".addOthersRoles-link").html(globalizer.txT_ROLE_MANAGER_ADD_OTHERS_LINK + "<span class=\"roleName\"> " + roleName() + "</span>");
                     }
                 }
             });

         };
        onRoleNameChangedHandler = function(roleName) {
            bindRealtimeRoleNameChangeLinstener(roleName);
            validate(roleName);
        };
         
        bindRealtimeRoleNameChangeLinstener = function (rolename) {
            if(!isRoleNameEmpty()) $('.roleName').text(rolename);
        };

        isValid = function (roleName, callbackMethod) {
            if (!isRoleNameEmpty()) {
                if (roleToEdit != null && roleName.toLowerCase() == roleToEdit.name.toLowerCase())
                    callbackMethod(true);
                
                if (validator.validateRoleName(roleName)) {
                    var queryInfo =
                    {
                        Name: roleName,
                        Context: contexToCustomise
                    };
                    validator.validateForExistingName(queryInfo, callbackMethod);
                } else {
                    callbackMethod(false);
                }
            } else {
                callbackMethod(false);
            }
        };
         
        validate = function (roleName) {
            if (!isRoleNameEmpty()) {
                if (roleToEdit != null && roleName.toLowerCase() == roleToEdit.name.toLowerCase())
                    validator.showValidMessage('.rename-textBox', '');
                else {
                    if (validator.validateRoleName(roleName)) {
                        var queryInfo = { Name: roleName, Context: contexToCustomise };
                        validator.validateForExistingName(queryInfo, onValidationFinished);
                    } else {
                        validator.showErrorMessage('.rename-textBox', globalizer.txT_ROLE_MANAGER_ERROR_ILLEGAL_CHARACTERS);
                    }
                }
             }else{
                 validator.showErrorMessage('.rename-textBox', globalizer.txT_ROLE_MANAGER_ERROR_EMPTY_NAME);
            }
         };
         
        onValidationFinished = function (result) {
             $('#validationMessage').remove();
             if (!result)
                 validator.showErrorMessage('.rename-textBox', globalizer.txT_ROLE_MANAGER_ERROR_DUPLICATE_NAME);
             else {
                 validator.showValidMessage('.rename-textBox', '');
             }
        };
        bindOnSaveClickListener = function () {
            $(".saveContainer>.save").click(function () {
                isValid(roleName(), function(valid) {
                    if (valid) {
                        $(".saveContainer>.save").addClass("saving");
                        $(".saveContainer>.cancel").addClass("saving");
                        $(".saveContainer>.save").text("Saving...");
                        
                        OnSaveClick();
                    }
                });
                
            });
            $(".saveContainer>.cancel").click(function () {
               OnCancelClick();
            });
        };

        bindOnSelectUsersListener = function () {
            $(".addPeople-link>a").click(function() {
                isValid(roleName(), function(valid) {
                    if (valid) {
                        OnSelectUsersClick();
                    } //don't do anything since the name is probably a duplicate, so why allow editing. 
                });
            });
        };
        isRoleNameEmpty = function(){ return $.trim(roleName()) == 0;};
        
        bindOnSelectRolesListener = function () {
            $(".addOthersRoles-link").click(function () {
                  isValid(roleName(), function (valid) {
                     if (valid) {
                          OnSelectRolesClick();
                     }//don't do anything since the name is probably a duplicate, so why allow editing. 
                 });
            });
        };
        
        bindData = function (htmlSource) {
            var template = Handlebars.compile(htmlSource);
            var context = globalizer;
            return template(context);
        };

        loadTemplate = function (callback) {

            $.get('UI/Controls/Templates/AddRoleTemplate.htm')
                .done(function (source) {
                    uniqueName({name:"New Role",contextId : contexToCustomise, done : function(uniqueName) {
                        globalizer.txtRoleName = uniqueName == "" || typeof uniqueName == "undefined" ? "New Role" : uniqueName;
                        var data = { html: bindData(source), selector: "addRole" };
                        callback(data, bindListeners);
                    }
                    });
                });
        };

         /* public methods */
        roleName = function () {
            return $.trim($('.rename-textBox').val());
        };
         
        bindListeners = function () {

            bindOnSelectRolesListener();
            bindOnSelectUsersListener();
            bindOnSaveClickListener();

            if (roleToEdit != null) {

                $('.rename-textBox').val(roleToEdit.name);
                $('.roleName').text(roleToEdit.name);
                userMembers = roleToEdit.members.filter(function (member) { return member.memberType == 2; });
                roleMembers = roleToEdit.members.filter(function (member) { return member.memberType == 1; });

                if (userMembers.length > 0) updateUsers(userMembers);
                if (roleMembers.length > 0) updateRoles(roleMembers);
                
            } else {
                validate(roleName());
            }
            keyUpTrigger($('.rename-textBox'), onRoleNameChangedHandler);
        };
         
        config = function (options) {

            //Required data
            // TODO: to add errors if these data is not provided. 
            validator = options.validator; 
            globalizer = options.globalizer;
            
            // optional options. 
            roleToEdit = typeof options.roleToEdit != "undefined" ? options.roleToEdit : null;
            contexToCustomise = typeof options.context != "undefined" ? options.context : null;
            
            
            OnSaveClick = typeof options.onSaveClick != "undefined" ? options.onSaveClick : function() {};
            OnCancelClick = typeof options.onCancelClick != "undefined" ? options.onCancelClick : function() {};

            OnSelectUsersClick = typeof options.onUserSelectClick != "undefined" ? options.onUserSelectClick : function() {};
            OnSelectRolesClick = typeof options.onRoleSelectClick != "undefined" ? options.onRoleSelectClick : function() {};

            loadTemplate(typeof options.loadDone != "undefined" ? options.loadDone : function (data, bindListeners) {});
        };
        return {
            Init: config,
            RoleName: roleName,
            UpdateRoles: updateRoles,
            UpdateUsers: updateUsers,
            BindListeners: bindListeners
        };
    }($);

    Validator = function ($) {
         var validateString, validateForExistingName, showErrorMessage;

         showErrorMessage = function (selector, message) {
             $('#validationMessage').remove();
             $("<span id=\"validationMessage\"class=\"ValidationError\">"+message+"</span>").insertAfter(selector);
         };
         showValidMessage = function (selector, message) {
             $('#validationMessage').remove();
             $("<span id=\"validationMessage\"class=\"ValidationValid\">" + message + "</span>").insertAfter(selector);
         };
         validateString = function (roleName) {
             var exp = new RegExp("[;<>\\\/,:?_+&#=]+");
             return !exp.test(roleName);

         };
         validateForExistingName = function (queryInfo, onsuccessCallBack) {
             
             $.ajax({
                 type: "GET",
                 url: window.portalSettings.webApiRootUrl+"RoleManager",
                 data: queryInfo,
                 dataType: "json",
                 error: function (data) {
                     onsuccessCallBack(true);
                 },
                 success: function (data) {
                     onsuccessCallBack(data == null);
                 },
             });
         };
         
         return {
             validateForExistingName: validateForExistingName,
             validateRoleName: validateString,
             showErrorMessage: showErrorMessage,
             showValidMessage: showValidMessage
         };
     }($);
    
    //TODO: to Event handler hooks for the following events. 
    // When the operation is canceled. 
    // when the save happens. 
    rm.OnContainerBack;
    
    rm.ShowEditRole = function (options) {
        RolePresenter.Load(options.container, { Mode: "Edit",context : options.context,roleInfo: options.roleInformation });
        RolePresenter.SetOnContainerBack(rm.OnContainerBack);
    };
    rm.ShowAddRole = function (options) {
        RolePresenter.Load(options.container, { Mode: "Add", context: options.context });
        RolePresenter.SetOnContainerBack(rm.OnContainerBack);
    };
}(window.RoleManager = window.RoleManager || {}, jQuery));

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.Portlet.Appointments.Views.MainView" %>
<script type="text/javascript">
    
    ApptApp = initEmberApp();

</script>
<div id="appointmentWrapper" class="pSection"></div>
<script type="text/x-handlebars" data-template-name='main'>
    <div class="apptHelpWrapper"></div>
    <div style="margin-bottom:10px;display:none;" class="bckToSchedule" >
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        <a href="#" class="activeItem scheduleLink"></a>
    </div>
    <div class="apptSidebar">
        {{#if canAdmin}}
            <div>
                {{#link-to 'campus' classNames="permissionAction"}}<i class="fa fa-wrench"></i>{{{g11n.adminCampus}}}{{/link-to}}
            </div>
        {{/if}}
         {{#if canManageSettings}}
        <div>
            {{#link-to 'settings' classNames="permissionAction"}}<i class="fa fa-cog"></i>{{{g11n.apptSetup}}}{{/link-to}}
        </div>
        <div class='permHosts' style='display:none'>
            <a href='#' class='permissionAction'></a>
        </div>
        {{/if}}
        {{#if ableToEdit}}
        <div>
            {{#link-to 'schedule' classNames="activeAction mySchedule"}}{{{g11n.addToSch}}}{{/link-to}}
        </div>
        {{/if}}
        <div class="rg-sidebar" style="display:none;">
            <span class="findAppts activeAction">{{{g11n.addToSch}}}</span>
            <div class="searchAppts">
                <span class="inactiveItem">{{{g11n.myApptSchedules}}}</span>
                <ul id="userSchedules"></ul>
            </div>
        </div>
        <span class="findAppts activeAction">{{{g11n.findAppt}}}</span>
        <div class="searchAppts">
            <span class="inactiveItem">{{{g11n.searchAppt}}}</span>
            <div id="peopleChooser"></div>
            <div class="campusWrapper" style="display:none;">
                <span class="inactiveItem">{{{g11n.campusResources}}}</span>
                <ul id="campusResources"></ul>
            </div>
            <div class='myFacWrapper' style="display:none">
                <span class='myFacTitle inactiveItem'>{{{g11n.myFaculty}}}</span>
                <div class='myFacUsers'></div>
            </div>
        </div>
    </div>
    <div class="apptCalendar">
        <span class="apptsHeader">{{{g11n.myCal}}}</span>
        <div id="myNotifications" class="apptNotificationMain"></div>
        <div id="myCalendar"></div>
        <div class='apptKeyContainer'>
            <div class='apptKey inactiveItem'>{{{g11n.apptKey}}}</div>
            <div class="apptKeyHolder">
                <div class='apptKeyInfo activeAction'>
                    <span>{{{g11n.mySignedUp}}}</span>
                    <span>{{{g11n.chooseOne}}}</span>
                </div>
                <div class='apptKeyInfo otherEvents'>
                    <span><i class="fa fa-circle"></i> {{{g11n.otherEvents}}}</span>
                    <span>&nbsp;</span>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top:10px;display:none;" class="bckToSchedule" >
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        <a href="#" class="activeItem scheduleLink"></a>
    </div>


</script>
<script type="text/x-handlebars" data-template-name='schedule'>
    <div id="apptHelp" class="apptHelpWrapper"></div>
    <div id="managerHelp" class="apptHelpWrapper" style="display:none;margin-right:10px;"></div>
    <div class="backLnk">
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        {{#if isAnyone}}
            {{#link-to 'main' classNames="activeItem"}}{{{g11n.bckCal}}}{{/link-to}}
        {{else}}
            {{#link-to 'mainParam' 'myS' classNames="activeItem"}}{{{g11n.bckCal}}}{{/link-to}}      
        {{/if}}   
    </div>
    {{#unless isSpecific}}
        <div class="mySchedulePersonal">
            <img class="userPhoto"/>
            <div class="myScheduleInfo">
                <span class='apptsHeader'></span>
                {{#if resource.id}}
                    <span class="rg-location">{{{resource.location}}}</span>
                    <div class="rg-descrip">{{{resource.description}}}</div>
                    {{#if resource.canEdit}}
                        <div id="introMesgWrapper" class="settingWrapper settingSelected" style="display:none;">
                            <span class="inactiveItem">{{{g11n.changeIntro}}}</span>
                            <textarea id="txtIntro"></textarea>
                            <div class='apptDetailAction'>
                                <button type="button" class="activeAction">{{{g11n.saveChanges}}}</button>
                                <a href='' class='activeItem'>{{{g11n.noThanks}}}</a>
                            </div>
                        </div>
                        <a id="hypChangeIntro" href="" class="activeItem"><i class="fa fa-pencil activeItem"></i> {{{g11n.changeIntro}}}</a>
                    {{/if}}
                {{else}}
                    {{#if isEditMode}}
                        <span class="inactiveItem itemInfo">{{{g11n.apptWithMe}}}</span>    
                    {{else}}
                        <div id="myFaculty"></div>
                    {{/if}}
                {{/if}}
            </div>
            <div style="clear:both;"></div>
        </div>
    {{else}}
        <div class='specificHostsWrapper'>
            <span>{{{g11n.apptsWith}}}</span>
            <div>
                <ul id='specificHosts'></ul>
            </div>
        </div>
    {{/unless}}
    <div id="scheduleNotifications" class="apptNotificationSchedule"></div>
    <div class="miniCalWrapper">
        <div id="miniCalendar" class='miniCalCalendar'></div>
        <div class="miniCal-details">
            {{#if isSpecific}}
                {{#if isEditMode}}
                    <div class="specificShowHosts">
                        <span class="specificHostInfo"></span> &nbsp;
                        <a href="#" id="specificHostLnk" class="activeItem"></a>
                    </div>
                {{/if}}
            {{/if}}
            <div class="miniCalInfo">
                <span class="miniCalApptCount"></span>
                <span class="inactiveItem chooseDay">{{{g11n.chooseDay}}}</span>
                <ul class="inactiveItem itemInfo">
                    <li><span class="bxWithAppt"></span>{{#if isEditMode}}{{{g11n.daysWithAppt}}}{{else}}{{{g11n.youHaveAppts}}} {{/if}}</li>
                    <li><span class="bxAvailAppt"></span>{{{g11n.daysWithAvailAppt}}}</li>
                    <li><span class="bxDaysViewing currentViewDay"></span>{{{g11n.daysViewing}}}</li>
                </ul>
            </div>
            {{#if canAddAppt}}
                <div class='addApptTop'>
                    <div class="addApptActions">
                        <button id="addAppt" class="activeAction" type="button">{{{g11n.addAppt}}}</button>
                        {{#if canAdmin}}
                            {{#link-to 'campus' classNames="permissionAction"}}<i class="fa fa-wrench"></i>{{{g11n.adminCampus}}}{{/link-to}}
                        {{/if}}
                         {{#if canManageSettings}}
                            {{#link-to 'settings' classNames="permissionAction"}}<i class="fa fa-cog"></i>{{{g11n.apptSetup}}}{{/link-to}}
                         {{/if}}
                        {{#if resource.canEdit}}
                            <a href='#' id='schManageResHosts' class='permissionAction'><i class="fa fa-group"></i>{{{g11n.managersAndHosts}}}</a>
                        {{/if}}
                    </div>
                    <span class="inactiveItem itemInfo">{{{g11n.addApptInfo}}}</span>
                </div>
                {{#if resource.canEdit}}
                    <div class="settingWrapper resourceHostWrapper">
                        <span>{{{g11n.showApptWith}}}</span> <select id="selShowHosts"></select>
                    </div>
                {{/if}}
            {{else}}
                <div class='addApptTop'>
                    <span class="inactiveItem chooseDay">{{{g11n.chooseAppt}}}</span>
                    <div class='apptKeyInfo fc-event'>
                      {{#unless resource.id}}
                            {{#if isSpecific}}
                                <span class="availAppt">{{{g11n.availAppts}}}</span>
                            {{else}}
                                <span class="availAppt">{{{stringFormat g11n.availWithUser user.name.full}}}</span>
                            {{/if}}
                      {{else}}
                            <span class="availAppt">{{{stringFormat g11n.availWithUser resource.name}}}</span>
                      {{/unless}}
                    </div>
                    <div  class='apptKeyInfo activeAction'>
                          {{#unless resource.id}}
                            {{#if isSpecific}}
                                <span class="availAppt">{{{g11n.signedUpAppts}}}</span>
                            {{else}}
                                <span class="availAppt">{{{stringFormat g11n.signedUp user.name.full}}}</span>
                            {{/if}}
                          {{else}}
                             <span class="availAppt">{{{stringFormat g11n.signedUpWith resource.name}}}</span>
                          {{/unless}}
                    </div>
                    <div  class='apptKeyInfo inactiveItem'>
                        <span>{{{g11n.eventsOnCal}}}</span>
                        <span class="alreadyBusy">{{{g11n.alreadyBusy}}}</span>
                    </div>
                </div>
            {{/if}}
        </div>
    </div>
    <div style="clear:both;margin-bottom:10px;"></div>
    
    <div id="calendar"></div>
    <div class='apptKeyContainer'>
        <div class='apptKey inactiveItem'>{{{g11n.apptKey}}}</div>
        <div class="apptKeyHolder">
            <div class='apptKeyInfo fc-event'>
                {{#if resource.id}}
                    <span class="availAppt">{{{stringFormat g11n.availWithUser resource.name}}}</span>
                {{else}}
                    {{#if isSpecific}}
                        <span class="availAppt">{{{g11n.availAppts}}}</span>
                    {{else}}
                        <span class="availAppt">{{{stringFormat g11n.availWithUser user.name.full}}}</span>
                    {{/if}}
                {{/if}}
                <span>{{{g11n.seeDetails}}}</span>
            </div>
            <div  class='apptKeyInfo activeAction'>
                {{#if resource.id}}
                    <span class="availAppt">{{{stringFormat g11n.signedUp resource.name}}}</span>
                {{else}}
                    {{#if isSpecific}}
                        <span class="availAppt">{{{g11n.signedUpAppts}}}</span>
                    {{else}}
                        <span class="availAppt">{{{stringFormat g11n.signedUp user.name.full}}}</span>
                    {{/if}}
                {{/if}}
                <span>{{{g11n.seeOrCancel}}}</span>
            </div>
            {{#unless resource.canEdit}}
            <div  class='apptKeyInfo inactiveItem'>
                <span>{{{g11n.eventsOnCal}}}</span>
                <span class="alreadyBusy">{{{g11n.alreadyBusy}}}</span>
            </div>
            {{/unless}}
        </div>
    </div>
    <div>
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        {{#if resource.name}}
            {{#link-to 'mainParam' 'myS' classNames="activeItem"}}{{{g11n.bckCal}}}{{/link-to}}   
        {{else}}
            {{#link-to 'main' classNames="activeItem"}}{{{g11n.bckCal}}}{{/link-to}}   
        {{/if}}
    </div>
    <div class="signUpAppt" style="display:none;">
        <div class="signUpInfo">
            <div class='signUpDescip'></div>
            <div class='signUpDate'></div>
            <div class='signUpTime'></div>
            <div class='signUpOverlap'></div>
            <div class='signUpAttendees' style="display:none;">
                <a href="" class="activeItem"><i class="fa fa-user activeItem"></i> {{{g11n.addAttendees}}}</a>
            </div>
        </div>
        <div class="signUpChooserWrapper" style="display: none">
            <div id="signUpChooser"></div>
            <div class='apptDetailAction'>
                <button id="savePeople" class="activeAction">{{{g11n.savePeople}}}</button>
                <a id="cancelPeople" href='' class='activeItem'>{{{g11n.noThanks}}}</a>
            </div>
        </div>
        <div class='signupAction apptDetailAction'>
            <button type="button" class="activeAction"><i class='fa fa-check'></i> {{{g11n.signUp}}}</button>
            <a href='' class='activeItem'>{{{g11n.noThanks}}}</a>
        </div>
    </div>


</script>
<script type="text/x-handlebars" data-template-name='settings'>
    <div style="margin-bottom:10px;">
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        <a id="goBack" href='#' class="activeItem" {{action goBack}}></a>
    </div>
    <div class="settingsHeader">
        <span class="apptsHeader">{{{g11n.apptSetup}}}</span>
        <span class="inactiveItem itemInfo">{{{g11n.settingsInfo}}}</span>
    </div>
    <div class="settingsSelector">
        <div class="settingWrapper">
            <input type="radio" name="setting" id="radAnyone" value="0" /> 
            <div class="settingTxt">
                <label for="radAnyone" class="settingName">{{{g11n.anyone}}}</label>
                <p class="settingInfo">{{{g11n.anyoneInfo}}}</p>
                <div class="inactiveItem itemInfo">{{{g11n.anyoneDetails}}}</div>
            </div>
        </div>
        <div class="settingWrapper">
            <input type="radio" name="setting" id="radJustMe" value="1" />  
            <div class="settingTxt">
                <div>
                    <label for="radJustMe" class="settingName">{{{g11n.justMe}}}</label> <span class="justMeName inactiveItem itemInfo"></span>
                </div>
                <p class="settingInfo">{{{g11n.justMeInfo}}}</p>
                <div class="inactiveItem itemInfo">{{{g11n.justMeDetails}}}</div>
            </div>
        </div>
        <div class="settingWrapper">
            <input type="radio" name="setting" id="radSpecific" value="2" /> 
            <div class="settingTxt">
                <label for="radSpecific" class="settingName">{{{g11n.specific}}}</label>
                <p class="settingInfo">{{{g11n.specificInfo}}}</p>
                <div class="settingDetails inactiveItem itemInfo">{{{g11n.specificDetails}}}</div>
                <div class="settingOptions">
                    <a href="#" class="activeItem showHideDetails"></a>
                    <div class='settingHosts'>
                        <span class="inputDescrip">{{{g11n.hosts}}}</span>
                        <span id="hosts" class='rg-host-holder'></span>
                    </div>
                    <div>
                        <a href="#" id="manageSpecific" class="activeItem"><i class="fa fa-group"></i>{{{g11n.manageApptHosts}}}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="settingWrapper">
            <input type="radio" name="setting" id="radResource" value="3" /> 
            <div class="settingTxt">
                <label for="radResource" class="settingName">{{{g11n.resource}}}</label>
                <p class="settingInfo">{{{g11n.resourceInfo}}}</p>
                <div class="settingDetails inactiveItem itemInfo">{{{g11n.resourceDetails}}}</div>
                <div class="settingOptions">
                    <a href="#" class="activeItem showHideDetails"></a>
                    <div>
                        <div id="chooseResource">
                            <select id="selResource"></select> <span class="orSpacer inactiveItem">{{{g11n.or}}}</span> <a href="#" class="activeItem" id="createResource">{{{g11n.createResource}}}</a>
                        </div>
                        <div id="resourceContainer"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
<script type="text/x-handlebars" data-template-name='manageHosts'>
    <div style="margin-bottom:10px;">
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        <a href='#' class="goBack activeItem" {{action goBack}}></a>
    </div>
    <div>
        <i class="fa fa-group fa-2x"></i><span class="mh-header"></span>
        <span class="mh-header-info"></span>
    </div>
    <div id="manageManagers" class="mh-wrapper">
        <span class="apptsHeader"></span>
        <span class="inactiveItem infoItem"></span>
        <div class="settingWrapper settingSelected">
            <table id="tblManagers" class="mh-table" >
                <thead>
                    <tr>
                        <th id="thManager" class="inactiveItem">{{{g11n.manager}}}</th>
                        <th class="mh-remove inactiveItem">{{{g11n.remove}}}</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
            <div >
                <a href="#" id="managers" class="activeItem"><i class="fa fa-group"></i> {{{g11n.chooseDiff}}}</a>
            </div>
        </div>
    </div>
    <div id="manageHosts" class="mh-wrapper">
        <span class="apptsHeader">{{{g11n.apptHosts}}}</span>
        <span class="inactiveItem infoItem mh-host-mesg"></span> <br />
        <span class="inactiveItem infoItem">{{{g11n.addOrRemove}}}</span>
        <div class="settingWrapper settingSelected">    
            <table id="tblHosts" class="mh-table" >
                <thead>
                    <tr>
                        <th class="inactiveItem">{{{g11n.host}}}</th>
                        <th class="inactiveItem">{{{g11n.canSchedule}}}</th>
                        <th class="mh-remove inactiveItem">{{{g11n.remove}}}</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
            <div>
                <a href="#" id="hosts" class="activeItem"><i class="fa fa-group"></i> {{{g11n.chooseDiff}}}</a>
            </div>
        </div>
    </div>
    <div id="managePeople"></div>
    <div class='confirmModal' style="display: none;">
        <div class='confirmMesg'></div>
        <div class='confirmInfo'></div>
        <div class='apptDetailAction'>
            <button type="button" class="activeAction"></button>
            <a href='' class='activeItem'></a>
        </div>
    </div>
    <div id='hostRemoval' style="display: none;">
        <div class='confirmMesg'></div>
        <div class='confirmInfo'></div>
        <div id="hostReassign">

        </div>
        <div class='apptDetailAction'>
            <button type="button" class="activeAction"></button>
            <a href='' class='activeItem'></a>
        </div>
    </div>
    <div style="margin-bottom:10px;">
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        <a  href='#' class="goBack activeItem" {{action goBack}}></a>
    </div>
</script>
<script type="text/x-handlebars" data-template-name='campus'>
    <div style="margin-bottom:10px;">
        <i class="fa fa-angle-left apptStrong inactiveItem"></i>
        <a href='#' class="goBack activeItem" {{action goBack}}></a>
    </div>
    <div>
        <button id="campusNewResource" type="button" class="activeAction" style="float:right;margin-bottom:30px;"><i class="fa fa-plus-circle"></i> {{{g11n.createResource}}}</button>
        <div id="newCampusResource"></div>
        <div>
            <i class="fa fa-wrench fa-lg pull-left"></i>
            <div class="campusResourceInfo">
                <span class="apptsHeader">{{{g11n.adminCampus}}}</span>
                <div class="inactiveItem itemInfo">{{{g11n.adminCampusInfo}}}</div>
            </div>
        </div>
        <div class='campusSection'>
            <span class='apptsHeader'>{{{g11n.campusResources}}}</span>
            <div id='campusResources' class='resourceWrapper'>
            </div>
        </div>
        <div class='campusSection'>
            <span class='apptsHeader'>{{{g11n.otherResources}}}</span>
            <div id='otherResources' class='resourceWrapper'>
            </div>
        </div>
    </div>
</script>
<script type="text/x-handlebars" data-template-name='noAccess'>
    {{{g11n.mustLogIn}}} 
</script>

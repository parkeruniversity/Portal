 Jcf.parms = {
    rowCounter: 0,
    currentElement: null,
    resizeItem: null,
    resizing: false,
    resizeStart: null,
    resizeLabel: null,
    resizeElem: null,
    colResizeItem: null,
    colResizing: false,
    colResizeStart: null,
    colResize: null,
    neiResize: null,
    tempPrev: null,
    newTab: 0
};
 Jcf.utils = {
     findDatasource: function(id) {
         var ds = Jcf.func.getDatasources();
         for (var x in ds) {
             if (ds[x].QueryID == id)
                 return ds[x];
         }
         return {};
     },
     keySort: function(key, desc) {
         return function(a, b) {
             return desc ? ~~(a[key] < b[key]) : ~~(a[key] > b[key]);
         }
     },
     checkUniqueId: function (tbx) {
         jQuery(".propertySave").attr("disabled", "disabled");
         Jcf.post("CheckUniqueID",
             { uniqueId: jQuery(tbx).val(), formId: jQuery("[id*=itmParent]").val(), itemId: jQuery("[id*=itmID]").val() },
             function(data) {
                 if (data.d.isError) {
                     Jcf.common.ui.handleError(data.d.Message, "CheckUniqueID");
                 } else {
                     jQuery(".propertySave").removeAttr("disabled");
                     jQuery(tbx).css("background-color'", "white");
                 }
             });
     },
     checkRequirements: function() {
         if (jQuery('[id*=itmLabel]').val() == '') {
             alert("Unique ID is a required field. Please add an ID before saving.");
             return false;
         }

         return true;
     },
     split: function(val) {
         return val.split(/[_ -\(\)\"\']+/);
     },
     extractLast: function(term) {
         return Jcf.utils.split(term).pop();
     }
 };
 Jcf.cache = {
     DataSources: null,
     EmailTemplates: null,
     Tabs: null,
     QuestionGroups: null,
     PaymentProfiles: null,
     Questions: null,
     Workflows: null,
     MappableQuestions: null,
     CollectionGridQuestions: null,
     EventActions: null
 };
 Jcf.templates = {
     optionDef: function() {
         return '<input type="hidden" ID="_optID" />' +
             '<table>' +
             '<tr>' +
             '<td>Dbl Val</td>' +
             '<td>Value</td>' +
             '<td>Text</td>' +
             '<td>Selected</td>' +
             '</tr>' +
             '<tr>' +
             '<td><input type="text" ID="dbValTbx" runat="server" style="width:60px;"></td>' +
             '<td><input type="text" ID="TextBox1" runat="server" MaxLength="255"></td>' +
             '<td><input type="text" ID="TextBox2" runat="server" MaxLength="255"></td>' +
             '<td>' +
             '    <input type="checkbox" ID="OptionSelectCbx" CssClass="OptionSelectCbx" />' +
             '</td>' +
             '</tr>' +
             '</table>'
     },
     ruleDef: function() {
         var item = null;
         Jcf.post("GetEventRuleTemplate",
             { formId: $('[id*=itmParent]').val() },
             function(data) {
                 item = data.d.Object;
             },
             true);
         return $(item);
     }
 };
 Jcf.ui = {
     itemFormWork: function(busy) {
         if (busy) {
             var overlay = $("<div class='jcf-item-working'><i class='fa fa-spinner fa-spin fa-3x'></i></div>");
             $('.ui-dialog').append(overlay);
         } else {
             $('.ui-dialog .jcf-item-working').remove();
         }
     },
     getFormItemName: function(itm) {
         var name = $(itm).attr('name');
         if ($(itm).is('textarea')) {
             name = name.substring(name.lastIndexOf("$itm") + 1);
             name = name.substring(0, name.lastIndexOf("$"));
         } else {
             name = name.substring(name.lastIndexOf("$") + 1);
         }
         return name.replace("_dte", "");
     },
     getFormItemControl: function(prop) {
         var name = "$itm" + prop;
         var itm = $('[id*=pnlItemSettings] [name$="' + name + '"]');
         if (itm.length == 0) {
             itm = $('[id*=pnlItemSettings] [name*="' + name + '$"]');
         }
         return itm;
     },
     updateFormDisplay: function(data) {
         if (!data.d.isError) {
             var html = data.d.Value;
             var id = $("[id*=formTabs] .ui-state-active a").attr("data-tabid");
             var orig = $("[itemid*=" + data.d.ItemID + "]");
             var obj = $(html);
             var type = obj.find(".jcf-col").attr("itemtype");
             var reportOnly = obj.find(".jcf-col").attr("isreportonly") === "true";
             var gridHtml = data.d.Object !== "" ? $(data.d.Object) : null;
             var gridId = orig.length > 0 && orig.attr("data-grid") ? orig.attr("data-grid") : obj.find(".jcf-col").attr("data-grid");

             if (orig.length > 0)
                 orig.replaceWith(obj.find('.jcf-col'));
             else if (type == 'Hidden' || reportOnly) {
                 $('.jcf-hidden-questions').append(obj.find('.jcf-col'));
             } else {
                 $('[id*=Tab' + id + ']').append(obj);
             }

             if (gridHtml != null) {
                 var grid = $('[itemid*=' + gridId + ']');
                 if (grid.length > 0) {
                     grid.replaceWith(gridHtml.find('.jcf-col'));
                 }
             }

             Jcf.ui.makeContainersDroppable();
             renderItemJs();
             Jcf.ui.itemFormWork(false);
             Jcf.common.ui.closeModal();
             Jcf.ui.makeResizeable();
             Jcf.ui.clearFormItem();
             Jcf.ui.closeFormItem();
         }
         Jcf.ui.itemFormWork(false);
     },
     closeFormItem: function() {
         Jcf.common.ui.closeModal();
         Jcf.ui.clearFormItem();
         jQuery('[id*=hdnCurrentQuestion]').val('');
     },
     clearFormItem: function() {
         var objs = $('[id*=pnlItemSettings] :input').not(':input[type=button], :input[type=submit], :input[type=reset]');
         for (var x in objs) {
             var propObj = objs[x];
             var prop = propObj.name;
             if (prop == null)
                 prop = propObj.id;
             if (prop == null)
                 continue;
             prop = prop.substring(prop.indexOf("itm") + 3);
             if (prop == "Parent")
                 continue;
             var itm = Jcf.ui.getFormItemControl(prop);
             if ($(itm).is(':checkbox')) {
                 $(itm).removeAttr('checked');
                 $(itm).removeProp('checked');
             } else if ($(itm).is('textarea')) {
                 tinymce.get(jQuery(itm).attr('id')).setContent('');
             } else if ($(itm).is('radio') || $(itm).length > 1) {
                 $(itm).removeAttr('checked');
                 ShowPanels();
             } else if ($(itm).is('select')) {
                 $('option', itm).removeAttr('selected');
             } else {
                 $(itm).val('');
             }
         }
         $('.EventDef').remove();
         $('.jcf-param-label').closest('li').remove();
         $('[id*=optionsPanel] table tbody tr').remove();
         $('.jcf-lookup-map').remove();
     },
     addEventDef: function() {
         var item = $(Jcf.templates.ruleDef());
         var num = 0;
         $('[id*=pnlRules] #tbx_order').each(function() {
             if (parseInt($(this).val()) > num) {
                 num = parseInt($(this).val());
             }
         });
         $('#tbx_order', item).val(num + 1);
         $('[id*=pnlRules]').append(item);
         Jcf.ui.toggleEventActions(item);
     },
     deleteEventDef: function(def) {
         $(def).remove();
     },
     toggleEventActions: function(def) {
         var action = $(def).find('[id*=drp_do]').val();
         $(def).find('[id*=drp_groups]').hide();
         $(def).find('[id*=drp_eventOptions]').hide();
         $(def).find('[id*=drp_custom]').hide();
         $(def).find('[id*=drp_EmailTemplates]').hide();
         $(def).find('[id*=img_add_email]').hide();
         $(def).find('[id*=img_edit_email]').hide();
         $(def).find('[id*=drp_datasources]').hide();
         $(def).find('[id*=drp_question]').hide();
         $(def).find('[id*=tbx_message]').hide();
         $(def).find('[id*=drp_tabs]').hide();

         if (action != null && action.indexOf("ext:") != 0) {
             switch (action) {
             case "showQuestionGroup":
             case "hideQuestionGroup":
             case "makeGroupRequired":
             case "makeGroupNotRequired":
             case "toggleQuestionGroup":
             case "clearForm":
                 $(def).find('[id*=drp_groups]').show();
                 break;
             case "usePaymentProfile":
             case "clearPaymentProfile":
                 $(def).find('[id*=drp_eventOptions]').show();
                 break;
             case "sendEmail":
             case "cancelEmail":
                 $(def).find('[id*=drp_EmailTemplates]').show();
                 $(def).find('[id*=img_add_email]').show();
                 $(def).find('[id*=img_edit_email]').show();
                 Jcf.events.ruleDef.onEmailTemplateChanged($(def).find("#drp_EmailTemplates"));
                 break;
             case "setQuestionsDataSource":
                 $(def).find('[id*=drp_datasources]').show();
                 $(def).find('[id*=drp_question]').show();
                 break;
             case "overrideBalance":
             case "showMessage":
                 $(def).find('[id*=tbx_message]').show();
                 break;
             case "changeTab":
             case "showTab":
             case "hideTab":
             case "updateProgress":
                 $(def).find('[id*=drp_tabs]').show();
                 break;
             default:
                 break;
             }
         } else if (action != null) {
             action = action.replace('ext:', '');
             var actionDef = Jcf.func.getEventAction(action);
             $(def).attr('data-target', actionDef.Target);
             switch (actionDef.Target) {
             case 'Questions':
                 $(def).find('[id*=drp_question]').show();
                 break;
             case 'Datasources':
                 $(def).find('[id*=drp_datasources]').show();
                 break;
             case 'Tabs':
                 $(def).find('[id*=drp_tabs]').show();
                 break;
             case 'Groups':
                 $(def).find('[id*=drp_groups]').show();
                 break;
             case 'PaymentProfiles':
                 $(def).find('[id*=drp_eventOptions]').show();
                 break;
             case 'TextValue':
                 $(def).find('[id*=tbx_message]').show();
                 break;
             case 'Other':
                 $(def).find('[id*=drp_custom] option').remove();
                 $(def).find('[id*=drp_custom]').append('<option></option>');
                 for (var i in actionDef.Options) {
                     $(def).find('[id*=drp_custom]').append('<option value="' + actionDef.Options[i].Value + '">' + actionDef.Options[i].Text + '</option>');
                 }
                 $(def).find('[id*=drp_custom]').show();
                 break;
             }
         }
     },
     toggleEventConjunctions: function(def) {
         switch ($(def).find("[id*=drpConjunction]").val()) {
         case "And":
         case "Else":
             $(def).find('[id*=tbx_ansValue]').hide();
             break;
         default:
             $(def).find('[id*=tbx_ansValue]').show();
             break;
         }
     },
     addOptionDef: function() {
         var template = Jcf.templates.optionDef();
         $('[id*=optionsPanel]').append(template);
     },
     updateOptionParams: function() {
         var ds = $('[id*=itmDataSource]').val();
         var source = Jcf.utils.findDatasource(ds);
         $('[id*=_DPanel] ul').html('');
         var select = $('<select class="jcf-param-target" id="drpQuestions"><option></option></select>');
         var qs = Jcf.func.getQuestions();

         for (var i in qs) {
             select.append('<option value="' + qs[i].ID + '">' + qs[i].Label + '</option>');
         }

         for (var x in source.Params) {
             var prm = source.Params[x];
             if (prm.Name.indexOf('@@') == 0)
                 continue;
             var li = $('<li><span class="jcf-param-label" id="lblParam">' + prm.Name + '</span></li>');
             li.append(select.clone());
             $('[id*=_DPanel] ul').append(li);
         }
     },
     populateFormItemOptions: function(options) {
         $('[id*=optionsPanel]').html('');
         for (var x in options) {
             var temp = $(Jcf.templates.optionDef());

             $('[id*=_optID]', temp).val(options[x].ID);
             $('[id*=dbValTbx]', temp).val(options[x].DoubleValue);
             $('[id*=TextBox1]', temp).val(options[x].Value);
             $('[id*=TextBox2]', temp).val(options[x].Text);
             $('[id*=OptionSelectCbx]', temp)[0].checked = options[x].Selected;

             $('[id*=optionsPanel]').append(temp);
         }
     },
     populateFormItemRules: function(rules) {
         $('[id*=pnlRules]').html('');
         for (var x in rules) {
             var rule = Jcf.templates.ruleDef();
             $('[id*=tbx_order]', rule).val(rules[x].OrderNum);
             $('[id*=drpConjunction]', rule).val(rules[x].Conjunction);
             $('[id*=tbx_ansValue]', rule).val(rules[x].Value);
             $('[id*=drp_do]', rule).val(rules[x].Action);
             $('[id*=drp_question]', rule).val(rules[x].TargetItem);
             switch (rules[x].Action) {
             case "showQuestionGroup":
             case "hideQuestionGroup":
             case "makeGroupRequired":
             case "makeGroupNotRequired":
             case "toggleQuestionGroup":
             case "clearForm":
                 $('[id*=drp_groups]', rule).val(rules[x].Parameter);
                 break;
             case "setQuestionsDataSource":
                 $('[id*=drp_datasources]', rule).val(rules[x].Parameter);
                 break;
             case "usePaymentProfile":
             case "clearPaymentProfile":
                 $('[id*=drp_eventOptions]', rule).val(rules[x].Parameter);
                 break;
             case "showMessage":
             case "overrideBalance":
                 $('[id*=tbx_message]', rule).val(rules[x].Parameter);
                 break;
             case "changeTab":
             case "showTab":
             case "hideTab":
             case "updateProgress":
                 $('[id*=drp_tabs]', rule).val(rules[x].Parameter);
                 break;
             case "sendEmail":
             case "cancelEmail":
                 $('[id*=drp_EmailTemplates]', rule).val(rules[x].Email);
                 break;
             case "submitForm":
             case "saveForm":
             case "addToGrid":
             case "formQuit":
                 break;
             default:
                 $('[id*=drp_do]', rule).val('ext:' + rules[x].Action);
                 break;
             }
             Jcf.ui.toggleEventActions(rule);

             switch (rules[x].Target) {
             case 'Questions':
                 rule.Parameter = $('[id*=drp_question]', rule).val(rules[x].Parameter);
                 break;
             case 'Datasources':
                 rule.Parameter = $('[id*=drp_datasources]', rule).val(rules[x].Parameter);
                 break;
             case 'Tabs':
                 rule.Parameter = $('[id*=drp_tabs]', rule).val(rules[x].Parameter);
                 break;
             case 'Groups':
                 rule.Parameter = $('[id*=drp_groups]', rule).val(rules[x].Parameter);
                 break;
             case 'PaymentProfiles':
                 rule.Parameter = $('[id*=drp_eventOptions]', rule).val(rules[x].Parameter);
                 break;
             case 'TextValue':
                 rule.Parameter = $('[id*=tbx_message]', rule).val(rules[x].Parameter);
                 break;
             case 'Other':
                 rule.Parameter = $('[id*=drp_custom]', rule).val(rules[x].Parameter);
                 break;
             }
             Jcf.ui.toggleEventConjunctions(rule);
             $('[id*=pnlRules]').append(rule);
         }
     },
     populateFormItemOptionParams: function(params) {
         for (var x in params) {
             $('[id*=_DPanel] ul .jcf-param-label:contains("' + params[x].Name + '")').next('select').val(params[x].Value);
         }
     },
     makeResizeable: function() {
         jQuery('.jcf-col').mouseover(function() {
             jQuery('.resizeHandle', this).show();
             jQuery('.colResizeHandle', this).show();
         });
         jQuery('.jcf-col').mouseout(function() {
             jQuery('.resizeHandle', this).hide();
             jQuery('.colResizeHandle', this).hide();
         });

         jQuery('.resizeHandle').mousedown(function() {
             Jcf.parms.resizing = true;
             Jcf.parms.resizeItem = this;
             return false;
         });
         jQuery('.colResizeHandle').mousedown(function() {
             Jcf.parms.colResizing = true;
             Jcf.parms.colResizeItem = this;
             return false;
         });
         jQuery(document).mouseup(function() {
             if (Jcf.parms.resizing)
                 Jcf.func.saveColumnWidths(Jcf.parms.resizeItem);
             else if (Jcf.parms.colResizing)
                 Jcf.func.saveColumnWidths(Jcf.parms.colResizeItem);
             Jcf.parms.resizing = false;
             Jcf.parms.resizeItem = null;
             Jcf.parms.resizeStart = null;
             Jcf.parms.resizeLabel = null;
             Jcf.parms.resizeElem = null;
             Jcf.parms.colResizeItem = null;
             Jcf.parms.colResizeStart = null;
             Jcf.parms.colResizing = false;
             Jcf.parms.colResize = null;
             Jcf.parms.neiResize = null;
             return false;
         });
         var mousePos;
         window.onmousemove = handleMouseMove;

         function handleMouseMove(event) {
             event = event || window.event; // IE-ism
             mousePos = {
                 x: event.clientX,
                 y: event.clientY
             };
             if (Jcf.parms.resizing)
                 Jcf.events.onItemResizing(Jcf.parms.resizeItem, mousePos);
             else if (Jcf.parms.colResizing)
                 Jcf.events.onColResizing(Jcf.parms.colResizeItem, mousePos);
         }
     },
     addEditEmailTemplate: function(sender, action) {
         $('#EmailTemplateBuilder').show();
         $('[id*=_pnlRules]').hide();
         if (action == 1) {
             //add
         } else {
             Jcf.func.getEmail(sender);
         }
     },
     clearEmailTemplate: function() {
         $('#EmailTemplateBuilder').hide();
         $('[id*=_pnlRules]').show();
         $('[id*=_emlEmailFrom]').val('');
         $('[id*=_emlEmailTo]').val('');
         $('ul[id*=ulEmails] span').remove();
         $('[id*=_emlSubject]').val('');
         $('[id*=emlIncludeSub]').removeProp('checked');
         tinymce.get(jQuery('textarea[id*=_emlMessage]').attr('id')).setContent('');
     },
     renderTabs: function() {
         if (jQuery('[id*=formTabs]').length > 0) {
             //Fix Tab IDs in Navigation so that the tabs render properly
             jQuery('[id*=formTabs] ul:first li').each(function() {
                 var id = jQuery('a', this).attr('data-tabid');
                 var href = jQuery('a', this).attr('href');
                 var newid = jQuery('[id*=formTabs] div[id*=' + id + ']').attr('id');
                 jQuery('a', this).attr('href', href.replace('#Tab' + id, '#' + newid));
             });
             //Render the tabs
             var tabs = jQuery('[id*=formTabs]').tabs({
                 active: jQuery('[id*=itmTab]').val(),
                 activate: function(event, ui) {
                     jQuery('[id*=itmTab]').val(ui.newTab.find('a').attr('data-tabid'));
                 }
             });
             tabs.find(".ui-tabs-nav").sortable({
                 axis: tabs.hasClass('jcf-vertical-tabs') ? "y" : "x",
                 stop: function() {
                     var x = [];
                     var count = 0;
                     jQuery('[id*=formTabs] .ui-tabs-nav li').each(function() {
                         var obj = {};
                         obj.ID = jQuery('a', this).attr('data-tabid');
                         obj.Order = count.toString();
                         x[x.length] = obj;
                         count++;
                     });
                     Jcf.post('SaveTabPosition',
                         { tabs: x },
                         function(data) {
                             if (data.isError)
                                 alert(data.Message);
                         });
                     jQuery('[id*=formTabs]').tabs("refresh");
                 }
             });
             if (tabs.hasClass('jcf-vertical-tabs')) {
                 tabs.addClass("ui-tabs-vertical ui-helper-clearfix");
                 jQuery('li', tabs).removeClass("ui-corner-top").addClass("ui-corner-left");
             }
         }
     },
     addRow: function() {
         var $newRow = jQuery('#BlankTemplate').clone();
         $newRow.attr('id', 'Row' + Jcf.parms.rowCounter.toString());
         var tab = jQuery('[id*=itmTab]').val();
         Jcf.parms.rowCounter++;
         jQuery('[id*=Tab' + tab + ']').append($newRow.show());
         Jcf.ui.makeContainersDroppable();
         Jcf.ui.makeRowsSortable();
     },
     addTab: function() {
         jQuery('#tabName').val('');
         jQuery('#tabID').val('');
         Jcf.common.ui.showModal('Add Tab',
             $('.tabSettingDiv'),
             300,
             null,
             $('.tabSettingDiv #JcfTabSave').toArray());
     },
     addQuestion: function() {
         $('.contextMenu').hide();
         Jcf.parms.currentElement = null;
         $(".ItemSettings :input:not([name*='$itm'])").val("");
         Jcf.ui.showProperties(true);
         Jcf.ui.itemFormWork(true);
         Jcf.ui.populateItemFormFromCache();
         Jcf.events.onQuestionTypeChanged();
         Jcf.ui.itemFormWork(false);
     },
     showProperties: function(isNewQuestion) {
         var type = jQuery('[id*="_itmType"]').val();
         if (type != "MultiItemEntry") {
             jQuery('[id*=_itmType] option[value="MultiItemEntry"]').remove();
         }

         var title = isNewQuestion ? 'Add Item' : 'Edit Item: ';
         if (isNewQuestion) {
             jQuery('[id*="itmType"]').val("Textbox");
             Jcf.events.onQuestionTypeChanged();
         }
         jQuery('[id*=itemTabs]').tabs('option', 'active', 0);
         Jcf.common.ui.showModal(title,
             $('.ItemSettings'),
             780);
         jQuery('.ui-dialog-titlebar-close').hide();
     },
     makeContainersDroppable: function() {
         jQuery('.jcf-row')
             .parent()
             .sortable({
                 tolerance: 'intersect',
                 items: '.jcf-col',
                 connectWith: '.sortable',
                 placeholder: "ui-state-highlight",
                 start:
                     function(event, ui) {
                         Jcf.parms.tempPrev = ui.item.closest('.jcf-row');
                     },
                 stop:
                     function(event, ui) {
                         var current = ui.item.closest('.jcf-row');
                         var previous = Jcf.parms.tempPrev;
                         Jcf.ui.fixColumns(previous, current);
                         Jcf.ui.makeContainersDroppable();
                         Jcf.func.savePosition();
                     }
             });
     },
     makeRowsSortable: function() {
         jQuery('.FormControls').sortable({
             tolerance: 'pointer',
             items: '.jcf-row',
             handler: '.RowHandle .dragHandle',
             stop: function(event, ui) {
                 Jcf.func.savePosition();
             }
         });
     },
     showSettingsModal: function() {
         Jcf.common.ui.showModal('Form Information',
             $('.FormSettings'),
             800,
             null,
             $('.jcf-form-settings-btn').toArray());
         jQuery('.ui-dialog-titlebar-close').hide();
     },
     fixColumns: function(previous, current) {
         if (previous != null) {
             var total = jQuery('.jcf-col', previous).length;

             if (total > 1) {
                 jQuery('#temp', previous).remove();
                 total = jQuery('.jcf-col', previous).length;
             } else if (total == 0)
                 jQuery(previous).append("<div id='temp' class='element QuestionContainer jcf-col'>&nbsp;</div>");
             var width = 100 / (total); //~94
             jQuery('.jcf-col', previous).css('width', Math.floor(width).toString() + '%');
             jQuery('.jcf-col', previous).attr('data-width', Math.floor(width).toString());
         }
         if (current != null) {
             var total = jQuery('.jcf-col', current).length;

             if (total > 1) {
                 jQuery('#temp', current).remove();
                 total = jQuery('.jcf-col', current).length;
             } else if (total == 0)
                 jQuery(current).append("<div id='temp' class='element QuestionContainer jcf-col'>&nbsp;</div>");

             var width = 100 / (total); //~94
             jQuery('.jcf-col', current).css('width', Math.floor(width).toString() + '%');
             jQuery('.jcf-col', current).attr('data-width', Math.floor(width).toString());
         }
         Jcf.ui.makeContainersDroppable();
     },
     toggleEmailEditor: function() {
         if (jQuery('[id*="_hdnShowEmail"]').val() != '') {
             jQuery('#RuleBuilder').hide();
             jQuery('#EmailTemplateBuilder').show();
             jQuery('[id*="_hdnShowEmail"]').val('');
             jQuery('.propertyControls').hide();
         }
     },
     setExtendedProperties: function(data) {
         if (data.d.isError) {
             Jcf.common.ui.handleError(data.d.Message, 'setExtendedProperties');
             return;
         }

         jQuery.each(data.d.DSList, function(index, element) {
             var input = jQuery('#' + index);
             switch (input.prop('type')) {
             case "checkbox":
                 if (element) {
                     input.prop('checked', true);
                 } else {
                     input.prop('checked', false);
                 }
                 break;
             case "text":
                 input.val(element);
                 break;
             case "radio":
                 input.prop('checked', true);
                 break;
             case "select-one":
                 input.val(element);
                 break;
             }
         });
         Jcf.ui.showProperties();

     },
     setFormProperties: function(data) {

         if (data.d.isError) {
             Jcf.common.ui.handleError(data.d.Message, 'setFormProperties');
             return;
         }

         jQuery.each(data.d.DSList, function(index, element) {
             var input = jQuery('#' + index);
             switch (input.prop('type')) {
             case "checkbox":
                 if (element) {
                     input.prop('checked', true);
                 } else {
                     input.prop('checked', false);
                 }
                 break;
             case "text":
                 input.val(element);
                 break;
             case "radio":
                 input.prop('checked', true);
                 break;
             case "select-one":
                 input.val(element);
                 break;
             }
         });
         Jcf.ui.showSettingsModal();
     },
     initTagDropdowns: function() {
         //All other input
         jQuery(".jcf-all-tags")
             // don't navigate away from the field on tab when selecting an item
             .bind("keydown", function(event) {
                 if (event.keyCode === $.ui.keyCode.TAB &&
                     jQuery(this).autocomplete("instance").menu.active) {
                     event.preventDefault();
                 }
             })
             .autocomplete({
                 minLength: 1,
                 source: function(request, response) {
                     // delegate back to autocomplete, but extract the last term
                     var qd = [];
                     for (var x in questionDictionary) {
                         qd[qd.length] = questionDictionary[x].name;
                     }
                     for (var x in lsrDictionary) {
                         qd[qd.length] = lsrDictionary[x].name;
                     }
                     response($.ui.autocomplete.filter(
                         qd, Jcf.utils.extractLast(request.term)));
                 },
                 focus: function() {
                     // prevent value inserted on focus
                     return false;
                 },
                 select: function(event, ui) {

                     var atPos = this.value.lastIndexOf("@@");
                     var bPos = this.value.lastIndexOf("{");

                     var pos = atPos;
                     if (bPos > atPos)
                         pos = bPos;

                     this.value = this.value.substring(0, pos);
                     this.value += ui.item.value;

                     return false;
                 },
                 open: function(event, ui) {
                     var input = jQuery(event.target),
                         widget = input.autocomplete("widget"),
                         style = $.extend(input.css([
                             "font",
                             "border-left",
                             "padding-left"
                         ]), {
                             position: "absolute",
                             visibility: "hidden",
                             "padding-right": 0,
                             "border-right": 0,
                             "white-space": "pre"
                         }),
                         div = jQuery("<div/>"),
                         pos = {
                             my: "left top",
                             collision: "none"
                         },
                         offset = 0; // magic number to align the first letter
                     // in the text field with the first letter
                     // of suggestions
                     // depends on how you style the autocomplete box

                     widget.css("width", "");

                     div
                         .text(input.val().replace(/\S*$/, ""))
                         .css(style)
                         .insertAfter(input);
                     offset = Math.min(
                         Math.max(offset + div.width(), 0),
                         input.width() - widget.width()
                     );
                     div.remove();

                     pos.at = "left+" + offset + " bottom";
                     input.autocomplete("option", "position", pos);

                     widget.position($.extend({ of: input }, pos));
                     widget.addClass("jcf-auto-complete-menu");
                 }
             });
         jQuery(".jcf-lsr-tags")
             // don't navigate away from the field on tab when selecting an item
             .bind("keydown", function(event) {
                 if (event.keyCode === $.ui.keyCode.TAB &&
                     jQuery(this).autocomplete("instance").menu.active) {
                     event.preventDefault();
                 }
             })
             .autocomplete({
                 minLength: 0,
                 source: function(request, response) {
                     // delegate back to autocomplete, but extract the last term
                     var qd = [];
                     for (var x in lsrDictionary) {
                         qd[qd.length] = lsrDictionary[x].name;
                     }
                     response($.ui.autocomplete.filter(
                         qd, Jcf.utils.extractLast(request.term)));
                 },
                 focus: function() {
                     // prevent value inserted on focus
                     return false;
                 },
                 select: function(event, ui) {

                     var pos = this.value.lastIndexOf("@@");
                     this.value = this.value.substring(0, pos);
                     this.value += ui.item.value;

                     return false;
                 },
                 open: function(event, ui) {
                     var input = jQuery(event.target),
                         widget = input.autocomplete("widget"),
                         style = $.extend(input.css([
                             "font",
                             "border-left",
                             "padding-left"
                         ]), {
                             position: "absolute",
                             visibility: "hidden",
                             "padding-right": 0,
                             "border-right": 0,
                             "white-space": "pre"
                         }),
                         div = jQuery("<div/>"),
                         pos = {
                             my: "left top",
                             collision: "none"
                         },
                         offset = 0; // magic number to align the first letter
                     // in the text field with the first letter
                     // of suggestions
                     // depends on how you style the autocomplete box

                     widget.css("width", "");

                     div
                         .text(input.val().replace(/\S*$/, ""))
                         .css(style)
                         .insertAfter(input);
                     offset = Math.min(
                         Math.max(offset + div.width(), 0),
                         input.width() - widget.width()
                     );
                     div.remove();

                     pos.at = "left+" + offset + " bottom";
                     input.autocomplete("option", "position", pos);

                     widget.position($.extend({ of: input }, pos));
                     widget.addClass("jcf-auto-complete-menu");
                 }
             });
         jQuery(".jcf-calc-tags")
             // don't navigate away from the field on tab when selecting an item
             .bind("keydown", function(event) {
                 if (event.keyCode === $.ui.keyCode.TAB &&
                     jQuery(this).autocomplete("instance").menu.active) {
                     event.preventDefault();
                 }
             })
             .autocomplete({
                 minLength: 0,
                 source: function(request, response) {
                     // delegate back to autocomplete, but extract the last term
                     var qd = [];
                     for (var x in questionPlusCGDictionary) {
                         qd[qd.length] = questionPlusCGDictionary[x].name;
                     }
                     for (var x in lsrDictionary) {
                         qd[qd.length] = lsrDictionary[x].name;
                     }
                     response($.ui.autocomplete.filter(
                         qd, Jcf.utils.extractLast(request.term)));
                 },
                 focus: function() {
                     // prevent value inserted on focus
                     return false;
                 },
                 select: function(event, ui) {

                     var atPos = this.value.lastIndexOf("@@");
                     var bPos = this.value.lastIndexOf("{");

                     var pos = atPos;
                     if (bPos > atPos)
                         pos = bPos;

                     this.value = this.value.substring(0, pos);
                     this.value += ui.item.value;

                     return false;
                 },
                 open: function(event, ui) {
                     var input = jQuery(event.target),
                         widget = input.autocomplete("widget"),
                         style = $.extend(input.css([
                             "font",
                             "border-left",
                             "padding-left"
                         ]), {
                             position: "absolute",
                             visibility: "hidden",
                             "padding-right": 0,
                             "border-right": 0,
                             "white-space": "pre"
                         }),
                         div = jQuery("<div/>"),
                         pos = {
                             my: "left top",
                             collision: "none"
                         },
                         offset = 0; // magic number to align the first letter
                     // in the text field with the first letter
                     // of suggestions
                     // depends on how you style the autocomplete box

                     widget.css("width", "");

                     div
                         .text(input.val().replace(/\S*$/, ""))
                         .css(style)
                         .insertAfter(input);
                     offset = Math.min(
                         Math.max(offset + div.width(), 0),
                         input.width() - widget.width()
                     );
                     div.remove();

                     pos.at = "left+" + offset + " bottom";
                     input.autocomplete("option", "position", pos);

                     widget.position($.extend({ of: input }, pos));
                     widget.addClass("jcf-auto-complete-menu");
                 }
             });

     },
     populateItemFormFromCache: function(item) {
         $('[data-populate="CollectionGridQuestions"] option').remove();
         var cgItems = Jcf.func.getCollectionGridQuestions();
         $('[data-populate="CollectionGridQuestions"]').append('<option></option>');
         for (var x in cgItems) {
             if (item != null && item.ID == cgItems[x].ID)
                 continue;
             $('[data-populate="CollectionGridQuestions"]').append('<option value="' + cgItems[x].ID + '">' + cgItems[x].Label + '</option>');
         }

         var questions = Jcf.func.getQuestions();
         $('[data-populate="Questions"] option').remove();
         $('[data-populate="Questions"]').append('<option/>');
         for (var x in questions) {
             if (item != null && item.ID == questions[x].ID)
                 continue;
             $('[data-populate="Questions"]').append('<option value="' + questions[x].ID + '">' + questions[x].Label + '</option>');
         }

         var mquestions = Jcf.func.getMappableQuestions();
         $('[data-populate="MappableQuestions"] option').remove();
         $('[data-populate="MappableQuestions"]').append('<option/>');
         for (var x in mquestions) {
             if (item != null && item.ID == mquestions[x].ID)
                 continue;
             $('[data-populate="MappableQuestions"]').append('<option value="' + mquestions[x].ID + '">' + mquestions[x].Label + '</option>');
         }

         var datasources = Jcf.func.getDatasources();
         $('[data-populate="Datasources"] option').remove();
         $('[data-populate="Datasources"]').append('<option/>');
         for (var x in datasources) {
             $('[data-populate="Datasources"]').append('<option value="' + datasources[x].QueryID + '">' + datasources[x].TagName + '</option>');
         }
     },
     fileUploaded: function(path) {
         $('[id*=itmPath]').val(path);
     },
     populateTabMenu: function (tab, action) {
         if (action == "Add") {
             var li = "<li id='" + tab.TabID + "' onclick='Jcf.func.setItemEditing();'>" +
                 "<a href='#' onclick='Jcf.func.moveToTab(\"" + tab.TabID + "\");return false;'>" + tab.Name + "</a></li>";
             $("#tabsAvailable").append(li);
         } else {
             $("#tabsAvailable #" + tab.TabID).remove();
         }
     },
     loadTabsMenu: function () {
         $("#tabsAvailable li").remove();
         $(".jcf-tabs ul li[role=tab] a").each(function () {
             var tab = {};
             tab.TabID = $(this).attr("data-tabid");
             tab.Name = $(this).html();
             Jcf.ui.populateTabMenu(tab, "Add");
         });
     }
 };
 Jcf.func = {
     getFormItem: function() {
         var item = {};
         
         $("[name*='$itm']").each(function() {
             var name = Jcf.ui.getFormItemName($(this));
             var prop = name.replace("itm", "");
             var val = null;
             if ($(this).is(':checkbox')) {
                 val = $(this).is(':checked');
             } else if ($(this).is(':radio')) {
                 var grp = $('[name="' + $(this).attr('name') + '"]');
                 var sel = grp.filter(':checked');
                 if (sel.length > 0 && sel.val() == 'rdo_Dynamic')
                     val = 1;
                 else
                     val = 0;
             } else if ($(this).is('textarea')) {
                 val = tinymce.get(jQuery(this).attr('id')).getContent();
             } else {
                 val = $(this).val();
             }
             item[prop] = val;
         });

         item.Options = Jcf.func.getFormItemOptions(item.ID);
         item.OptionParams = Jcf.func.getFormItemParams(item.ID);
         item.Rules = Jcf.func.getFormItemRules(item.ID);
         item.LookUpMappings = Jcf.func.getFormItemLookUpMapping(item.ID);
         item.MultiItems = Jcf.func.getFormItemMultiItem(item.ID);

         return item;
     },
     setFormItem: function (item) {
         Jcf.ui.populateItemFormFromCache(item);
         for (var prop in item) {
             if (prop == "Parent")
                 continue;
             var itm = Jcf.ui.getFormItemControl(prop);
             if (prop == "Path") {
                 var value = item[prop];
                 if (value !== "") {
                     $("[id*=frmFileUpload]").attr("src", uploadPath + "&value=" + value);
                 } else {
                     $('[id*=frmFileUpload]').attr('src', uploadPath);
                 }
             } else if ($(itm).is(':checkbox')) {
                 if (item[prop] == true) {
                     $(itm).attr('checked', 'checked');
                     $(itm).prop('checked', 'checked');
                 } else {
                     $(itm).removeAttr('checked');
                     $(itm).removeProp('checked');
                 }
             } else if ($(itm).is('textarea')) {
                 var value = item[prop];
                 value = value == null ? '' : value;
                 tinymce.get(jQuery(itm).attr('id')).setContent(value);
             } else if ($(itm).is('radio') || $(itm).length > 1) {
                 $(itm).removeAttr('checked');
                 if (item[prop] == 0) {
                     var btn = $(itm).filter(function() { return $(this).attr('id').indexOf('rdo_Static') >= 0; });
                     $(btn).prop('checked', 'checked');
                 } else {
                     var btn = $(itm).filter(function() { return $(this).attr('id').indexOf('rdo_Dynamic') >= 0; });
                     $(btn).prop('checked', 'checked');
                 }
                 ShowPanels();
             } else if ($(itm).is('select')) {
                 $('option', itm).removeAttr('selected');
                 var val = prop == 'Type' ? item.Type : item[prop]; //Firefox doesn't like the property Type
                 $(itm).val(val);
             } else {
                 $(itm).val(item[prop]);
             }
         }
         for (var o in item.ItemOptions) {
             var setting = $('[name="' + item.ItemOptions[o].Type + '"]');
             if (setting.length > 0)
                 setting.val(item.ItemOptions[o].Settings);
         }
         Jcf.ui.populateFormItemOptions(item.Options);
         Jcf.ui.populateFormItemRules(item.Rules);
         Jcf.ui.updateOptionParams();
         Jcf.func.updateFormItemLookupMapping();
         Jcf.ui.populateFormItemOptionParams(item.OptionParams);
         Jcf.events.onQuestionTypeChanged();
         var label = jQuery('[id*=itmLabel]').val();
         var title = 'Edit Item: ' + label;
         Jcf.common.CurrentModal.dialog('option', 'title', title);
     },
     editFormItem: function() {
         Jcf.func.setItemEditing();
         $('.contextMenu').hide();
         var id = jQuery('[id*=hdnCurrentQuestion]').val();
         Jcf.ui.showProperties(false);
         Jcf.ui.itemFormWork(true);
         Jcf.post('GetQuestion', { questionId: id }, function(data) {
                 if (!data.d.isError) {
                     Jcf.func.setFormItem(data.d.Object);
                     Jcf.ui.itemFormWork(false);
                 }
             },
             false);
     },
     getFormItemOptions: function(itemId) {
         var opts = [];
         $('[id*=_optID]').each(function() {
             var opt = {};
             opt.ID = $(this).val() == "" ? "" : $(this).val();
             opt.ItemID = itemId;

             var table = $(this).next('table');
             opt.Text = $(table).find('[id*=TextBox2]').val();
             opt.Value = $(table).find('[id*=TextBox1]').val();
             opt.DoubleValue = $(table).find('[id*=dbValTbx]').val();
             opt.Selected = $(table).find('[id*=OptionSelectCbx]').is(':checked');
             if (opt.Value != "")
                 opts[opts.length] = opt;
         });
         return opts;
     },
     getFormItemParams: function(itemId) {
         var params = [];

         //var ul = $('[id*=itmDataSource]').next('ul');
         $('[id*=DPanel] ul li').each(function() {
             var param = {};
             param.IsLSR = false;
             param.IsQuestion = true;
             param.Name = $('span[id*=lblParam]', this).html();
             param.Value = $('[id*=drpQuestions]', this).val();

             params[params.length] = param;
         });
         return params;
     },
     getFormItemRules: function(itemId) {
         var rules = [];
         $('.EventDef').each(function() {
             var target = $(this).attr('data-target');
             var rule = {};
             rule.ItemID = itemId;
             rule.OrderNum = $(this).find('[id*=tbx_order]').val();
             rule.Conjunction = $(this).find('[id*=drpConjunction]').val();
             rule.Value = $(this).find('[id*=tbx_ansValue]').val();
             rule.Action = $(this).find('[id*=drp_do]').val();
             rule.TargetItem = $(this).find('[id*=drp_question]').val();

             if (target == null) {
                 switch (rule.Action) {
                 case "showQuestionGroup":
                 case "hideQuestionGroup":
                 case "makeGroupRequired":
                 case "makeGroupNotRequired":
                 case "toggleQuestionGroup":
                 case "clearForm":
                     rule.Parameter = $(this).find('[id*=drp_groups]').val();
                     break;
                 case "setQuestionsDataSource":
                     rule.Parameter = $(this).find('[id*=drp_datasources]').val();
                     break;
                 //case "useApprovalTrack":
                 //    rule.Parameter = $(this).find('[id*=drp_custom]').val();
                 //    break;
                 case "usePaymentProfile":
                 case "clearPaymentProfile":
                     rule.Parameter = $(this).find('[id*=drp_eventOptions]').val();
                     break;
                 case "showMessage":
                 case "overrideBalance":
                     rule.Parameter = $(this).find('[id*=tbx_message]').val();
                     break;
                 case "changeTab":
                 case "showTab":
                 case "hideTab":
                 case "updateProgress":
                     rule.Parameter = $(this).find('[id*=drp_tabs]').val();
                     break;
                 case "sendEmail":
                 case "cancelEmail":
                     rule.Email = $(this).find('[id*=drp_EmailTemplates]').val();
                     break;
                 }
             } else {
                 rule.Action = rule.Action.replace('ext:', '');
                 switch (target) {
                 case 'Questions':
                     rule.Parameter = $(this).find('[id*=drp_question]').val();
                     break;
                 case 'Datasources':
                     rule.Parameter = $(this).find('[id*=drp_datasources]').val();
                     break;
                 case 'Tabs':
                     rule.Parameter = $(this).find('[id*=drp_tabs]').val();
                     break;
                 case 'Groups':
                     rule.Parameter = $(this).find('[id*=drp_groups]').val();
                     break;
                 case 'PaymentProfiles':
                     rule.Parameter = $(this).find('[id*=drp_eventOptions]').val();
                     break;
                 case 'TextValue':
                     rule.Parameter = $(this).find('[id*=tbx_message]').val();
                     break;
                 case 'Other':
                     rule.Parameter = $(this).find('[id*=drp_custom]').val();
                     break;
                 }
             }
             rules[rules.length] = rule;
         });
         return rules;
     },
     getFormItemLookUpMapping: function(itemId) {
         var mappings = [];
         $('.jcf-lookup-mappings tr').each(function() {
             var map = {};

             map.ColumnName = $(this).find('[id*=lblCol]').html();
             map.Parent = itemId;
             map.Target = $(this).find('[id*=drpItems]').val();

             mappings[mappings.length] = map;
         });
         return mappings;
     },
     getFormItemMultiItem: function(itemId) {
         var items = [];
         $('.midItem table tbody tr').each(function() {
             var item = {};

             item.Parent = itemId;
             item.Type = $(this).find('[id*=drpType]').val();
             item.Name = $(this).find('[id*=tbxName]').val();
             item.Validation = $(this).find('[id*=drpValidations]').val();
             item.DataSource = $(this).find('[id*=drpDataSources]').val();
             item.AddToBalance = $(this).find('[id*=cbxAddTo]').is(':checked');
             item.MultByBalance = $(this).find('[id*=cbxMultBy]').is(':checked');

             items[items.length] = item;
         });
         return items;
     },
     getGroupNames: function() {
         var formId = $('[id*=itmParent]').val();
         if (Jcf.cache.QuestionGroups == null) {
             Jcf.post('GetQuestionGroups',
                 { formId: formId },
                 function(data) {
                     var groups = data.d.Object;
                     Jcf.cache.QuestionGroups = groups;
                 }, true);
         }
         return Jcf.cache.QuestionGroups;
     },
     getPaymentProfiles: function() {
         var formId = $('[id*=itmParent]').val();
         if (Jcf.cache.PaymentProfiles == null) {
             Jcf.post('GetPaymentProfiles',
                 { formId: formId },
                 function(data) {
                     var profiles = data.d.Object;
                     Jcf.cache.PaymentProfiles = profiles;
                 }, true);
         }
         return Jcf.cache.PaymentProfiles;
     },
     getWorkflows: function() {
         if (Jcf.cache.Workflows == null) {
             Jcf.post('GetWorkflows',
                 {},
                 function(data) {
                     var workflows = data.d.Object;
                     Jcf.cache.Workflows = workflows;
                 }, true);
         }
         return Jcf.cache.Workflows;
     },
     getQuestions: function() {
         if (Jcf.cache.Questions == null) {
             Jcf.post('GetQuestions',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var questions = data.d.Object;
                     Jcf.cache.Questions = questions;
                 }, true);
         }
         return Jcf.cache.Questions;
     },
     getMappableQuestions: function() {
         if (Jcf.cache.MappableQuestions == null) {
             Jcf.post('GetMappableQuestions',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var questions = data.d.Object;
                     Jcf.cache.MappableQuestions = questions;
                 }, true);
         }
         return Jcf.cache.MappableQuestions;
     },
     getCollectionGridQuestions: function() {
         if (Jcf.cache.CollectionGridQuestions == null) {
             Jcf.post('GetCollectionGridQuestions',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var questions = data.d.Object;
                     Jcf.cache.CollectionGridQuestions = questions;
                 }, true);
         }
         return Jcf.cache.CollectionGridQuestions;
     },
     getLookUpMapping: function() {
         var itemId = $('[id*=itmID]').val() == "" ? null : $('[id*=itmID]').val();
         var dataSourceId = $('[id*=itmLookUpDataSource]').val() == "" ? null : $('[id*=itmLookUpDataSource]').val();
         var maps = Jcf.func.getMappableQuestions();
         jQuery('.jcf-lookup-mappings .jcf-lookup-map').remove();
         var select = $('<select id="drpItems"><option></option></select>');
         for (var m in maps) {
             if (maps[m].ID == itemId)
                 continue;
             select.append('<option value="' + maps[m].ID + '">' + maps[m].Label + '</option>');
         }

         Jcf.post('GetLookUpMappings',
             { itemId: itemId, dataSourceId: dataSourceId },
             function(data) {
                 for (var x in data.d.Object) {
                     var obj = data.d.Object[x];
                     var row = $('<tr class="jcf-lookup-map">' +
                         '<td><label id="lblCol">' + obj.ColumnName + '</label></td>' +
                         '<td class="jcf-lookup-target"></td>' +
                         '</tr>');
                     var s = select.clone();
                     s.attr('id', 'drpItems' + x);
                     jQuery('option[value="' + obj.TargetId + '"]', s).attr('selected', true);
                     jQuery('.jcf-lookup-target', row).append(s);
                     jQuery('.jcf-lookup-mappings').append(row);
                 }
             }, true);
     },
     getDatasources: function() {
         if (Jcf.cache.DataSources == null) {
             Jcf.post('GetDatasources',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var ds = data.d.Object;
                     Jcf.cache.DataSources = ds;
                 }, true);
         }
         return Jcf.cache.DataSources;
     },
     getTabs: function() {
         if (Jcf.cache.Tabs == null) {
             Jcf.post('GetTabs',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var tabs = data.d.Object;
                     Jcf.cache.Tabs = tabs;
                 }, true);
         }
         return Jcf.cache.Tabs;
     },
     getEventAction: function(action) {
         var actionDef = null;
         Jcf.post('GetEventAction',
             { formId: $('[id*=itmParent]').val(), action: action },
             function(data) {
                 actionDef = data.d.Object;
             }, true);
         return actionDef;
     },
     getEmailTemplates: function() {
         if (Jcf.cache.EmailTemplates == null) {
             Jcf.post('GetEmailTemplates',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var temps = data.d.Object;
                     Jcf.cache.EmailTemplates = temps;
                 }, true);
         }
         return Jcf.cache.EmailTemplates;
     },
     getEventActions: function() {
         if (Jcf.cache.EventActions == null) {
             Jcf.post('GetEventActions',
                 { formId: $('[id*=itmParent]').val() },
                 function(data) {
                     var temps = data.d.Object;
                     Jcf.cache.EventActions = temps;
                 }, true);
         }
         return Jcf.cache.EventActions;
     },
     saveFormItem: function() {
         if (!Jcf.utils.checkRequirements())
             return false;
         Jcf.ui.itemFormWork(true);
         var item = Jcf.func.getFormItem();
         var parms = {};
         $('[id*=_pnlItemSettings] :input').each(function() {
             parms[$(this).attr("name")] = $(this).val();
         });
         Jcf.ui.itemFormWork(true);
         Jcf.post('SaveFormItem', { item: item, parms: parms }, Jcf.ui.updateFormDisplay);
         jQuery('[id*=hdnCurrentQuestion]').val('');
         Jcf.cache.QuestionGroups = null;
         Jcf.cache.MappableQuestions = null;
         Jcf.cache.CollectionGridQuestions = null;
         Jcf.cache.Questions = null;
         //Jcf.ui.closeFormItem();
     },
     updateFormItemLookupMapping: function() {
         Jcf.func.getLookUpMapping();
     },
     saveTab: function(id) {
         var tabName = jQuery('#tabName').val();
         var showInReport = false;
         if (jQuery('#showInReport') != null)
             showInReport = jQuery('#showInReport').is(':checked');
         var add = true;
         if (id == null) {
             id = '00000000-0000-0000-0000-000000000000';
         }
         if (jQuery('#tabID').val() != '') {
             id = jQuery('#tabID').val();
             add = false;
         }
         Jcf.post('SaveTab',
             { tabID: id, tabName: tabName, showInReport: showInReport, formID: jQuery('[id*=itmParent]').val() },
             function(data) {
                 if (data.d.isError) {
                     alert(data.d.Message);
                 } else {
                     id = data.d.Value;

                     if (add) {
                         jQuery('.formTabs').append('<div id="newTab' + id.toString() + '" class="tabDiv jcf-tab"></div>');
                         jQuery('.formTabs ul:first').append('<li oncontextmenu="Jcf.events.onTabContextMenu(\'' + id.toString() + '\');return false;"><a href="' + pageUrl + '#newTab' + id.toString() + '" data-tabid="' + id + '">' + tabName + '</a></li>');
                     } else {
                         var tab = jQuery('[data-tabid*=' + id + ']');
                         var link = tabName;
                         tab[0].innerHtml = link;
                         tab[0].innerHTML = link;
                     }
                     Jcf.parms.newTab++;
                     jQuery('[id*=formTabs]').tabs('destroy');
                     Jcf.ui.renderTabs();
                     jQuery('#tabID').val('');
                     Jcf.ui.loadTabsMenu();
                     Jcf.common.ui.closeModal();
                 }
             });
     },
     deleteTab: function() {
         var id = $("[id*=hdnTabEditing]").val();
         if (confirm("Deleting this tab will delete all questions on the tab as well. Are you sure you want to continue?")) {
             Jcf.post("DeleteTab",
                 { tabID: id },
                 function(data) {
                     if (data.d.isError) {
                         alert(data.d.Message);
                     } else {
                         Jcf.func.selectedTab(id);
                         Jcf.ui.populateTabMenu({ TabID: id }, "Remove");
                         jQuery("[data-tabid*=" + id + "]").parent().remove();
                     }
                 });
         }
     },
     selectedTab: function(id) {
         var divId = jQuery('[data-tabid*=' + id + ']').attr('href');
         var next = jQuery('[data-tabid*=' + id + ']').parent().next('[role=tab]');
         jQuery(divId.substring(divId.indexOf('#'))).remove();
         if (next.length == 0)
             jQuery('[id*=itmTab]').val('');
         else
             jQuery('[id*=itmTab]').val(next.find('a').attr('data-tabid'));
     },
     editTab: function() {
         var id = $('[id*=hdnTabEditing]').val();
         var tab = jQuery('[data-tabid*=' + id + ']');
         var tabControls = jQuery('.tabControls', tab);
         var reportOnly = tabControls.attr('data-reportonly');
         var text = tab[0].innerText;

         jQuery('#tabName').val(text);
         jQuery('#tabID').val(id);
         if (reportOnly == 'true')
             jQuery('#showInReport').attr('checked', 'checked');
         else
             jQuery('#showInReport').removeAttr('checked');
         Jcf.common.ui.showModal('Edit Tab: ' + text,
             $('.tabSettingDiv'),
             300,
             null,
             $('.tabSettingDiv #JcfTabSave').toArray());
     },
     moveToTab: function(tabId) {
         Jcf.post("MoveToTab",
             {
                 itemId: Jcf.parms.currentElement.attr("itemid"),
                 targetTab: tabId
             },
             function(data) {
                 if (!data.d.isError) {
                     var row = $("#BlankTemplate").clone().append(Jcf.parms.currentElement);
                     row.attr("id", "newRow");
                     row.show();
                     $("#temp", row).remove();
                     $(row).appendTo($("[id*=Tab" + tabId + "]"));
                     Jcf.ui.makeRowsSortable();
                     $(".contextMenu").hide();
                 }
             });
     },
     getEmail: function(sender) {
         var portletId = $('[id*=hdnPortletID]').val();
         var templateId = $('#drp_EmailTemplates', $(sender).closest('.EventDef')).val();
         Jcf.post('GetEmail',
             { portlet: portletId, templateId: templateId },
             function(data) {
                 if (data.d.isError)
                     alert(data.d.Message);
                 else {
                     Jcf.ui.toggleEmailEditor();
                     var template = JSON.parse(data.d.Value);
                     jQuery('[id*=_emlID]').val(template.EmailID);
                     jQuery('[id*=_emlSendEvent]').val(template.SendEvent);
                     jQuery('[id*=_emlSubject]').val(template.Subject);
                     jQuery('[id*=hdnEmailTo]').val(template.EmailTo);
                     jQuery('[id*=_ulEmails]').html('');
                     if (template.EmailTo != "") {
                         var emailTo = template.EmailTo.split(";");
                         for (var x in emailTo) {
                             var li = jQuery('<li/>')
                                 .attr('xvalue', emailTo[x])
                                 .append('<a onclick="jQuery(this).parent().remove();">x</a>')
                                 .append('<span>' + emailTo[x] + '</span>');
                             if (emailTo[x] != "")
                                 jQuery('[id*=_ulEmails]').append(li);
                         }
                     }
                     jQuery('[id*=_emlEmailFrom]').val(template.FromAddress);
                     jQuery('[id*=_emlIncludeSub]').prop('checked', template.IncludeSubmission);
                     tinymce.get(jQuery('textarea[id*=_emlMessage]').attr('id')).setContent(template.Message);
                 }
             });
     },
     deleteEmail: function() {
         var portletId = jQuery('[id*=hdnPortletID]').val();
         var templateId = jQuery('[id*=_emlID]').val();
         Jcf.post('DeleteEmail',
             { portlet: portletId, templateId: templateId },
             function(data) {
                 if (data.d.isError)
                     alert(data.d.Message);
                 else {
                     jQuery('#EmailTemplateBuilder').hide();
                     $('option[value="' + templateId + '"]').remove();
                 }
             });
         Jcf.cache.EmailTemplates = null;
     },
     saveEmail: function() {
         var portletId = jQuery('[id*=hdnPortletID]').val();
         var template = {};
         template.EmailID = jQuery('[id*=_emlID]').val() == "" ? null : jQuery('[id*=_emlID]').val();
         template.Subject = jQuery('[id*=_emlSubject]').val();
         template.EmailTo = jQuery('[id*=hdnEmailTo]').val();
         template.FromAddress = jQuery('[id*=_emlEmailFrom]').val();
         template.Message = tinymce.get(jQuery('textarea[id*=_emlMessage]').attr('id')).getContent();
         template.IncludeSubmission = jQuery('[id*=_emlIncludeSub]').is(':checked');
         template.ParentID = jQuery('[id*=itmParent]').val();
         template.SendEvent = jQuery('[id*=_emlSendEvent]').val();
         Jcf.cache.EmailTemplates = null;
         Jcf.post('SaveEmail',
             { portlet: portletId, template: template },
             function(data) {
                 if (data.d.isError)
                     alert(data.d.Message);
                 else {
                     jQuery('#EmailTemplateBuilder').hide();
                     var temp = JSON.parse(data.d.Value);
                     jQuery('[id*=drp_EmailTemplates]').filter(function() {
                         return jQuery('option[value="' + temp.EmailID + '"]').length == 0;
                     }).append('<option value="' + temp.EmailID + '">' + temp.Subject + '</option>');

                     jQuery('[id*=_emlID]').val('');
                     jQuery('[id*=_emlSendEvent]').val('Save');
                     jQuery('[id*=_emlSubject]').val('');
                     jQuery('[id*=hdnEmailTo]').val('');
                     jQuery('[id*=_ulEmails]').html('');
                     jQuery('[id*=_emlEmailFrom]').val('');
                     jQuery('[id*=_emlIncludeSub]').attr('checked', false);
                     tinymce.get(jQuery('textarea[id*=_emlMessage]').attr('id')).setContent('');
                 }
             });
     },
     setItemEditing: function() {
         jQuery('[id*=hdnCurrentQuestion]').val(Jcf.parms.currentElement.attr('itemid'));
     },
     clearFormSettings: function() {
         jQuery('[id*=hdnShowFormSettings]').val('');
     },
     savePosition: function() {
         //'.element',item is the actual FormItem
         var questions = new Array();
         var count = 0;
         var row = 0;

         Jcf.ui.fixColumns();

         jQuery('.jcf-row').each(function() {
             var colCount = 0;
             var col = 0;
             jQuery('.jcf-col', this).each(function() {
                 var con = jQuery(this).attr('itemid');
                 if (con != null && con != '') {
                     col = colCount;
                     var q = {};
                     q.ID = con;
                     q.Row = row;
                     q.Column = col;
                     questions[count] = q;
                     Jcf.func.saveColumnWidths(jQuery(this).find('.colResizeHandle'));
                     count++;
                 }
                 colCount++;
             });

             if (jQuery(this).attr('id') != 'BlankTemplate') {
                 row++;
             }
         });

         Jcf.post('SavePosition',
             { items: questions },
             function(data) {
                 if (data.d.isError) {
                     alert(data.d.Message);
                 }
             });
     },
     saveColumnWidths: function(resizeHandle) {
         var thisCol = jQuery(resizeHandle).closest('.jcf-col');
         var thisLabel = jQuery(thisCol).find('.jcf-label').attr("data-width");
         var rowWidth = jQuery(thisCol).closest('.jcf-row').width();
         var width = (100 * parseFloat($(thisCol).css('width')) / parseFloat($(thisCol).parent().css('width')));
         var colPercent = Math.round(width);

         //if (thisCol.attr('data-width')) {
         //    colPercent = thisCol.attr('data-width');
         //}

         var neighborCol = jQuery(thisCol).next('.jcf-col');
         if (neighborCol.length == 0)
             neighborCol = jQuery(thisCol).prev('.jcf-col');

         var neighborWidth = null;

         if (neighborCol.attr('data-width')) {
             neighborWidth = neighborCol.attr('data-width');
         } else {
             if (neighborCol.length > 0) {
                 neighborWidth = jQuery(neighborCol).width();
                 neighborWidth = Math.round((neighborWidth / rowWidth) * 100);

                 var diff = neighborWidth + colPercent - 100; //~94
                 if (diff > 0) {
                     neighborWidth = neighborWidth - diff;
                 }
             } else {
                 neighborCol = null;
             }
         }
         if (thisLabel == null)
             thisLabel = null;

         Jcf.post('SaveColumnWidths',
             {
                 item: jQuery(thisCol).closest('.element').attr("itemid"),
                 neighborItem: neighborCol != null ? jQuery(neighborCol).attr("itemid") : null,
                 lWidth: thisLabel,
                 colWidth: colPercent,
                 neighborWidth: neighborWidth
             },
             function(data) {
                 if (data.d.isError) {
                     alert(data.d.Message);
                 }
             });
     },
     testLSR: function() {
         var name = jQuery('[id*=ddlLiterals] option:selected').text();
         if (name == null || name == '')
             name = null;
         var opts = {};
         jQuery('[data-lsr]').each(function() {
             opts[jQuery(this).attr('data-lsr')] = jQuery(this).val();
         });
         Jcf.post('TestLSR',
             { portlet: portletId, lsrVal: name, values: opts },
             function(data) {
                 if (data.d.isError)
                     alert(data.d.Message);
                 else {
                     jQuery('.lsrTestOutput').html('<b>Output</b><br/>');
                     jQuery('.lsrTestOutput').append('<span>' + name + '</span><span>' + data.d.Message + '</span>');
                 }
             });
     },
     saveLSR: function() {
         var oldName = jQuery('[id*=ddlLiterals]').val(),
             name = jQuery('[id*=tbxNewName]').val(),
             type = jQuery('[id*=ddlSourceType]').val(),
             conn = jQuery('[id*=drpConnectionString]').val(),
             cache = jQuery('[id*=ddlCacheMode]').val(),
             desc = jQuery('[id*=taDescription]').val(),
             val = jQuery('[id*=taValue]').val();

         if (name == null || name == '')
             name = null;
         Jcf.post('SaveLSR',
             { portlet: portletId, lsrId: oldName, name: name, lsrType: type, conn: conn, cache: cache, desc: desc, val: val },
             function(data) {
                 if (data.d.isError)
                     alert(data.d.Message);
             });
     },
     testDataSource: function() {
         var db = jQuery("[id*=drpUseDatabase]").val();
         var ds = jQuery("[id*=drpDataSources]").val();
         var qr = jQuery("[id*=tbxQuery]").val();
         var opts = {};
         var value = null;
         var dstype = "";
         switch (jQuery("#dsTestType").val()) {
         case "LookUp":
             opts = null;
             dstype = "LookUp";
             value = jQuery("#dsTestSource").val();
             break;
         case "Options":
             dstype = "Options";
             value = jQuery("#dsTestOptLK").val();
             jQuery("[data-param]").each(function() {
                 opts[jQuery(this).attr("data-param")] = jQuery(this).val();
             });
             if (opts.length == 0)
                 opts = null;
             break;
         case "AutoComplete":
             dstype = "AutoComplete";
             opts = null;
             break;
         case "AccessControl":
             dstype = "AccessControl";
             opts = null;
             value = jQuery("#dsTestID").val();
             break;
         }
         Jcf.post("TestDataSource",
             { portlet: portletId, database: db, datasource: ds, query: qr, value: value, values: opts, dstype: dstype },
             function(data) {
                 if (data.d.isError)
                     alert(data.d.Message);
                 else {
                     var whitespaceCount = 0;
                     jQuery("#dsOutput").html();
                     var output = "<td colspan='2'><b>Output</b><br/>";
                     if (data.d.DSList == null || Object.keys(data.d.DSList).length == 0) {
                         output += "<span>" + data.d.Message + "</span>";
                     } else {
                         for (x in data.d.DSList) {
                             output += "<span>" + x + "</span><span>" + data.d.DSList[x] + "</span><br/>";
                             if (data.d.DSList[x].search(/\s{1,}$/) > 0) {
                                 whitespaceCount++;
                             }
                         }
                     }
                     output += "</td>";
                     jQuery("#dsOutput").html(output);
                     if (whitespaceCount > 0) {
                         jQuery("#dsOutput").parents("table").append("<tr><td colspan='2'><em>Note: " + whitespaceCount + " out of " + Object.keys(data.d.DSList).length + " of your elements had trailing whitespace. Make sure to RTRIM() your SQL results if this is not intentional.</em></td></tr>");
                     }
                 }
             },
             function(xhr, error) {
                 jQuery("#dsOutput").html();
                 var output = "<td colspan='2'><b>Output</b><br/>";
                 output += "<span>" + xhr.responseJSON.Message + "</span>";
                 output += "</td>";
                 jQuery("#dsOutput").html(output);
             });
     },
     enablePaymentProfileSave: function (enable) {
         if (enable)
             $("[id*=btnSaveProfile]").removeAttr("disabled");
         else {
             $("[id*=btnSaveProfile]").attr("disabled", "disabled");
         }
     },
     getTabIDFromControlID: function (controlId) {
         if (typeof controlId !== "undefined"
             && controlId !== null) {
             var index = controlId.indexOf("Tab");
             if (index > 0) {
                 return controlId.substring(index + 3);
             }
         } 
        return null;
     }
 };
 Jcf.events = {
     onLoad: function() {
         if ($('.jcf-site-admin-view').length > 0)
             return;

         Jcf.func.getEventActions();
         jQuery('[id*="hdnPageURL"]').val(window.location);
         Jcf.ui.renderTabs();

         var index = jQuery("[id*=formTabs] ul li").index(jQuery('[data-tabid*=' + jQuery('[id*=itmTab]').val() + ']').parent());
         if (jQuery('[id*=itmTab]').val() == '')
             index = 0;

         if (jQuery('[id*=formTabs]').length > 0) {
             jQuery('[id*=formTabs]').tabs({ active: index });
         }
         if (jQuery('.ItemSettings').length > 0) {
             Jcf.common.ui.createModal("Add Item",
                 $('.ItemSettings'),
                 780,
                 null,
                 $('.jcf-item-settings-btn').toArray());
         }

         jQuery('#tabs').tabs({ width: '600px' });
         jQuery('#itemTabs').tabs();

         jQuery('#liMove').mouseover(function() {
             jQuery('#tabsAvailable').closest('div').show();
         }).mouseleave(function() {
             jQuery('#tabsAvailable').closest('div').hide();
         });

         Jcf.ui.makeContainersDroppable();
         Jcf.ui.fixColumns();

         Jcf.ui.makeRowsSortable();

         jQuery(window).mousemove(function(e) {
             window.mouseXPos = e.pageX;
             window.mouseYPos = e.pageY;
         });

         jQuery('.contextMenu').mouseleave(function() {
             jQuery(this).hide();
         });

         if (jQuery('[id*=hdnCurrentQuestion]').length > 0 && jQuery('[id*=hdnCurrentQuestion]').val() != '') {
             Jcf.post('GetExtendedFormItemConfigurationValues', {
                 portletId: jQuery('[id$=hdnPortletID]').val(),
                 formId: jQuery('[id$=itmParent]').val(),
                 itemId: jQuery('[id*=hdnCurrentQuestion]').val()
             }, Jcf.ui.setExtendedProperties);
         }

         if (jQuery('[id*=hdnShowFormSettings]').length > 0 && jQuery('[id*=hdnShowFormSettings]').val() != '') {
             Jcf.post('GetExtendedFormConfigurationValues', {
                 portletId: jQuery('[id$=hdnPortletID]').val(),
                 formId: jQuery('[id$=itmParent]').val()
             }, Jcf.ui.setFormProperties);
         }
         Jcf.ui.makeResizeable();
         Jcf.ui.initTagDropdowns();
         Jcf.ui.loadTabsMenu();
     },
     onColResizing: function(resizeHandle, mousePos) {
         if (Jcf.parms.colResizing) {
             var diff = 0;
             var thisCol = jQuery(resizeHandle).closest('.jcf-col');

             if (Jcf.parms.colResizeStart == null) {
                 Jcf.parms.colResizeStart = mousePos.x;
                 Jcf.parms.colResize = jQuery(thisCol).width(); //starting size
             }
             diff = (mousePos.x - Jcf.parms.colResizeStart);
             var colWidth = Jcf.parms.colResize + diff;

             var rowWidth = jQuery(thisCol).closest('.jcf-row').width();
             rowWidth = parseInt(rowWidth);

             var colPercent = Math.floor(((colWidth + 15) / rowWidth) * 100);

             jQuery(thisCol).css('width', colPercent.toString() + '%');
             jQuery(thisCol).attr("data-width", colPercent.toString());
         }
     },
     onItemResizing: function(resizeHandle, mousePos) {
         if (Jcf.parms.resizing) {
             var diff = 0;
             var label = jQuery(resizeHandle).closest('.jcf-label');
             var element = jQuery(label).next('.jcf-element');

             if (Jcf.parms.resizeStart == null) {
                 Jcf.parms.resizeStart = mousePos.x;
                 Jcf.parms.resizeLabel = jQuery(label).width();
                 Jcf.parms.resizeElem = jQuery(element).width();
             }
             diff = (mousePos.x - Jcf.parms.resizeStart);

             var iWidth = jQuery(label).parent().width();
             var lWidth = Jcf.parms.resizeLabel + diff;
             var eWidth = Jcf.parms.resizeElem - diff;

             lWidth = Math.floor((lWidth / iWidth) * 100);
             label.css("width", lWidth + '%');
             label.attr('data-width', lWidth);
             element.css("width", (100 - lWidth) + '%'); //~94
         }
     },
     onQuestionTypeChanged: function() {
         jQuery('.ItemSettings [href="#tabs-3"]').hide();
         jQuery('.ItemSettings [href="#tabs-5"]').hide();
         jQuery('.jcf-radiobutton-type').hide();
         jQuery('.jcf-checkbox-type').hide();
         jQuery('.jcf-dropdown-type').hide();
         jQuery('.jcf-image-type').hide();
         jQuery('.jcf-textbox-type').hide();
         jQuery('.jcf-essay-type').hide();
         jQuery('.jcf-hidden-type').hide();
         jQuery('.jcf-datepicker-type').hide();
         jQuery('.jcf-filedownload-type').hide();
         jQuery('.jcf-fileupload-type').hide();
         jQuery('.jcf-button-type').hide();
         jQuery('.jcf-placeholder-type').hide();
         jQuery('.jcf-collectiongrid-type').hide();
         jQuery('.jcf-label-type').hide();

         var type = jQuery('[id*="itmType"]').val();

         switch (type) {
         case "RadioButton":
             jQuery('.ItemSettings [href="#tabs-3"]').show();
             jQuery('.jcf-radiobutton-type').show();
             doOptionExtension(type);
             break;
         case "CheckBox":
             jQuery('.ItemSettings [href="#tabs-3"]').show();
             jQuery('.jcf-checkbox-type').show();
             doOptionExtension(type);
             break;
         case "DropDown":
             jQuery('.ItemSettings [href="#tabs-3"]').show();
             jQuery('.ItemSettings [href="#tabs-5"]').show();
             jQuery('.jcf-dropdown-type').show();
             doOptionExtension(type);
             break;
         case "Image":
             jQuery('.jcf-image-type').show();
             doOptionExtension(type);
             break;
         case "Textbox":
             jQuery('.jcf-textbox-type').show();
             jQuery('.ItemSettings [href="#tabs-5"]').show();
             doOptionExtension(type);
             break;
         case "Essay":
             jQuery('.jcf-essay-type').show();
             doOptionExtension(type);
             break;
         case "Hidden":
             jQuery('.jcf-hidden-type').show();
             jQuery('.ItemSettings [href="#tabs-5"]').show();
             doOptionExtension(type);
             break;
         case "DatePicker":
             jQuery('.jcf-datepicker-type').show();
             doOptionExtension(type);
             break;
         case "FileDownload":
             jQuery('.jcf-filedownload-type').show();
             doOptionExtension(type);
             break;
         case "FileUpload":
             jQuery('.jcf-fileupload-type').show();
             doOptionExtension(type);
             break;
         case "Button":
             jQuery('.jcf-button-type').show();
             doOptionExtension(type);
             break;
         case "PlaceHolder":
             jQuery('.jcf-placeholder-type').show();
             doOptionExtension(type);
             break;
         case "CollectionGrid":
             jQuery('.jcf-collectiongrid-type').show();
             doOptionExtension(type);
             break;
         case "Label":
             jQuery('.jcf-label-type').show();
             doOptionExtension(type);
             break;
         }
     },
     onItemContextMenu: function(item) {
         var offset = $("#TheForm").offset();
         $("#SCFDropMenu").show();
         
         var height = $(window).scrollTop() + $(window).height();
         var windowWidth = $(window).width();
         var menuWidth = $("#SCFDropMenu").width();
         var menuHeight = $("#SCFDropMenu").height();
         var ypos = window.mouseYPos + menuHeight;
         var xpos = window.mouseXPos + menuWidth;

         if (ypos < height) {
             $("#SCFDropMenu").css("top", parseInt(window.mouseYPos - offset.top - 5, 10).toString() + "px");
         } else {
             $("#SCFDropMenu").css("top", parseInt(window.mouseYPos - offset.top - menuHeight + 10, 10).toString() + "px");
         }
         if (xpos < windowWidth) {
             $("#SCFDropMenu").css("left", parseInt(window.mouseXPos - offset.left - 5, 10).toString() + "px");
         } else {
             $("#SCFDropMenu").css("left", parseInt(windowWidth - offset.left - menuWidth - 15, 10).toString() + "px");
         }

         var ownerTab = $(item).closest(".jcf-tab");
         var ownerTabId = Jcf.func.getTabIDFromControlID(ownerTab.attr("id"));
         if (ownerTabId !== null) {
             $("#SCFDropMenu #liMove").show();
             $("#SCFDropMenu #tabsAvailable li").show();
             $("#SCFDropMenu #tabsAvailable #" + ownerTabId).hide();
         }

         if ($("#SCFDropMenu #tabsAvailable li:not([style*='display: none;'])").length === 0) { //Had to do it this way because the sub-menu is not
             $("#SCFDropMenu #liMove").hide();                                                  //visible so the :visible selector does not work.
         }

         Jcf.parms.currentElement = $(item);
         return false;
     },
     onRowContextMenu: function(row, rowNum) {
         var offset = jQuery('#TheForm').offset();
         jQuery('#SCFRowDropMenu').show();
         jQuery('#SCFRowDropMenu').css('top', parseInt(window.mouseYPos - offset.top, 10).toString() + 'px');
         jQuery('#SCFRowDropMenu').css('left', parseInt(window.mouseXPos - offset.left, 10).toString() + 'px');
         jQuery('[id*=hdnRowEditing]').val(rowNum);
     },
     onTabContextMenu: function(tabId) {
         var offset = jQuery('#TheForm').offset();
         jQuery('#SCFTabDropMenu').show();
         jQuery('#SCFTabDropMenu').css('top', parseInt(window.mouseYPos - offset.top, 10).toString() + 'px');
         jQuery('#SCFTabDropMenu').css('left', parseInt(window.mouseXPos - offset.left, 10).toString() + 'px');
         jQuery('[id*=hdnTabEditing]').val(tabId);
     },
     onUpdateTestDSType: function() {
         jQuery('#dsOutput').html('');
         jQuery('#dsTestLU').hide();
         jQuery('#dsTestOpt').hide();
         jQuery('#dsTestAuto').hide();
         jQuery('#dsTestAC').hide();
         jQuery('#dsTestOptLK').hide();
         switch (jQuery('#dsTestType').val()) {
         case "LookUp":
             jQuery('#dsTestLU').show();
             break;
         case "Options":
             jQuery('#dsTestOpt').show();
             jQuery('#dsTestOptLK').show();
             jQuery('#dsTestOpt td').remove();
             var pat = /##\w+/g
             var p = jQuery('[id*=_tbxQuery]').html().match(pat);
             var html = '<td colspan="2">';
             for (x in p) {
                 html += '<label>' + p[x] + '</label><span><input type="text" data-param="' + p[x] + '"/></span><br/>';
             }
             html += '</td>';
             jQuery('#dsTestOpt').html(html);
             break;
         case "AutoComplete":
             jQuery('#dsTestAuto').show();
             break;
         case "AccessControl":
             jQuery('#dsTestAC').show();
             break;
         }
     },
     initTestDataSource: function() {
         Jcf.common.ui.showModal("Test Data Source", $(".testDSModal"), 600, null, [$("#JcfTestDataSourceBtn")]);
         Jcf.events.onUpdateTestDSType();
     },
     initTestLSR: function() {
         Jcf.common.ui.showModal('Test LSR', $('.testLSRModal'), 600);
         jQuery('.lsrTestOutput').html('');
         var query = jQuery('[id*=taValue]').val();
         var pat = /@@\w+/g
         var p = query.match(pat);
         jQuery('.lsrTest').html('<tr><td colspan="2"><b>Values Needed</b></td></tr>');
         for (x in p) {
             jQuery('.lsrTest').append('<tr><td>' + p[x] + '</td><td><input type="text" data-lsr="' + p[x] + '"/></td></tr>');
         }
     },
     initFileUpload: function() {
         document.getElementById('file_upload_form').onsubmit = function() {
             document.getElementById('file_upload_form').target = 'upload_target'; //'upload_target' is the name of the iframe
         }
     },
     onPaymentFieldBlur: function() {
         var desc = $("[id*=pnlProfileForm] [id*=tbxFeeDescription]").val() != "";
         var trans = $("[id*=pnlProfileForm] [id*=tbxTransactionCode]").val() != "";
         var fee = $("[id*=pnlProfileForm] [id*=tbxFeeAmount]").val() != "";
         var email = $("[id*=pnlProfileForm] [id*=tbxFailedEmail]").val() != "";

         Jcf.func.enablePaymentProfileSave(desc && trans && fee && email);
     },
     ruleDef: {
         onEmailTemplateChanged: function(select) {
             if ($(select).val() === "") {
                 $(select).parent().find("#img_edit_email").hide();
             } else {
                 $(select).parent().find("#img_edit_email").show();
             }
         }
     }
 };

jQuery(window).ready(function () {
    Jcf.events.onLoad();
});
//Used for TinyMCE
(function (te, $) {
    te.getSettingsDefault = te.getSettings;
    te.getSettings = function (options) {
        var settings = te.getSettingsDefault(options);
        switch (options.layout) {
            case 'jcf-all-tags':
                te.plugins[te.plugins.length] = "mention";
                settings.mentions = {
                    delimiter: ['@', '{'],
                    source: function (query, process, delimiter) {
                        // Do your ajax call
                        // When using multiple delimiters you can alter the query depending on the delimiter used
                        if (delimiter === '@') {
                            process(lsrDictionary);
                        }
                        else if (delimiter === '{') {
                            process(questionDictionary);
                        }
                    }
                };
                return settings;
            case 'jcf-question-tags':
                te.plugins[te.plugins.length] = "mention";
                settings.mentions = {
                    delimiter: ['{'],
                    source: function (query, process, delimiter) {
                        // Do your ajax call
                        // When using multiple delimiters you can alter the query depending on the delimiter used
                        if (delimiter === '{') {
                            process(questionDictionary);
                        }
                    }
                };
                return settings;
            case 'jcf-lsr-tags':
                te.plugins[te.plugins.length] = "mention";
                settings.mentions = {
                    delimiter: ['@'],
                    source: function (query, process, delimiter) {
                        // Do your ajax call
                        // When using multiple delimiters you can alter the query depending on the delimiter used
                        if (delimiter === '@') {
                            process(lsrDictionary);
                        }
                    }
                };
                return settings;
            default:
                return settings;
        }
    };
}(window.textEditor = window.textEditor || {}, jQuery));
$(document).on('focusin', function (e) {
    if ($(e.target).closest(".mce-window, .moxman-window").length) {
        e.stopImmediatePropagation();
    }
});

function Jenzabar$LMS$Portlets$CoursepackPortlet$Views$Admin(element_id_prefix, extend) {

    typeof "Jenzabar.LMS.Portlets.CoursepackPortlet.Views.Admin";

    var Glob = window.Globalizer;

    ////

    var $this = this; //insert extend here
    var $base = JCSL.lang.inherit(this, JCSL.JICS.Portlet, [element_id_prefix]);

    //#region FIELD

    var selected_items; 			//JCSL.Dictionary;
    var editing_title_identifier; //String
    var admin_ws; 				//String

    //#endregion

    //#region METHOD

    this.init = function () {
        selected_items = new JCSL.Dictionary();

        //

        JCSL.element.attach_events
			(
				[this.get_element("BTN_export"), JCSL.dom_event.Type.click, BTN_export__click],
				[this.get_element("IMG_select_refresh"), JCSL.dom_event.Type.click, populate_selects]
			);

        //

        JCSL.lang.for_each(this.coursepack_items, configure_item, this);

        //

        populate_selects();
    }

    this.item_click = function (full_identifier, check) {
        //
        // handle check on/off user action

        var check_box = this.get_element("CHKitem_" + full_identifier);

        if (((check === undefined) ? check_box.checked : check) === true) {
            if (selected_items.has_key(full_identifier) === false) {
                var resource_file = -1;

                if (full_identifier.split("+")[1] !== undefined) {
                    resource_file = parseInt(full_identifier.split("+")[1]);
                }

                selected_items.add(full_identifier, new CheckedItem($this.coursepack_items[full_identifier.split("+")[0]], resource_file, check_box));
            }
        }
        else {
            selected_items.remove(full_identifier);
        }
    }

    this.delete_coursepack = function () {
        var r = confirm(Glob.MSG_CCI_REMOVING_CARTRIDGE_CONTINUE);

        if (r === true) {
            new JCSL.ui.windows.WaitBox(Glob.MSG_CCI_REMOVING_CARTRIDGE, "UI/Common/Images/AJAXImages/L03b_green.gif").open($this.get_element("LNK_delete"));
        }

        return r;
    }

    var retitle_save = function (event) {
        var span = $this.get_element("SPNitem_" + editing_title_identifier);
        var input = document.getElementById("TXTtitle_value");

        if ((span.innerHTML === input.value) || (input.value === "")) {
            new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_ENTER_TITLE).open(JCSL.dom_event.get_source(event));
        }
        else {
            $this.coursepack_items[editing_title_identifier].title = input.value;

            JCSL.element.set_inner_text(span, $this.coursepack_items[editing_title_identifier].title);

            //

            if (input.value === $this.coursepack_items[editing_title_identifier].item_title) {
                input.value = "";

                $this.get_element("SPNitem_renamed_" + editing_title_identifier).style.display = JCSL.element.css.Display.none;
            }
            else {
                $this.get_element("SPNitem_renamed_" + editing_title_identifier).style.display = JCSL.element.css.Display.inline;
            }

            //

            try {
                JCSL.ajax.sync_post_as_text
					(
						(admin_ws + "Admin.asmx/retitle"),
						{
						    cartridge_id: $this.cartridge_id.ToString(),
						    val: (editing_title_identifier + "|" + input.value.replace("|", ""))
						},
						false
					);
            }
            catch (e) {
                new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_NOT_RENAMED).open(null);
            }

            //

            retitle_cancel(window.document.getElementById("SPNtitle"));
        }
    }

    var retitle_cancel = function (SPNtitle) {
        var span = $this.get_element("SPNitem_container_" + editing_title_identifier);

        span.removeChild(SPNtitle);

        $this.get_element("SPNitem_" + editing_title_identifier).style.display = JCSL.element.css.Display.inline;

        //

        editing_title_identifier = "";
    }

    var retitle_reset = function () {
        g$("TXTtitle_value").value = $this.coursepack_items[editing_title_identifier].item_title;
    }

    //#endregion

    //#region ROUTINE

    var populate_selects = function () {
        var ws_callback = function (returned) {
            var select_linker__populating = function (select) {
                switch (select) {
                    case selects[1]:
                        {
                            JCSL.element.create(JCSL.element.Type.option, select, { _text: ("<" + Glob.TXT_SELECT.toLowerCase() + ">"), value: "" });

                            break;
                        }
                    case selects[2]:
                        {
                            JCSL.element.create(JCSL.element.Type.option, select, { _text: ("<" + Glob.TXT_SELECT.toLowerCase() + ">"), value: "" });

                            switch (selects[1].options[selects[1].selectedIndex].value.split(":")[1]) {
                                case $this.TypeMap.FileCabinet:
                                    {
                                        JCSL.element.create(JCSL.element.Type.option, selects[2], { _text: ("[" + Glob.TXT_NEW_FOLDER.toLowerCase() + "]"), value: "new_folder" });
                                        JCSL.element.create(JCSL.element.Type.option, selects[2], { _text: ("{" + Glob.TXT_ROOT.toLowerCase() + "}"), value: "root" });

                                        break;
                                    }
                                case $this.TypeMap.Forum:
                                    {
                                        JCSL.element.create(JCSL.element.Type.option, selects[2], { _text: ("[" + Glob.TXT_NEW_CATEGORY.toLowerCase() + "]"), value: "new_category" });

                                        break;
                                    }
                                case $this.TypeMap.Handout:
                                case $this.TypeMap.Bookmark:
                                    {
                                        JCSL.element.create(JCSL.element.Type.option, selects[2], { _text: ("[" + Glob.TXT_NEW_HEADER + "]"), value: "new_header" });

                                        break;
                                    }
                                case $this.TypeMap.LearningTool:
                                    {
                                        JCSL.element.create(JCSL.element.Type.option, selects[2], { _text: ("[" + "New tool" + "]"), value: "new_tool" });

                                        break;
                                    }
                            }

                            break;
                        }
                }
            }

            var select_linker__selection_change = function (select) {
                switch (select) {
                    case selects[0]:
                        {
                            if (select.selectedIndex === 0) {
                                $this.get_element("ItemAdmin.TTR_subder").style.visibility = JCSL.element.css.Visibility.hidden;
                            }

                            break;
                        }
                    case selects[1]:
                        {
                            if (select.selectedIndex === 0) {
                                $this.get_element("ItemAdmin.TTR_subder").style.visibility = JCSL.element.css.Visibility.hidden;

                                break;
                            }

                            switch (select.options[select.selectedIndex].value.split(":")[1]) {
                                case $this.TypeMap.Coursework:
                                case $this.TypeMap.Announcement:
                                    {
                                        $this.get_element("ItemAdmin.TTR_subder").style.visibility = JCSL.element.css.Visibility.hidden;

                                        break;
                                    }
                                default:
                                    {
                                        $this.get_element("ItemAdmin.TTR_subder").style.visibility = "";
                                    }
                            }

                            switch (select.options[select.selectedIndex].value.split(":")[1]) {
                                case $this.TypeMap.FileCabinet:
                                    {
                                        JCSL.element.set_inner_text($this.get_element("SPN_subder"), Glob.TXT_FOLDER);

                                        selects[2].disabled = false;

                                        break;
                                    }
                                case $this.TypeMap.Forum:
                                    {
                                        JCSL.element.set_inner_text($this.get_element("SPN_subder"), Glob.TXT_CATEGORY);

                                        selects[2].disabled = false;

                                        break;
                                    }
                                case $this.TypeMap.Handout:
                                case $this.TypeMap.Bookmark:
                                    {
                                        JCSL.element.set_inner_text($this.get_element("SPN_subder"), Glob.TXT_HEADER);

                                        selects[2].disabled = false;

                                        break;
                                    }
                            }

                            break;
                        }
                }
            }

            ////			

            if (returned instanceof Error) return;

            //

            var select_linker = new JCSL.ui.element.SelectLinker(returned, selects);

            select_linker.selection_change.attach(select_linker__selection_change);
            select_linker.populating.attach(select_linker__populating);

            select_linker.get_matrix().unshift({ val: "", text: ("<" + Glob.TXT_SELECT + ">"), options: null });

            select_linker.enable();
        }

        ////

        var selects =
			[
				$this.get_element("SEL_page"),
				$this.get_element("SEL_portlet"),
				$this.get_element("SEL_subder")
			];

        JCSL.element.select.show_loading(selects);

        //

        JCSL.JICS.rpc
			(
				{
				    url: (admin_ws + "Admin.asmx/get_export_targets"),
				    parameters: {
				        context_id: $this.ParentPortlet.PortalPage.PageInfo.Context.ID.AsGuid.ToString()
				    },
				    callback: ws_callback,
				    err_message: Glob.ERR_CCI_LOADING_TARGETS
				}
			);
    }

    var configure_item = function (full_identifier) {
        var context_menu__item_click = function (item, element) {
            var retitle = function () {
                if ((editing_title_identifier !== undefined) && (editing_title_identifier !== ""))	  //revise
                {
                    if (full_identifier !== editing_title_identifier) {
                        new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_SAVE_CURRENT_TITLE).open($this.get_element("SPNitem_" + full_identifier));
                    }

                    return;
                }

                //

                var SPNitem = $this.get_element("SPNitem_" + full_identifier);

                //

                var span = JCSL.element.create(JCSL.element.Type.span, null, { id: "SPNtitle" });

                JCSL.element.create(JCSL.element.Type.input, span, { id: "TXTtitle_value", type: "text", value: JCSL.element.get_inner_text(SPNitem) });
                JCSL.element.create(JCSL.element.Type.button, span, { id: "BTNtitle_save", value: Glob.TXT_SAVE }, null, { click: retitle_save });
                JCSL.element.create(JCSL.element.Type.button, span, { id: "BTNtitle_cancel", value: Glob.TXT_CANCEL }, null, { click: function () { retitle_cancel(span) } });
                JCSL.element.create(JCSL.element.Type.button, span, { id: "BTNtitle_reset", value: Glob.TXT_RESET }, null, { click: retitle_reset });

                //

                SPNitem.style.display = JCSL.element.css.Display.none;

                $this.get_element("SPNitem_container_" + full_identifier).insertBefore(span, $this.get_element("SPNitem_hdn_" + full_identifier));

                //

                editing_title_identifier = full_identifier;
            }

            var hide_show = function () {
                var span = $this.get_element("SPNitem_" + full_identifier);
                var span_hdn = $this.get_element("SPNitem_hdn_" + full_identifier);

                if (span_hdn.style.display === JCSL.element.css.Display.none) {
                    //
                    //hide item

                    span.style.fontStyle = JCSL.element.css.FontStyle.italic;
                    span_hdn.style.display = JCSL.element.css.Display.inline;

                    $this.coursepack_items[full_identifier].visible = false;
                }
                else {
                    //
                    //show item

                    span.style.fontStyle = JCSL.element.css.FontStyle.normal;
                    span_hdn.style.display = JCSL.element.css.Display.none;

                    $this.coursepack_items[full_identifier].visible = true;
                }

                //

                try //REFINE //test with null parameter
					{
                    JCSL.ajax.sync_post_as_text
						(
							(admin_ws + "Admin.asmx/display"),
							{
							    cartridge_id: $this.cartridge_id.ToString(),
							    val: (full_identifier + "|" + new Number($this.coursepack_items[full_identifier].visible))
							},
							false
						);
                }
                catch (e) { }
            }

            var un_select_all = function (check) {
                var _do_select = function (type) {
                    var f = function () {
                        element = $this.get_element("CHKitem_" + full_identifier + type + i);

                        return element;
                    }

                    ////

                    var element; //DOMELement:input_checkbox

                    var i = 1;

                    while (f() !== undefined) {
                        if (element.checked !== check) {
                            element.checked = check;

                            $this.item_click((full_identifier + type + i), check);
                        }

                        i++;
                    }
                }

                ////

                _do_select(".");
            }

            ////

            switch (item) {
                case Glob.TXT_RETITLE:
                    {
                        retitle();

                        break;
                    }
                case Glob.COURSEPACK__HIDE_SHOW:
                    {
                        hide_show();

                        break;
                    }
                case Glob.TXT_SELECT_ALL:
                    {
                        un_select_all(true)

                        break;
                    }
                case Glob.TXT_UNSELECT_ALL:
                    {
                        un_select_all(false)

                        break;
                    }
            }
        }

        //

        new JCSL.ui.windows.ContextMenu($this.get_element("SPNitem_" + full_identifier), [Glob.TXT_RETITLE, Glob.COURSEPACK__HIDE_SHOW, Glob.TXT_SELECT_ALL, Glob.TXT_UNSELECT_ALL], context_menu__item_click);
    }

    var display = function () {
        if (selected_items.length === 0) {
            new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_SELECT_ITEMS).open($this.get_element("BTNdisplay"));
        }

        for (var item in selected_items.get_enumerator()) {
            var checked_item = selected_items.get_value(item);

            //

            var span = $this.get_element("SPNitem_" + checked_item.coursepack_item.identifier.full);
            var span_hdn = $this.get_element("SPNitem_hdn_" + checked_item.coursepack_item.identifier.full);

            var visible; //Number

            if (checked_item.coursepack_item.visible === true) {
                //
                //hide item

                span.style.fontStyle = JCSL.element.css.FontStyle.italic;
                span_hdn.style.display = JCSL.element.css.Display.inline;

                visible = 0;
            }
            else {
                //
                //show item

                span.style.fontStyle = JCSL.element.css.FontStyle.normal;
                span_hdn.style.display = JCSL.element.css.Display.none;

                visible = 1;
            }

            checked_item.coursepack_item.visible = (!checked_item.coursepack_item.visible);

            //

            try {
                JCSL.ajax.sync_post_as_text
					(
						(admin_ws + "Admin.asmx/display"),
						{
						    portlet_display_id: $this.ParentPortlet.PortletDisplay.ID.AsGuid.ToString(),
						    val: (checked_item.coursepack_item.identifier.full + "|" + visible)
						},
						false
					); //test with null parameter
            }
            catch (e) { throw e; }

            //

            checked_item.check_box.checked = false;

            $this.item_click(checked_item.coursepack_item.identifier.full, false);
        }
    }

    var BTN_export__click = function () {
        var validate_selections = function () //refactor
        {
            //
            // confim target item and portlet are selected

            if (selected_items.length === 0) {
                new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_SELECT_AN_ITEM).open($this.get_element("BTN_export")); //globalize

                return false;
            }

            //
            // confirm target export poertlet selected

            if ($this.get_element("SEL_portlet").value === "") {
                new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_SELECT_PORTLET).open($this.get_element("BTN_export"));

                return false;
            }

            if ((SEL_subder.value === "") && ($this.get_element("ItemAdmin.TTR_subder").style.visibility === "")) {
                new JCSL.ui.windows.MessageBox("", JCSL.lang.string.format(Glob.MSG_CCI_SELECT_TARGET, [JCSL.element.get_inner_text($this.get_element("SPN_subder")).toLowerCase()])).open($this.get_element("BTN_export"));

                return false;
            }

            return true;
        }

        var check_exportability = function () {
            var check_export_unprotection = function (key) {
                if (selected_items.get_value(key.split("+")[0]).coursepack_item.is_protected !== true) return;

                not_unprotected.push(selected_items.get_value(key.split("+")[0]));
            }

            var check_export_compatibility = function (key) {
                var exportability; //Array

                if (key.indexOf("+") === -1) {
                    exportability = JCSL.lang.array.from_object(selected_items.get_value(key).coursepack_item.exportability, true);
                }
                else {
                    exportability = [$this.TypeMap.Bookmark, $this.TypeMap.Handout];
                }

                var compatible = false;

                JCSL.lang.for_each
					(
						exportability,
						function (e) {
						    var target = $this.get_element("SEL_portlet").value.split(":");

						    //
						    //filecabinet export

						    if (JCSL.element.select.get_selected_text($this.get_element("SEL_portlet")).indexOf("File Cabinet") > -1) {
						        if (exportability[e] !== target[3]) return;

						        arguments.callee.break_out = true;

						        compatible = true;
						    }

						    //
						    //direct portlet export

						    if (exportability[e] !== target[1]) return;

						    arguments.callee.break_out = true;

						    compatible = true;
						}
					);

                if (compatible === false) {
                    not_compatible.push([key, selected_items.get_value(key).coursepack_item.title]);
                }
            }

            var display_exportability_failed = function () {
                var generate_mb_message = function (items) //refine
                {
                    var html = "";
                    var table; //DOMElement:table

                    if (not_content.length > 0) {
                        html += Glob.MSG_CCI_NO_EXPORTABLE_CONTENT;

                        table = JCSL.element.table.create(not_content);

                        table.cellSpacing = "5px";

                        table.style.fontSize = "10px";

                        html += JCSL.element.get_html(table);
                        html += "<br />";
                    }

                    if (not_compatible.length > 0) {
                        html += Glob.MSG_CCI_NOT_COMPATIBLE;

                        table = JCSL.element.table.create(not_compatible);

                        table.cellSpacing = "5px";

                        table.style.fontSize = "10px";

                        html += JCSL.element.get_html(table);
                        html += "<br />";
                    }

                    /*						
                    return
                    JCSL.element.get_html
                    (
                    JCSL.element.create
                    (
                    JCSL.element.Type.div,
                    null,
                    {
                    innerHTML: ("<span style=\"font-weight:bold;\">The following items cannot be exported. Press 'OK' to deselect these items.</span><br /><br />" + html)
                    }
                    )
                    );
                    */

                    return ("<div><span style=\"font-weight:bold;\">" + Glob.MSG_CCI_ITEMS_FAILED_EXPORT + "</span><br /><br />" + html);
                }

                var mb_callback = function (caption) {
                    var deselect_items = function (index, array) {
                        selected_items.get_value(array[index][0]).check_box.checked = false;

                        $this.item_click(array[index][0], false);

                        not_content = [];
                        not_compatible = [];
                    }

                    ////

                    switch (caption) {
                        case Glob.TXT_OK: JCSL.lang.for_each(new Array().concat(not_content, not_compatible), deselect_items);
                    }
                }

                ////

                mb = new JCSL.ui.windows.MessageBox("", generate_mb_message(), mb_callback, [{ caption: Glob.TXT_OK }, { caption: Glob.TXT_CANCEL}], { color: "White", opacity: 40, as_html: true }).open($this.get_element("BTN_export"));
            }

            ////

            var not_content = []; //re-implement
            var not_compatible = [];

            //

            if ($this.get_element("SEL_portlet").value.split(":")[1] == $this.TypeMap.FileCabinet) {
                var not_unprotected = [];

                JCSL.lang.for_each(selected_items.get_enumerator(), check_export_unprotection);

                if (not_unprotected.length > 0) {
                    mb = new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_PROTECTED_ITEMS_EXPORT).open($this.get_element("BTN_export"));

                    return false;
                }
            }

            JCSL.lang.for_each(selected_items.get_enumerator(), check_export_compatibility);

            //

            if ((not_content.length > 0) || (not_compatible.length > 0)) {
                display_exportability_failed();

                return false;
            }

            return true;
        }

        var new_subder = function (subder_type) {
            var mb_callback = function (result) {
                var create_header = function () {
                    try {
                        var header_id =
							JCSL.ajax.sync_post_as_value
							(
								(admin_ws + "../common/Header.asmx/create_header"),
								{
								    owner_id: $this.get_element("SEL_portlet").value.split(":")[0],
								    owner_type: "Personal",
								    portlet_template_id: $this.get_element("SEL_portlet").value.split(":")[2],
								    name: subder_name
								}
							);
                    }
                    catch (e) { return null; }

                    //
                    //add newly created header to select box

                    JCSL.element.create(JCSL.element.Type.option, SEL_subder, { _text: subder_name, value: header_id });

                    //

                    return header_id;
                }

                var create_folder = function () {
                    try {
                        var folder_id =
							JCSL.ajax.sync_post_as_value
							(
								(admin_ws + "../common/FileCabinet.asmx/create_folder"),
								{
								    name: subder_name,
								    type: $this.get_element("SEL_portlet").value.split(":")[4],
								    description: ""
								}
							);
                    }
                    catch (e) { return null; }

                    //
                    //add newly created folder to select box

                    JCSL.element.create(JCSL.element.Type.option, SEL_subder, { _text: subder_name, value: folder_id });

                    //

                    return folder_id;
                }

                var create_category = function () {
                    try {
                        var category_id =
							JCSL.ajax.sync_post_as_value
							(
								(admin_ws + "../common/Category.asmx/create_category"),
								{
								    owner_id: $this.get_element("SEL_portlet").value.split(":")[0],
								    label: subder_name
								}
							);
                    }
                    catch (e) { return null; }

                    //
                    //add newly created folder to select box

                    JCSL.element.create(JCSL.element.Type.option, SEL_subder, { _text: subder_name, value: category_id });

                    return category_id;
                }

                ////

                var subder_name; //String
                var subder_id; 	//String

                //

                switch (result) {
                    case Glob.TXT_CREATE:
                        {
                            subder_name = ib.get_value();

                            if (subder_name === "") //properly validate header name here!
                            {
                                new JCSL.ui.windows.MessageBox("", JCSL.lang.string.format(Glob.MSG_CCI_ENTER_OBJECT_NAME, [subder_type])).open($this.get_element("BTN_export"));
                            }
                            else {
                                switch (subder_type) {
                                    case Glob.TXT_HEADER.toLowerCase():
                                        {
                                            subder_id = create_header();

                                            if (subder_id !== null) {
                                                process(subder_id);
                                            }

                                            break;
                                        }
                                    case Glob.TXT_FOLDER.toLowerCase():
                                        {
                                            subder_id = create_folder();

                                            if (subder_id !== null) {
                                                process(subder_id);
                                            }

                                            break;
                                        }
                                    case Glob.TXT_CATEGORY.toLowerCase():
                                        {
                                            subder_id = create_category();

                                            if (subder_id !== null) {
                                                process(subder_id);
                                            }

                                            break;
                                        }
                                }

                                if (subder_id === null) {
                                    new JCSL.ui.windows.MessageBox("", JCSL.lang.string.format(Glob.MSG_CCI_OBJECT_NOT_CREATED, [subder_type])).open($this.get_element("BTN_export"));
                                }
                            }

                            break;
                        }
                }
            }

            ////

            var ib = new JCSL.ui.windows.InputBox("", JCSL.lang.string.format(Glob.MSG_CCI_CREATE_MEW_OBJECT, [subder_type]), mb_callback, [{ caption: Glob.TXT_CREATE }, { caption: Glob.TXT_CANCEL}]);

            ib.open($this.get_element("BTN_export"));
        }

        var coursework_export = function () {
            var dw__opened = function () {
                var get_headers = function (class_key) {
                    var h =
						JCSL.lang.parse_json
						(
							JCSL.ajax.sync_post_as_value
							(
								(admin_ws + "../common/Header.asmx/find_by_owner"),
								{
								    owner_id: section_id,
								    portlet_template_id: $this.get_element("SEL_portlet").value.split(":")[2],
								    class_key: class_key
								}
							)
						);

                    return h;
                }

                ////

                JCSL.element.attach_event($this.get_element("DIV_cw_export_prefs.BTN_cancel"), JCSL.dom_event.Type.click, button__click);

                //

                var section_id =
					JCSL.ajax.sync_post_as_value
					(
						(admin_ws + "../common/Section.asmx/find_by_context"),
						{
						    contextID: $this.ParentPortlet.ParentPortalContext.ID.AsGuid.ToString()
						}
					); //TODO: remove this ws call

                //

                JCSL.element.select.populate(SEL_type, get_headers(0), "ID.AsGuid.ToString", "Name");
                JCSL.element.select.populate(SEL_unit, get_headers(1), "ID.AsGuid.ToString", "Name");

                JCSL.element.attach_event($this.get_element("DIV_cw_export_prefs.BTN_ok"), JCSL.dom_event.Type.click, button__click);
            }

            var dw__closed = function () {
                JCSL.element.detach_event($this.get_element("DIV_cw_export_prefs.BTN_ok"), JCSL.dom_event.Type.click, button__click);
                JCSL.element.detach_event($this.get_element("DIV_cw_export_prefs.BTN_cancel"), JCSL.dom_event.Type.click, button__click);
            }

            var button__click = function () {
                switch (this.value) {
                    case Glob.TXT_OK:
                        {
                            dw.close();

                            new ItemsExporter($this.get_element("SEL_portlet").value.split(":")[1], $this.get_element("SEL_portlet").value.split(":")[0], [SEL_type.value, SEL_unit.value]).run();

                            break;
                        }
                    case Glob.TXT_CANCEL:
                        {
                            dw.close();

                            break;
                        }
                }
            }

            ////

            var SEL_type = $this.get_element("DIV_cw_export_prefs.SEL_type");
            var SEL_unit = $this.get_element("DIV_cw_export_prefs.SEL_unit");

            JCSL.element.select.show_loading([SEL_type, SEL_unit]);

            //

            var dw = new JCSL.ui.windows.DialogWindow($this.get_element("DIV_cw_export_prefs"));

            dw.show_close = false;
            dw.modal = true;
            dw.fixed = true;

            dw.opened.attach(dw__opened);
            dw.closed.attach(dw__closed);

            dw.open($this.get_element("BTN_export"));
        }

        var process = function (subder_id) {
            var fc_type; //String

            if (JCSL.element.select.get_selected_text($this.get_element("SEL_portlet")).indexOf("File Cabinet") > -1) {
                fc_type = $this.get_element("SEL_portlet").value.split(":")[3];
            }

            new ItemsExporter($this.get_element("SEL_portlet").value.split(":")[1], $this.get_element("SEL_portlet").value.split(":")[0], subder_id, fc_type).run();
        }

        ////

        var SEL_subder = $this.get_element("SEL_subder");

        //

        if (validate_selections() === false) return;
        if (check_exportability() === false) return;

        //

        if ($this.get_element("ItemAdmin.TTR_subder").style.visibility === "") {
            switch (SEL_subder.value) {
                case "new_header":
                    {
                        new_subder("header");

                        break;
                    }
                case "new_folder":
                    {
                        new_subder("folder");

                        break;
                    }
                case "new_category":
                    {
                        new_subder("category");

                        break;
                    }
                default: //to root
                    {
                        process(SEL_subder.value);

                        break;
                    }
            }
        }
        else {
            if ($this.get_element("SEL_portlet").value.split(":")[1] === $this.TypeMap.Announcement) {
                process("");
            }
            else {
                coursework_export();
            }
        }
    }

    //#endregion

    //#region OBJECT

    function CheckedItem(coursepack_item, resource, check_box) {
        //#region PROPERTY

        this.coursepack_item; //CoursepackPortlet.CoursepackItem
        this.resource; 		//Number
        this.check_box; 		//DOMElement:checkbox

        //#endregion

        //#region CONSTRUCTOR

        this.coursepack_item = coursepack_item;
        this.resource = resource;
        this.check_box = check_box;

        //#endregion
    }

    function ItemsExporter(portlet_type, portlet_id, subder, fc_type) {
        typeof ItemsExporter;

        //#region FIELD

        var esw; 					//ExportStatusWindow

        var export_threads; 			//Array
        var current_export_canceller; //Function

        //#endregion

        //#region PROPERTY

        this.run = function () {
            var do_export = function (index, coursepack_item, resource, export_process) {
                var ws_callback = function (returned) {
                    var close = function () {
                        if (esw !== undefined) {
                            esw.close();
                        }
                    }

                    ////

                    if (esw === undefined) return; //revise... avoids incrementing the progress bar when the window is closed since calls don't get cancelled if one fails

                    //

                    if (returned instanceof Error) return;

                    //

                    esw.progress_bar.set_percent(((index + 1) / items_count) * 100);

                    if (items_count === (index + 1)) {
                        JCSL.lang.delay_execute(close, 500, esw);
                    }
                }

                ////

                var node_index; //Number
                var node; 	//DOMNode

                //

                if (resource > 0) {
                    resource = (resource - 1);
                }

                //
                //set params and make out of band call
                //TODO: replace below calls with shared RPC object

                switch (portlet_type) {
                    case $this.TypeMap.FileCabinet:
                        {
                            current_export_canceller =
								JCSL.JICS.rpc
								(
									{
									    url: (admin_ws + "Admin.asmx/export_to_file_cabinet"),
									    parameters: {
									        cartridge_id: $this.cartridge_id.ToString(),
									        identifier: JSON.stringify(coursepack_item.identifier),
									        portlet_id: portlet_id,
									        fc_type: fc_type,
									        folder_id: subder,
									        resource: resource
									    },
									    callback: ws_callback,
									    err_message: Glob.ERR_CCI_DURING_EXPORT
									}
								);

                            break;
                        }
                    case $this.TypeMap.Coursework:
                        {
                            current_export_canceller =
    				                    JCSL.JICS.rpc
								(
    				                        {
    				                            url: (admin_ws + "Admin.asmx/export_to_coursework"),
    				                            parameters: {
    				                                cartridge_id: $this.cartridge_id.ToString(),
    				                                identifier: JSON.stringify(coursepack_item.identifier),
    				                                portlet_id: portlet_id,
    				                                context_id: $this.ParentPortlet.ParentPortalContext.ID.AsGuid.ToString(),
    				                                class_type_id: subder[0],
    				                                class_unit_id: subder[1]
    				                            },
    				                            callback: ws_callback,
    				                            err_message: Glob.ERR_CCI_DURING_EXPORT
    				                        }
								);

                            break;
                        }
                    case $this.TypeMap.LearningTool:
                        {
                            current_export_canceller = JCSL.JICS.rpc(
				                        {
				                            url: (admin_ws + "Admin.asmx/export_to_learningtool"),
				                            parameters: {
				                                cartridge_id: $this.cartridge_id.ToString(),
				                                identifier: JSON.stringify(coursepack_item.identifier),
				                                portlet_id: portlet_id,
				                                resource: resource
				                            },
				                            callback: ws_callback,
				                            err_message: Globalizer.GetString("ERR_CCI_DURING_EXPORT")
				                        }
								);
                            break;
                        }
                    default:
                        {
                            current_export_canceller =
								JCSL.JICS.rpc
								(
									{
									    url: (admin_ws + "Admin.asmx/export_to_portlet"),
									    parameters: {
									        cartridge_id: $this.cartridge_id.ToString(),
									        identifier: JSON.stringify(coursepack_item.identifier),
									        portlet_id: portlet_id,
									        header_id: subder,
									        resource: resource
									    },
									    callback: ws_callback,
									    err_message: Glob.ERR_CCI_DURING_EXPORT
									}
								);
                            break;
                        }
                }
            }

            ////

            esw = new ExportStatusWindow(this);

            esw.closed.attach(finished);

            esw.open($this.get_element("BTN_export"));

            //

            export_threads = new Array();

            var items_count = selected_items.length;

            for (var i = 0; i < items_count; i++) {
                esw.progress_bar.set_percent(i + 1);

                export_threads.push
						(
							JCSL.lang.delay_execute(do_export, ((i + 1) * 1000), this, [i, selected_items.values[i].coursepack_item, selected_items.values[i].resource, selected_items.values[i].export_process])
						);
            }
        }

        this.cancel = function () {
            //
            //the current_export_canceller may be undefined if obc have not started

            if ((current_export_canceller !== undefined) && (!current_export_canceller.expired)) {
                current_export_canceller();
            }

            //

            for (var i = 0; i < export_threads.length; i++) {
                if (!export_threads[i].expired) export_threads[i]();
            }

            export_threads = undefined;

            //

            try {
                esw.closed.detach(finished);

                esw.close();
            }
            catch (e)
					{ }
            finally {
                esw = undefined;
            }
        }

        //#endregion

        //#region ROUTINE

        var finished = function () {
            var mb_callback = function (caption) {
                var deselect_items = function (full_identifier) {
                    selected_items.get_value(full_identifier).check_box.checked = false;

                    $this.item_click(full_identifier, false);
                }

                ////

                switch (caption) {
                    case Glob.TXT_YES:
                        {
                            JCSL.lang.for_each(selected_items.get_enumerator(), deselect_items);

                            break;
                        }
                }
            }

            JCSL.window.document.enable();

            new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_DESELECT_ITEMS, mb_callback, [{ caption: Glob.TXT_YES }, { caption: Glob.TXT_NO}]).open($this.get_element("BTN_export"));
        }

        //#endregion
    }

    function ExportStatusWindow(item_exporter) {
        var $base = JCSL.lang.inherit(this, JCSL.ui.windows.DialogWindow, [$this.get_element("DIV_export_dialog"), ""]);

        //#region VARIABLE

        var BTN_cancel; //DOMElement:input_button

        //#endregion

        //#region FIELD

        this.progress_bar; //JCSL.ui.controls.ProgressBar

        //#endregion

        //#region ROUTINE

        var BTN_cancel__click = function () {
            item_exporter.cancel();

            new JCSL.ui.windows.MessageBox("", Glob.MSG_CCI_EXPORT_CANCELLED).open($this.get_element("BTN_export"));
        }

        //#endregion

        //#region METHOD

        this.open = function (compliant_element) {
            JCSL.element.attach_event(BTN_cancel, JCSL.dom_event.Type.click, BTN_cancel__click);

            //

            this.open = $base.open;

            $base.open_and_render_controls.apply(this, [compliant_element, true]);

            $base.open = this.open;

            //

            this.progress_bar = window.controls[element_id_prefix + "." + "DIV_export_dialog.ExportProgressBar"];
            //this.progress_bar = $this.get_element("DIV_export_dialog.ExportProgressBar");
        }

        this.open_and_render_controls = function () {
            this.open.apply(this, arguments);
        }

        this.close = function () {
            $base.close.apply(this, arguments);

            JCSL.element.detach_event(BTN_cancel, JCSL.dom_event.Type.click, BTN_cancel__click);
        }

        //#region private

        this._activate = function () {
            JCSL.window.document.disable({ opacity: JCSL.JICS.DocumentProcessing.opacity });
        }

        //#endregion

        //#endregion

        //#region constructor

        this.modal = true;
        this.fixed = true;

        this.show_close = false;

        BTN_cancel = $this.get_element("DIV_export_dialog.BTN_cancel");

        //#endregion
    }

    //#endregion

    //#region CONSTRUCTOR

    JCSL.lang.extend(this, extend, false); //move up top

    //

    admin_ws = (Portal.url + $this.url + "Views/");

    //#endregion			
}

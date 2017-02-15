
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$PerformanceGroupControl()
{
    var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    var CSS = JCSL.element.css;

    //#region VARIABLE

        var analysis;
        var grade_group;

        var table;

        var groups;

		var group_names;
		var group_border_colors;
		var group_bg_colors;

    //#endregion

	//#region FIELD
	
		this.rendered		= new JCSL.Event(this);
		this.group_changed	= new JCSL.Event(this);
			
	//#endregion

    //#region METHOD

        this.reset = function()
        {
            var callback = function(data)
            {
                analysis.TestData = data.TestData;
                
                JCSL.ui.CachedControl.load($this.constructor, $this.parent).render($this.container);
            }

            ////

            JCSL.JICS.rpc
			(
				{
					url:			($this.constructor._meta.base + "AnalyticsPerformance.asmx/fetch"),
					parameters:		{
										assignment_id:	analysis.Coursework.ID.ToString()
									},
					callback:		JCSL.ui.patterns.ApplyClass($this.container, callback, {name:"CWK_Analytics_Loading", text: (window.Globalizer.TXT_LOADING + "...")}),
					err_message:	Globalizer.ERR_COURSEWORK_SAVING_GROUP_SIZE
				}
			);
        }

        this.init = function()
        {
            analysis = this.parent.parent.get_analysis();

            $base.init.call(this);
        }

        this.load_images = function()
        {
            $base.load_images.call(this, this.data.paths.image);
        }

        this.render = function (container) {
            table = $this.g$("TBL_students");

            JCSL.element.attach_event($this.g$("LNK_reset", $this._element), JCSL.dom_event.Type.click, LNK_reset__Click);
            JCSL.element.attach_event($this.g$("LNK_bkmk_discrimination_indices"), JCSL.dom_event.Type.click, LNK_bkmk_Click);

            groups = analysis.TestData.GradeGroups.length;

            switch (groups) {
                case 2:
                    {
                        group_names = [Globalizer.TXT_LOW, Globalizer.TXT_HIGH];
                        group_border_colors = ["#9C4542", "#5AAA5A"];
                        group_bg_colors = ["#FFE6E6", "#E0FFD1"];

                        create_group(1);
                        create_group(0);

                        create_group_summary(1);
                        create_group_summary(0);

                        break;
                    }
                case 3:
                    {
                        group_names = [Globalizer.TXT_LOW, Globalizer.TXT_MIDDLE, Globalizer.TXT_HIGH];
                        group_border_colors = ["#9C4542", "#CDCDCD", "#5AAA5A"];
                        group_bg_colors = ["#FFE6E6", "#FEF4E2", "#E0FFD1"];

                        create_group(2);

                        create_middle_group();

                        create_group(0);

                        create_group_summary(2);
                        create_group_summary(1);
                        create_group_summary(0);

                        break;
                    }
            }

            //

            $base.render.call(this, container);

            $this.rendered.fire();
        }

    //#endregion

    //#region ROUTINE

		function LNK_reset__Click()
		{
			function callback(returned)
			{
				if (returned instanceof Error) return;
					
				$this.reset();
			}
				
			////

			JCSL.JICS.rpc
			(
				{
					url:			($this.constructor._meta.base + "AnalyticsPerformance.asmx/reset"),
					parameters:		{
										assignment_id:	analysis.Coursework.ID.ToString()
									},
					callback:		JCSL.ui.patterns.Disable(table, callback),
					err_message:	Globalizer.ERR_COURSEWORK_RESETTING_GROUP
				}
			);
        }

        var LNK_bkmk_Click = function () {
            var lnk = this;

            $this.parent.tabs.select(0);

            setTimeout
		            (
			            function () {
			                document.location.href = (document.location.href.split("#")[0] + "#LNK_bkmk_" + lnk.getAttribute("data-bkmk"));
			            },
			            1000
		            );
        }

		function create_group(group)
		{
			function create_student(index)
			{
                function find_student()
                {
                    for (var i=0; i<analysis.Grades.length; i++)
                    {
                        if (analysis.Grades[i].UserID.ToString() != users[index].ToString()) continue;

                        return analysis.Grades[i];
                    }
                }
					
				////

                var student = find_student(index);
					
				var cell_data = [];
					
				cell_data[0] = c$(JCSL.element.Type.image, null, {src:($this.data.paths.image + "PortletImages/Coursework/" + "perf_group_" + group_names[group] + ".gif")})
				cell_data[1] = (Math.round(student.CalculateScore()) + "%");
				cell_data[2] = $this.parent.parent.create_student_link(student.UserName, student.UserID.ToString());
					
				return cell_data;
			}
				
			////
				
			var border = (JCSL.element.css.BorderStyle.solid + " 2px " + group_border_colors[group]);
				
			var users = analysis.TestData.GradeGroups[group].Users.reverse();
				
			if (users.length == 0)
			{
				JCSL.element.table.create_row(table, [null], null, {borderLeft:border});
					
				JCSL.element.modify(table.rows[table.rows.length-1].cells[0], {colSpan:"4", innerHTML:Globalizer.MSG_COURSEWORK_NO_STUDENTS_IN_GROUP}, {border:border});
					
				return;
			}
			else
			{				
				for (var i=0; i<users.length; i++)
				{
					var tr = JCSL.element.table.create_row(table, create_student(i), null, {borderLeft:border});
						
					tr.cells[0].style.borderLeft = border;

					JCSL.element.table.borderize(table, (CSS.BorderStyle.solid + " 1px #cdcdcd"), ["right", "bottom"], (table.rows.length-1));
						
					if (group_names[group] == Globalizer.TXT_MIDDLE)
                    {
                        tr.style.display = "none";
                    }
                    else
					{
						if (i == 0)
						{
							JCSL.element.table.borderize(table, border, "top", (table.rows.length-1));
						}
							
						if (i == (users.length-1))
						{
							JCSL.element.table.borderize(table, border, "bottom", (table.rows.length-1));
						}
					}
				}
			}
		}

		function create_middle_group()
		{
			function LNK_show_middle_group__Click()
			{			
				var offset = 1;
				
				for (var i=2; i>1; i--)
				{					
					offset += (analysis.TestData.GradeGroups[i].Users.length);
				}
					
				for (var i=1; i<=analysis.TestData.GradeGroups[1].Users.length; i++)
				{
					table.rows[offset+i].style.display = "";
				}
					
				table.rows[offset+i].style.display = CSS.Display.none;
			}
				
			////
				
			create_group(1);
				
			if (analysis.TestData.GradeGroups[1].Users.length == 0) return;
				
			//
				
			var td =
            JCSL.element.table.create_cell
            (
                JCSL.element.table.create_row
                (
                    table,
                    null,
                    null,
                    {backgroundColor:group_bg_colors[1]}
                ),
                null,
                {colSpan:"4"},
                {borderLeft:(CSS.BorderStyle.solid + " 1px #cdcdcd"), borderRight:(CSS.BorderStyle.solid + " 1px #cdcdcd")}
            );
				
			td.appendChild($this.g$("DIV_middle_group"));
				
			JCSL.element.attach_event(JCSL.element.find_by_data("id", "LNK_show_middle_group", td, JCSL.element.Type.anchor)[0], JCSL.dom_event.Type.click, LNK_show_middle_group__Click);
		}

		function create_group_summary(group)
		{
			function edit_group_size__Click()
			{
				DIV_performance_summary.style.display = CSS.Display.none;
					
				JCSL.element.find_by_data("id", "DIV_performance_edit", div_summary)[0].style.display = "";					
			}
				
			function BTN_save__Click()
			{
				var callback = function(returned)
				{
					if (returned instanceof Error) return;
						
					//

					//$this.group_changed.fire();

                    $this.reset();
				}
					
				////
					
				var cutoff_value = JCSL.element.find_by_data("id", "TXT_cutoff", div_summary, JCSL.element.Type.input, false)[0].value;
					
				if ((isNaN(cutoff_value)) || (cutoff_value.indexOf(".") > -1) || (cutoff_value > 99) || (cutoff_value < 1))
				{
					new JCSL.ui.windows.MessageBox("", Globalizer.MSG_COURSEWORK_ENTER_BETWEEN_1_AND_99).open(null);
						
					return;
				}
					
				//
					
				cutoff_value = parseInt(cutoff_value);
					
				var other_group = ((group === 0) ? (groups-1) : 0);
					
				var other_cutoff = (analysis.TestData.GradeGroups[other_group].GroupRange.Max - analysis.TestData.GradeGroups[other_group].GroupRange.Min);
					
				var bound1;
				var bound2;
					
				if (JCSL.element.find_by_data("id", "CHK_cutoff", div_summary, JCSL.element.Type.input, false)[0].checked)
				{
					if (cutoff_value > 50)
					{
						switch (group)
						{
							case (groups-1):
							{
								bound2 = (100 - cutoff_value);
									
								break;
							}
							case 0:
							{
								bound2 = cutoff_value;
									
								break;
							}
						}
					}
					else
					{
						bound2 = cutoff_value;
					}
				}
				else
				{
					if ((100-cutoff_value) < other_cutoff)
					{
						bound2 = (100 - cutoff_value);
					}
					else
					{
						bound2 = other_cutoff;
					}
				}
					
				//
					
				switch (group)
				{
					case 0:
					{
						bound1 = (100 - bound2);
						bound2 = cutoff_value;
							
						break;
					}
					case (groups-1):
					{
						bound1 = (100-cutoff_value);
							
						break;
					}
				}
					
				//

				JCSL.JICS.rpc
				(
					{
						url:			($this.constructor._meta.base + "AnalyticsPerformance.asmx/save"),
						parameters:		{
											assignment_id:	analysis.Coursework.ID.ToString(),
											min:			bound2,
											max:			bound1
										},
                        callback:		JCSL.ui.patterns.ApplyClass($this.container, callback, {name:"CWK_Analytics_Loading", text:window.Globalizer.TXT_SAVING + "..."}),
						err_message:	Globalizer.ERR_COURSEWORK_SAVING_GROUP_SIZE
					}
				);
					
				//
					
				//BTN_cancel__Click();
			}

			function BTN_cancel__Click()
			{
				JCSL.element.find_by_data("id", "DIV_performance_edit", div_summary)[0].style.display = CSS.Display.none;
					
				DIV_performance_summary.style.display = "";
					
				JCSL.element.find_by_data("id", "TXT_cutoff", div_summary)[0].value = group_range;
			}
				
			function hide_middle_group__Click(event_args, offset)
			{				
				for(i=0; i<analysis.TestData.GradeGroups[group].Users.length; i++)
				{
					table.rows[offset+i].style.display = CSS.Display.none;
				}
					
				table.rows[offset+i].style.display = "";
			}					
				
			////
								
			var offset = 0;				
				
			for (var i=(groups-1); i>group; i--)
			{					
				offset += (analysis.TestData.GradeGroups[i].Users.length);
			}
				
			//
			//required for middle group summary row
				
			if (groups == 3 && group == 0)
			{
				offset++;
			}
				
			//
				
			if (analysis.TestData.GradeGroups[group].Users.length === 0) return;
				
			//

			var div_summary = JCSL.element.copy($this.g$("DIV_group_summary_template"));
				
			var DIV_performance_summary = JCSL.element.find_by_data("id", "DIV_performance_summary", div_summary, JCSL.element.Type.div)[0];
				
			JCSL.element.append
			(
				[
					c$(JCSL.element.Type.image, null, {src:($this.data.paths.image + "PortletImages/Coursework/" + "perf_group_" + group_names[group] + ".gif")}),
					c$(JCSL.element.Type.span, null, {innerHTML:(group_names[group] + " " + Globalizer.TXT_PERFORMERS)}, {marginLeft:"10px"})
				],
				JCSL.element.find_by_data("id", "DIV_performance_title", div_summary, JCSL.element.Type.div)[0]
			);
				
			var td_summary = JCSL.element.table.create_cell(table.rows[offset + 2], div_summary, {rowSpan:(analysis.TestData.GradeGroups[group].Users.length).toString()}, {verticalAlign:CSS.VerticalAlign.top});
				
			//
				
			var border = (CSS.BorderStyle.solid + " 2px " + group_border_colors[group]);

            var group_range = (analysis.TestData.GradeGroups[group].GroupRange.Max - analysis.TestData.GradeGroups[group].GroupRange.Min);
				
			switch (group_names[group]) //may be possible to refactor out this switch
			{
				case Globalizer.TXT_HIGH:
				{
					JCSL.element.modify(td_summary, null, {backgroundColor:group_bg_colors[group], borderRight:border, borderTop:border, borderBottom:border});
						
					c$
					(
						JCSL.element.Type.span,
						DIV_performance_summary,
						{
							_text:
							JCSL.lang.string.format
							(
								Globalizer.MSG_COURSEWORK_TOP_X_STUDENTS,
								[
									group_range,
									analysis.TestData.GradeGroups[groups-1].Users.length,
									((analysis.TestData.GradeGroups[groups-1].Users.length === 1) ? "" : "s")
								]
							)
						}
					);
						
					c$(JCSL.element.Type.anchor, DIV_performance_summary, {href:"javascript:", _text:Globalizer.TXT_EDIT_GROUP_SIZE}, {marginLeft:"10px"}, {click:edit_group_size__Click});
						
					break;
				}
				case Globalizer.TXT_MIDDLE:
				{
					$this.g$("SPN_middle_group_info").innerHTML =
					JCSL.lang.string.format
					(
						Globalizer.MSG_COURSEWORK_PERCENT_X_STUDENTS,
						[
							group_range,
							analysis.TestData.GradeGroups[1].Users.length,
							((analysis.TestData.GradeGroups[1].Users.length === 1) ? "" : "s")
						]
					);
						
					//
						
					JCSL.element.modify(td_summary, null, {backgroundColor:"#FEF4E2", borderRight:(CSS.BorderStyle.solid + " 2px #cdcdcd")});
						
					//
						
					c$
					(
						JCSL.element.Type.span,
						DIV_performance_summary,
						{
							_text:
							JCSL.lang.string.format
							(
								Globalizer.MSG_COURSEWORK_TOP_X_STUDENTS,
								[
									group_range,
									analysis.TestData.GradeGroups[1].Users.length,
									((analysis.TestData.GradeGroups[1].Users.length === 1) ? "" : "s")
								]
							)
						}
					);
						
					JCSL.element.attach_event
					(
						c$(JCSL.element.Type.anchor, DIV_performance_summary, {href:"javascript:", _text:Globalizer.MSG_COURSEWORK_HIDE_MIDDLE_GROUP}, {marginLeft:"10px"}),
						JCSL.dom_event.Type.click,
						hide_middle_group__Click,
						[(offset + 2)]
					);
						
					//
						
					hide_middle_group__Click(null, (offset + 2));
						
					//
						
					break;
				}
				case Globalizer.TXT_LOW:
				{
					JCSL.element.modify(td_summary, null, {backgroundColor:group_bg_colors[group], borderRight:border, borderTop:border, borderBottom:border});
						
					c$
					(
						JCSL.element.Type.span,
						DIV_performance_summary,
						{
							_text:
							JCSL.lang.string.format
							(
								Globalizer.MSG_COURSEWORK_BOTTOM_X_STUDENTS,
								[
									group_range,
									analysis.TestData.GradeGroups[0].Users.length,
									((analysis.TestData.GradeGroups[0].Users.length === 1) ? "" : "s")
								]
							)
						}
					);
						
					c$(JCSL.element.Type.anchor, DIV_performance_summary, {href:"javascript:", _text:Globalizer.TXT_EDIT_GROUP_SIZE}, {marginLeft:"10px"}, {click:edit_group_size__Click});
						
					//

					JCSL.element.transform_html
					(
						JCSL.element.find_by_data("id", "SPN_cutoff_caption", div_summary, JCSL.element.Type.span)[0],
						function t(html)
						{
							return html.replace(Globalizer.TXT_LOW, Globalizer.TXT_HIGH);
						}
					);
						
					break;
				}
			}
									
			//

			var DIV_performance_desc = JCSL.element.find_by_data("id", "DIV_performance_desc", DIV_performance_summary, JCSL.element.Type.div)[0];
				
			DIV_performance_summary.appendChild(DIV_performance_desc);
				
			JCSL.element.set_inner_text(DIV_performance_desc, Globalizer["MSG_COURSEWORK_ANALYTICS_DESC_" + group_names[group].toUpperCase()]);
				
			if (group_names[group] != Globalizer.TXT_MIDDLE)
			{
				JCSL.element.attach_event
                (
                    JCSL.element.find_by_data("id", "BTN_save", div_summary, JCSL.element.Type.input, false)[0],
                    JCSL.dom_event.Type.click,
                    BTN_save__Click
                );

				JCSL.element.attach_event
                (
                    JCSL.element.find_by_data("id", "BTN_cancel", div_summary, JCSL.element.Type.input, false)[0],
                    JCSL.dom_event.Type.click,
                    BTN_cancel__Click
                );
					
				JCSL.element.find_by_data("id", "SPN_cutoff_dec", div_summary, JCSL.element.Type.span, false)[0].innerHTML = ((group_names[group] == Globalizer.TXT_HIGH) ? Globalizer.TXT_TOP : Globalizer.TXT_BOTTOM);
					
				JCSL.element.find_by_data("id", "TXT_cutoff", div_summary, JCSL.element.Type.input, false)[0].value = group_range;
			}
		}

    //#endregion
}

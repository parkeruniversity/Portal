
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics()
{
	var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);
	
	var g$ = this.g$;
	
	//#region VARIABLE

        var analysis;

        var tabs;
        var InfoAndConfig;
        var QuestionDetail;
				
	//#endregion
	
	//#region METHOD

        this.init_style = function()
        {
            $base.init_style.call(this, true);
        }

        this.load = function()
        {
            JCSL.element.attach_event(g$("LNK_view_basics"),	"click", view_info_and_config, [0]);
			JCSL.element.attach_event(g$("LNK_view_settings"),	"click", view_info_and_config, [1]);
			JCSL.element.attach_event(g$("LNK_view_groups"),	"click", view_info_and_config, [2]);

            //

            JCSL.ui.CachedControl.download
            (
                {
                    base:           $this.constructor._meta.base,
                    name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.ScoreDistribution",
                    version:        "v052611.1",
                    parent:         $this,
                    callback:       function(sd){sd.render($this.g$("TTD_score_distribution"));}
                }
            );

            $base.load.call(this);
        }

        this.load_images = function()
        {
            $base.load_images.call(this, this.data.paths.image);
        }

		this.render = function(div)
		{
            this.container = div;

            //
            
            tabs = new JCSL.ui.controls.Tabs
			(
				[
					{
						caption:	Globalizer.TXT_GRID_VIEW,
                        selected:   show_question_grid
					},
					{
						caption:	Globalizer.TXT_QUESTION_BY_QUESTION,
                        selected:   show_question_detail
					}					
				]
			);
			
			tabs.render(g$("DIV_questions_tabs"));

            //
			
			this.show();

			this.populate();
		}
		
		this.show = function()
		{
			$this._element.style.display = "";
			
			JCSL.element.swap(this._element, this.container);
		}

		this.populate = function () {
		    var callback = function (returned) {
		        if (returned instanceof Error) {
		            g$("DIV_analytics").style.display = "none";

		            //

		            var header = Globalizer.ERR_HDR_COURSEWORK_ANALYSIS_NOT_AVAILABLE;
		            var message = Globalizer.ERR_COURSEWORK_ANALYSIS_UNKNOWN_ERROR;

		            switch (returned.type) {
		                case "RPCServerException":
		                    {
		                        if (
		                           	returned.exception.is("user groups are not initialized") ||
		                           	returned.exception.fullname == "AnalysisService user groups are not initialized."
								) {
		                            header = Globalizer.ERR_HDR_COURSEWORK_ANALYSIS_NOT_YET_AVAILABLE;
		                            message = Globalizer.ERR_COURSEWORK_ATLEAST_X_STUDENTS;

		                            break;
		                        }

		                        if (
		                           	returned.exception.is("couldn't load coursework with id") ||
		                           	returned.exception.fullname == "couldn't load coursework with id"
								) {
		                            message = Globalizer.ERR_COURSEWORK_CANT_LOAD;

		                            break;
		                        }

		                        if (
		                           	returned.exception.is("AnalysisGroupRange can't be found in Data.Groups list") ||
		                           	returned.exception.fullname == "AnalysisGroupRange can't be found in Data.Groups list."
								) {
		                            header = Globalizer.ERR_HDR_COURSEWORK_ANALYSIS_NOT_YET_AVAILABLE;
		                            message = Globalizer.ERR_COURSEWORK_LACKING_GRADE_DATA;

		                            break;
		                        }

		                        if (
		                           	returned.exception.is("coursework does not contain any responses") ||
		                           	returned.exception.fullname == "Coursework does not contain any responses."
								) {
		                           	header = Globalizer.ERR_HDR_COURSEWORK_ANALYSIS_NOT_YET_AVAILABLE;
		                            message = Globalizer.ERR_COURSEWORK_NO_RESPONSE_DATA;

		                            break;
		                        }

		                        if (
		                           	returned.exception.is("Coursework must have points to calculate grade stats") ||
		                           	returned.exception.fullname == "Coursework must have points to calculate grade stats."
								) {
		                            header = Globalizer.ERR_HDR_COURSEWORK_ANALYSIS_NOT_YET_AVAILABLE;
		                            message = Globalizer.ERR_COURSEWORK_NO_RESPONSE_DATA;
		                        }
		                    }
		            }

		            $this.on_error(header, message);

		            return;
		        }

		        //

		        g$("DIV_analytics").style.display = "";

		        //

		        JCSL.lang.array.consolidate
				(
					JCSL.lang.array.join_on_array(returned.Coursework.CourseworkSections, "Questions"),
					returned.GetTestQuestionSummary().QuestionSummaries,
					function (object1, object2) {
					    return (object1.ID.ToString() == object2.QuestionID.ToString());
					}
				);

		        for (var section in returned.Coursework.CourseworkSections) {
		            returned.Coursework.CourseworkSections[section].Questions.sort(JCSL.lang.array.comparer.numeric("ItemOrder"));
		        }

		        analysis = returned;

		        //

		        JCSL.reflection.load_objects
                (
                    {
                        base: ($this.constructor._meta.base + "Charting/"),
                        names: [
                                        "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.Charts.LetterGradeDistribution",
                                        "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.Charts.QuestionDifficultyDistribution",
                                        "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.Charts.AverageScoreByPerformanceGroup"
                                    ],
                        version: "102709.1",
                        args: [$this, analysis]
                    }
                );

		        //

		        JCSL.element.set_inner_text(g$("SPN_assignment_name"), analysis.Coursework.Name);

		        //

		        $this.data_bind
				(
					analysis,
					[
						function format_mode(data) {
						    if (data.length == analysis.Grades.length) return Globalizer.MSG_COURSEWORK_NO_MODE_SCORE;

						    if (data.length == 1) return (data[0] + "%");

						    return (data.toString().replace(new RegExp(",", "g"), "%, ") + "%");
						},
                        function student_link(data) {
                            data = data.split(",");

                            var o = analysis["GetTest" + data[0] + "Summary"]();

                            var id = o[data[1] + "UserID"];

                            if (id == null) return window.Globalizer.TXT_MULTIPLE.toLowerCase();

                            return $this.create_student_link((o[data[1] + "UserName"]), id.ToString());
                        }
					]
				);

		        tabs.select(0);
		    }

		    ////

		    JCSL.JICS.rpc
			(
				{
				    url: ($this.constructor._meta.base + "AnalyticsCalc.asmx/gather"),
				    parameters: {
				        assignment_id: $this.data.assignment_id
				    },
				    time_out: 300,
				    notifier: new JCSL.ui.patterns.Animation
									(
										($this.data.paths.image + "AjaxImages/" + "L02b_blue.gif"),
										g$("DIV_analytics"),
										{ display: JCSL.element.css.Display.block, margin: "10px" },
										JCSL.element.insert_before,
										Globalizer.MSG_COURSEWORK_WAIT_FOR_ANALYSIS
									),
				    callback: callback,
				    err_message: null
				}
			);
		}	

        this.get_analysis = function()
        {
            return analysis;
        }

        this.create_student_link = function(user_name, user_id)
        {
            return JCSL.element.create("a", null, {innerHTML:user_name, href:$this.data.student_link_template.replace("00000000-0000-0000-0000-000000000000", user_id)});
        }

	//#endregion
	
	//#region ROUTINE

		var view_info_and_config = function(event_args, tab)
		{
            var callback = function(iag)
            {
                InfoAndConfig = iag;

                InfoAndConfig.render(g$("DIV_InfoAndConfig"));

                view_info_and_config(event_args, tab);
            }
            
            ////

            if (InfoAndConfig == null)
            {
                JCSL.ui.CachedControl.download
                (
                    {
                        base:            $this.constructor._meta.base,
                        name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.InfoAndConfig",
                        version:        "v052611.1",
                        callback:       callback,
                        parent:         $this
                    }
                );

                return;
            }

            InfoAndConfig.show(tab);
		}

        var show_question_grid = function(args)
        {
            var callback = function(qg)
            {
                args.selected.detach(show_question_grid);

                qg.render(args.container);
            }
            
            ////

            JCSL.ui.CachedControl.download
            (
                {
                    base:            $this.constructor._meta.base,
                    name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.QuestionGrid",
                    version:        "v052611.1",
                    callback:       callback,
                    parent:         $this
                }
            );

            JCSL.ui.CachedControl.download
            (
                {
                    id:             "QuestionDetailControl",
                    base:           $this.constructor._meta.base,
                    name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.QuestionDetail",
                    version:        "v052611.1",
                    parent:         $this,

                    data:           {tabs: tabs},   //remove

                    callback:       function(qd)
                                    {
                                        QuestionDetail = qd;
                                    }
                }
            );
        }

        var show_question_detail = function(args)
        {
            args.selected.detach(arguments.callee);

            QuestionDetail.render(args.container);
        }

    //#endregion
}

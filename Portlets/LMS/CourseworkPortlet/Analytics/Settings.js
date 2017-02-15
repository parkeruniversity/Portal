
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$Settings()
{
    var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    //#region VARIABLE

        var is_loaded = false;

        var fields;

        var rpc_fetch;
        var rpc_save;
        var rpc_reset;

        var current_settings = {};

    //#endregion

    //#region ROUTINE

        var load = function () {
            fields = JCSL.element.find_by_data("d1", "setting", $this.g$("DIV_warnings"), JCSL.element.Type.input);

            JCSL.element.input_text.hook_validation
		    (
			    fields,
			    function (element, validated, group_validated) {
			        JCSL.element.html_disable($this.g$("BTN_save"), !group_validated);
			    }
		    );

            //

            JCSL.element.attach_events
		    (
			    [$this.g$("BTN_save"), JCSL.dom_event.Type.click, BTN_save__Click],
			    [$this.g$("BTN_cancel"), JCSL.dom_event.Type.click, BTN_cancel__Click],
			    [$this.g$("LNK_reset"), JCSL.dom_event.Type.click, LNK_reset__Click],
                [$this.g$("LNK_bkmk_difficulty_rating"), JCSL.dom_event.Type.click, LNK_bkmk_Click],
                [$this.g$("LNK_bkmk_discrimination_indices"), JCSL.dom_event.Type.click, LNK_bkmk_Click],
                [$this.g$("LNK_bkmk_distractor_performance"), JCSL.dom_event.Type.click, LNK_bkmk_Click]
		    );

            var loading =
            new JCSL.ui.patterns.Animation  //JCSL.ui.patterns.loading.Animation
            (
                ($this.data.paths.image + "AjaxImages/" + "L03b_green.gif"),
                $this.g$("BTN_cancel"),
                { position: JCSL.element.css.Position.absolute, marginTop: "-3px" }
            );


            rpc_fetch =
		    new JCSL.JICS.RPCall
		    (
			    {
			        url: ($this.constructor._meta.base + "AnalyticsSettings.asmx/fetch"),
			        parameters: {
			            assignment_id: $this.data.assignment_id
			        },
			        notifier: loading,
			        error: function () {
			            new JCSL.ui.windows.MessageBox("", Globalizer.ERR_COURSEWORK_ANALYSIS_SETTINGS_LOAD).open(g$("BTN_settings_save"));
			        }
			    }
		    );

            rpc_save =
		    new JCSL.JICS.RPCall
		    (
			    {
			        url: ($this.constructor._meta.base + "AnalyticsSettings.asmx/save"),
			        notifier: loading,
			        error: function () {
			            new JCSL.ui.windows.MessageBox("", Globalizer.ERR_COURSEWORK_SAVING_SETTINGS).open(g$("BTN_settings_save"));
			        }
			    }
		    );

            rpc_reset =
            new JCSL.JICS.RPCall
            (
                {
                    url: ($this.constructor._meta.base + "AnalyticsSettings.asmx/reset"),
                    parameters: {
                        assignment_id: $this.data.assignment_id
                    },
                    notifier: new JCSL.ui.patterns.Animation  //JCSL.ui.patterns.loading.Animation
                                    (
                                        ($this.data.paths.image + "AjaxImages/" + "L03b_red.gif"),
                                        $this.g$("BTN_cancel"),
                                        { position: JCSL.element.css.Position.absolute, marginTop: "-3px" }
                                    ),
                    error: function () {
                        new JCSL.ui.windows.MessageBox("", Globalizer.ERR_COURSEWORK_DURING_SETTINGS_RESET).open(g$("BTN_settings_save"));
                    }
                }
            );

            //

            is_loaded = true;
        }

        var fetch = function()
        {
            var fetched = function(returned)
		    {
			    JCSL.lang.for_item
			    (
				    JCSL.element.find_by_data("d1", "setting", $this.g$("DIV_warnings"), JCSL.element.Type.input),
				    function(input, index)
				    {
					    var val = returned[JCSL.element.remove_prefix(input.getAttribute("data-id"))];
							
					    if (input == $this.g$("TXT_distractor_performance"))
					    {
						    current_settings[index] = val;
					    }
					    else
					    {
						    switch (val) //TODO: rerplace with function which converts percentage to decimal which also handles negatives
						    {
							    case 0:
							    {
								    current_settings[index] = val;
										
								    break;
							    }
							    case -100:
							    case  100:
							    {
								    current_settings[index] = val.toString().replace(100, 1);
										
								    break;
							    }
							    default:
							    {
								    current_settings[index] = JCSL.lang.math.precision((val / 100), .01).toString().replace("0.", ".");
										
								    break;
							    }
						    }
					    }
							
					    input.value = current_settings[index];
				    }
			    );
					
			    //
					
//JCSL.element.html_disable(JCSL.element.find({tagName:JCSL.element.Type.input, parentNode:$this.g$("DIV_warnings")}), false);
		    }

            //

//JCSL.element.html_disable(JCSL.element.find_by_data("s1", "true", $this.g$("DIV_warnings")));

            rpc_fetch.complete = fetched;

            rpc_fetch.execute();
        }

	    var BTN_save__Click = function()
	    {
		    var saved = function(returned)
		    {					
			    if (returned instanceof Error) return;

                //

                $this.parent.parent.populate();
                					
			    //
			    // set cancel values to newly saved values
					
			    JCSL.lang.for_item
			    (
				    JCSL.element.find_by_data("d1", "setting", $this.g$("DIV_warnings"), JCSL.element.Type.input),
				    function(input, index)
				    {
					    current_settings[index] = input.value
				    }
			    );					
		    }
				
		    ////

            rpc_save.complete   = saved;
            rpc_save.parameters =
            {
				assignment_id:			$this.data.assignment_id,
				difficulty_rating_low:	$this.g$("TXT_difficulty_rating_low").value,
				difficulty_rating_high:	$this.g$("TXT_difficulty_rating_high").value,
				discrimination_index:	$this.g$("TXT_discrimination_index").value,
				distractor_performance: $this.g$("TXT_distractor_performance").value
            }               
            								
		    rpc_save.execute();
	    }
			
	    var BTN_cancel__Click = function()
	    {
		    JCSL.lang.for_item
		    (
			    fields,
			    function(input, index)
			    {
				    JCSL.element.input_text.trigger_validation
				    (
					    input,
					    current_settings[index]
				    );
			    }
		    );
	    }

	    var LNK_reset__Click = function()
	    {
		    var reset = function(returned)
		    {
                var revalidate = function()
                {
                    rpc_fetch.completed.detach(revalidate);

				    JCSL.lang.for_item
				    (
					    fields,
                        function(item)
                        {
                            JCSL.element.input_text.trigger_validation(item);
                        }
				    );
                }

                ////

			    if (returned instanceof Error) return;
				
                //

                rpc_fetch.completed.attach(revalidate);

                fetch();

                //
                
                $this.parent.parent.populate();
		    }
				
		    ////

            rpc_reset.complete = reset;

		    rpc_reset.execute();
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

    //#endregion

    //#region METHOD

        this.load_images = function()
        {
            $base.load_images.call(this, this.data.paths.image);
        }

        this.render = function(container)
        {
            if (!is_loaded)
            {
                load();
            }

            fetch();

            $base.render.call(this, container);
        }

    //#endregion
}
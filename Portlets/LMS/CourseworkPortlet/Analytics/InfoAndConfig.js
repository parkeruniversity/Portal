
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$InfoAndConfig()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    var g$ = this.g$;

    //#region VARIABLE

        var is_loaded = false;

        

    //#endregion

    //#region ROUTINE

        var load = function()
        {
            $this.tabs =
            new JCSL.ui.controls.Tabs
		    (
			    [
				    {
					    caption:	Globalizer.TXT_COURSEWORK_ANALYSIS_BASICS,
                        selected:   show_basics
				    },
				    {
					    caption:	Globalizer.TXT_COURSEWORK_WARNING_SETTINGS,
                        selected:   show_settings
				    },
				    {
					    caption:	Globalizer.TXT_COURSEWORK_PERFORMANCE_GROUPS,
					    selected:   show_groups
				    }
			    ]
		    );

            $this.tabs.render(g$("DIV_iaf_tabs"));

		    JCSL.element.append
		    (
			    [
				    c$(JCSL.element.Type.image, null, {src:($this.data.paths.image + "back_arrow.gif")}, {marginRight:"5px"}),
				    c$
                    (
                        JCSL.element.Type.anchor,
                        null,
                        {
                            innerHTML:  Globalizer.MSG_COURSEWORK_BACK_TO_ANALYTICS,
                            href:       "javascript:"
                        },
                        null,
                        {
                            click:  function(){$this.hide.call($this);}
                        }
                    )
			    ],
			    $this.tabs.caption_div
		    );

            is_loaded = true;
        }


        var show_basics = function(args)
        {
            var callback = function(returned)
            {
                args.selected.detach(show_basics);

                args.container.appendChild(JCSL.element.create_from_html(returned));

                JCSL.globalization.globalize(args.container);
            }

            ////

            JCSL.ajax.async_get_as_text
            (
                ($this.constructor._meta.base + "AboutBasics.htm?060911.1"),
                null,
                callback
            )
        }

        var show_settings = function (args) {
            var callback = function (settings) {
                args.selected.detach(show_settings);

                settings.render(args.container);
            }

            ////

            JCSL.ui.CachedControl.download
            (
                {
                    base: $this.constructor._meta.base,
                    name: "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.Settings",
                    version: "v052611.1",
                    callback: callback,
                    parent: $this
                }
            );
        }

        var show_groups = function(args)
        {
            var callback = function(groups)
            {
                args.selected.detach(show_groups);

                groups.render(args.container);
            }

            ////

            JCSL.ui.CachedControl.download
            (
                {
                    base:       $this.constructor._meta.base,
                    name:       "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.PerformanceGroupControl",
                    version:    "v052611.1",
                    callback:   callback,
                    parent:     $this
                }
            );
        }

    //#endregion

    //#region METHOD

        this.load_images = function()
        {
            $base.load_images.call(this, this.data.paths.image);
        }

        this.render = function(div)
        {
            $base.render.call(this, div);

            this.container.appendChild(this._element);
        }

        this.show = function(tab)
        {
            if (!is_loaded)
            {
                load();
            }

            //

            this.parent.g$("DIV_main").style.display = "none";

            this._element.parentNode.style.display = "";

            //

            $this.tabs.select(tab);
        }

        this.hide = function()
        {
            this.parent.g$("DIV_main").style.display = "";

            this._element.parentNode.style.display = "none";
        }

    //#endregion
}
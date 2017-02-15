
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionDetail()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    //#region VARIABLE

        var questions_dictionary = new JCSL.Dictionary();

    //#endregion

    //#region ROUTINE

        var toggle_group = function(j_group, j_group_header, callback)
        {
            j_group.slideToggle
            (
                "slow",
                function()
                {
                    j_group[((this.style.display == "none") ? "remove" : "add") + "Class"]("CWK_Analytics_QuestionDetail_GroupHeader-Selected");

                    j_group_header.children("a[data-id='LNK_view']")[0].innerHTML = Globalizer["TXT_CWK_CLICK" + ((this.style.display == "none") ? "_VIEW" : "_CLOSE")];

                    if (callback != null)
                    {
                        callback();
                    }
                }
            );
        }

        var build = function(QuestionAnalysisControl)
        {
            var build_group_header = function(j_group)
            {
                j_group_header.children("a[data-id='LNK_view']")[0].innerHTML = Globalizer["TXT_CWK_CLICK_VIEW"];
                j_group_header.children("span[data-id='SPN_group_name']")[0].innerHTML = section.Name;
                j_group_header.children("span[data-id='SPN_question_count']")[0].innerHTML = (section.Questions.length + " " + Globalizer.GetStringForCount("TXT_QUESTIONS", section.Questions.length) + ".");

                with ({j_group:j_group, j_group_header:j_group_header})
                {
                    j_group_header.click(function(){toggle_group(j_group, j_group_header);});
                }

                $this._element.appendChild(j_group_header.get(0));
            }

            var build_group = function()
            {
                var DIV_j_group = j_group.get(0);

                $this._element.appendChild(DIV_j_group);

                var questions = section.Questions;

                for (var q in questions)
			    {
                    var question = questions[q];

                    var qac = new QuestionAnalysisControl(question, (question.ItemOrder+1));
							
				    qac.data = $this.parent.data;

                    qac.init_element();
                    qac.init_style();

                    qac.render(DIV_j_group);

                    //

                    var qid = (s + "#" + question.ItemOrder);

                    qac._element.setAttribute("data-question", qid);

                    questions_dictionary.add(qid, {j_group:j_group, j_group_header:j_group_header});
			    }

                if (section.Order == 0)
                {
                    toggle_group(j_group, j_group_header);
                }
            }

            ////

            var j_group_header;
            var j_group;

            for (var s in $this.parent.get_analysis().Coursework.CourseworkSections)
            {
                var section = $this.parent.get_analysis().Coursework.CourseworkSections[s];

                j_group_header = jQuery($this._templates.QuestionGroupHeader.cloneNode(true));
                j_group        = jQuery($this._templates.QuestionGroup.cloneNode(true));

                build_group_header.call(this, j_group);
                build_group.call(this);
            }
        }

    //endregion

    //#region METHOD

        this.load_images = function()
        {
            $base.load_images.call(this, (this.data.paths.image + "PortletImages/Icons/"));
        }

        this.init = function()
        {
            JCSL.ui.CachedControl.download
            (
                {
                    base:           ($this.constructor._meta.base + "QuestionRendering"),
                    name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.QuestionAnalysisControl.QuestionRendering.BaseQuestion",
                    version:        "050211.1",
                    instantiate:    false
                }
            );

    		JCSL.ui.CachedControl.download
            (
                {
                    base:           $this.constructor._meta.base,
                    name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.QuestionAnalysisControl",
                    version:        "050811.1",
                    callback:       build,
                    parent:         this,
                    instantiate:    false
                }
            );

            $base.init.call(this);
        }

        this.show_question = function(section, question)
        {
            var highlight = function()
            {
                table.scrollIntoView(true);

                var tempHeaderElement = $("<p class=header />").hide().appendTo("body");
                jQuery(table).effect
			    (
				    "highlight",
				    {
				        color: tempHeaderElement.css("background-color")
				    },
				    4000
			    );
                tempHeaderElement.remove();
            }

            this.data.tabs.get_tabs()[1].select();

            var qid = (section + "#" + question);

            var table = JCSL.element.find_by_data("question", qid, this._element, "table")[0];

            if (!jQuery(table).is(":visible"))
            {
                var o = questions_dictionary.get_val(qid);

                toggle_group(o.j_group, o.j_group_header, highlight);

                return;
            }

            highlight();
        }

    //#endregion
}

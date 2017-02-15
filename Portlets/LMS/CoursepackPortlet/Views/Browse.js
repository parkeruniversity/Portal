
function Jenzabar$LMS$Portlets$CoursepackPortlet$Views$Browse(element_id_prefix, extend)
{
	typeof "Jenzabar.LMS.Portlets.CoursepackPortlet.Views.Browse";
	
	var CSSDisplay		= JCSL.element.css.Display;
	var CSSVisibility	= JCSL.element.css.Visibility;
	
	////
	
	var $this = this;
//insert extend here	
	var $base = JCSL.lang.inherit(this, JCSL.JICS.Portlet, [element_id_prefix]);
	
	//#region FIELD
	
		var curr_target_identifier;	//Object
		var browse_ws;				//String
		
	//#endregion

	//#region METHOD
		
		this.load = function()
		{
			var toggle_admin_link = function(show)
			{			
				if ($this.admin_mode === true)
				{
					$this.get_element("TTRadmin").style.display = ((show === true) ? "" : CSSDisplay.none);
				}
			}
			
			var toc_display = function(event)
			{
				switch (this.id.slice(-14))
				{
					case "IMG_sizer_hide":
					{
						$this.get_element("DIV_toc").style.display			= CSSDisplay.none;
						$this.get_element("CELcontents").style.display		= CSSDisplay.none;
				
						toggle_admin_link(false);
						
						$this.get_element("DIVsizer").style.display			= CSSDisplay.none;
						
						//
						
						this.style.display									= CSSDisplay.none;
						$this.get_element("IMG_sizer_show").style.display	= "";
						
						//
						
						break;
					}
					case "IMG_sizer_show":
					{
						$this.get_element("DIV_toc").style.display			= "";
						$this.get_element("CELcontents").style.display		= "";
				
						toggle_admin_link(true);
						
						$this.get_element("DIVsizer").style.display			= "";
						
						//
						
						this.style.display									= CSSDisplay.none;
						$this.get_element("IMG_sizer_hide").style.display	= "";
						
						//
						
						break;
					}
				}
			}
			
			var render_portlet = function()
			{
				$this.get_element("DIVsizer").style.height = (this.portlet_height + "px");   //needs adjusting!
				
				//
				
				toggle_admin_link(true);
				
				//
				
				with (DIV_toc.style)
				{
					display			= CSSDisplay.block;
					width			= ((this.toc_width - 20) + "px"); // -20 for padding
					paddingLeft		= "10px";
					paddingRight	= "10px";
					height			= ((this.portlet_height - $this.get_element("DIVcontents").offsetHeight - (($this.get_element("TTRadmin").style.display === CSSDisplay.none) ? 0 : $this.get_element("TTRadmin").offsetHeight) - $this.get_element("ROWbanner").offsetHeight) + "px");
					
				}
				
				//
				
				$this.get_element("FRAcontent").style.height = (this.portlet_height + "px");
			}
			
			var initialize_sizer = function()
			{
				var DIV_start__drag_start = function()
				{
					placement = JCSL.element.get_position(DIV_sizer)[0];
					
					FRAcontent.style.visibility = CSSVisibility.hidden;
				}
				
				var DIV_size__drag_end = function()
				{
					FRAcontent.style.visibility = CSSVisibility.visible;
					
					//
					
					var diff = (JCSL.element.get_position(DIV_sizer)[0] - placement);
					
					if (diff !== 0)
					{
						DIV_toc.style.width = ((JCSL.element.get_dim(DIV_toc.style.width) + diff) + "px");
					}
					
					//
					// don't save pane position for guest accounts
					
					if ($this.ParentPortlet.PortalGlobal.UserCredentials.User.IsGuest === true) return;
					
					JCSL.JICS.rpc
					(
						{
							url:			(browse_ws + "common/Preferences.asmx/save_preference"),
							parameters:		{
												portlet_id			: $this.ParentPortlet.PortletDisplay.ID.AsGuid.ToString(),
												user_id				: $this.ParentPortlet.PortalGlobal.UserCredentials.User.ID.AsGuid.ToString(),
												preference_name		: "browse.toc_width",
												preference_value	: DIV_toc.offsetWidth
											},
							ignore_error:	true
						}
					);
				}
				
				var DIV_sizer__boundry_reached = function(boundry)
				{
					var flash = function(interval)
					{
						//
						//insures the sizer is set back to original style
						
						if (interval === 5)
						{
							DIV_sizer.className = "CCI__pane_sizer";
							
							return;
						}
						
						//
						
						DIV_sizer.className = ((DIV_sizer.className === "CCI__pane_sizer") ? "CCI__pane_sizer_blink" : "CCI__pane_sizer");
					}
					
					////
					
					JCSL.lang.repeat_execute(5, flash, 200);
				}
				
				////
							
				var placement; //Number
				
				//
				
				var DIV_sizer = $this.get_element("DIVsizer");
				
				DIV_sizer.drag_handler = new JCSL.DraggableObjectHandler($this.get_element("DIVsizer"), null, $this.get_div(), true, {left_boundry:300, right_boundry:200});
				
				DIV_sizer.drag_handler.v_draggable	= false;
				DIV_sizer.drag_handler.placeholder	= false;
				
				DIV_sizer.drag_handler.drag_start.attach(DIV_start__drag_start);
				DIV_sizer.drag_handler.drag_end.attach(DIV_size__drag_end);
				DIV_sizer.drag_handler.boundry_reached.attach(DIV_sizer__boundry_reached);
			}
			
			////
					
			var DIV_toc = this.get_element("DIV_toc");
			
			var FRAcontent	= this.get_element("FRAcontent");
			
			//
			
			JCSL.element.attach_event(this.get_element("IMG_sizer_show"), JCSL.dom_event.Type.click, toc_display);
			JCSL.element.attach_event(this.get_element("IMG_sizer_hide"), JCSL.dom_event.Type.click, toc_display);
			
			//
			
			render_portlet.call(this);
			
			generate_toc();
			
			//
			//select default/last item
			
			//document.getElementById("$_SPNitem" + "1-5.1").onclick();
			
			//
			//scroll toc and content panes to last position and attach event for saving in preferences
			
			DIV_toc.scrollTop = this.toc_scroll;
			
			//$.scrollability.attach_scrollable();
			
			//
								
			initialize_sizer();
		}
		
		this.load_content = function(item_object, identifier, target)
		{
			var write_no_target = function()
			{
				var write = function(document)
				{
					document.open();
					document.write("<html><body style='font-size:80%;'>");
					document.write(Glob.MSG_CCI_NO_FILE_TO_DISPLAY);
					document.write("</body></html>");
					document.close();
				}
				
				////
				
				var iframe_window = $this.get_element("FRAcontent").contentWindow;
				
				switch (JCSL.browser.get_agent().Name)
				{
					case "Explorer":
					{
						//
						//ie has no document object loaded if Acrobat Reader displaying
						
						iframe_window.navigate("about:blank");
						
						(
						function()
						{
							if (typeof(iframe_window.document) == "unknown")
							{
								setTimeout(arguments.callee, 100);
							}
							else
							{
								write(iframe_window.document);
							}
						}
						)();
						
						//
						
						break;
					}
					default:
					{
						write(iframe_window.document);
						
						break;
					}
				}
			}
			
			////
					
			var FRAcontent = this.get_element("FRAcontent");
			
			//
			//highlight selected item in left pane
				
			if (this.curr_target_identifier != null)
			{
				with (this.curr_target_identifier.style)
				{
					backgroundColor	= "";
					fontWeight		= "";
					color			= "#0000FF";
				}
			}
			
			this.curr_target_identifier = item_object;
			
			with (this.curr_target_identifier.style)
			{
				backgroundColor	= "#1D50AA";
				fontWeight		= JCSL.element.css.FontWeight.bold;
				color			= "#FFFFFF";
			}
			
			//
				
			//save_preference("browse.default_selection", identifier, $.THIS.ParentPortlet.PortletDisplay.PortletTemplate.ID.AsGuid, $.THIS.ParentPortlet.PortletDisplay.ID.AsGuid, $.THIS.ParentPortlet.PortalGlobal.UserCredentials.User.ID.AsGuid);

			//
						
			if (target.length === 0)
			{
				write_no_target();
			}
			else
			{
				FRAcontent.src = (browse_ws + "Content/_Loading.htm" + JCSL.window.generate_qs({ver: "052810.1", target: target, img:(this.common_image_path + "AJAXImages/L02b_blue.gif")}));
			}
		}
		
		this.node_click = function(identifier)
		{
			var items_table = this.get_element("TTDitem" + identifier);
			
			if (items_table == null) return;
			
			//
			
			var image = this.get_element("IMGitem" + identifier);
			
			if (items_table.style.display == "")
			{
				items_table.style.display = CSSDisplay.none;
				
				image.src = ($this.common_image_path + "expand2.gif");
			}
			else
			{
				items_table.style.display = "";
				
				image.src = ($this.common_image_path + "collapse2.gif");
			}
		}
		
	//#endregion
	
	//#region ROUTINE
	
		function generate_toc()
		{
			var ws_callback = function(returned)
			{
				var authorize_cartridge = function()
				{
					var ib_callback = function(result)
					{				
						var ws_callback = function(returned)
						{
							wb_closer();
							
							if (returned.authorized === false)
							{
								new JCSL.ui.windows.MessageBox("", returned.error, authorize_cartridge).open(null);
								
								return;
							}
							
							//
							
							generate_toc();
						}
						
						var ws_err_callback = function(returned)
						{						
							var message; //String
							
							switch (returned.type)
							{
								case "RPCTimeOut":
								{
									delete_cartridge();
									
									return;
								}
								case "RPCServerException":
								{
									message = Glob.MSG_CCI_CONN_TO_AUTH_SERVER;
									
									break;
								}
								default:
								{
									message = JCSL.JICS.rpc.compose_message(Glob.ERR_CCI_DURING_AUTH);
								}
							}
							
							new JCSL.ui.windows.MessageBox("", message, delete_cartridge).open(null);
						}
						
						////
						
						if (result == Glob.TXT_CANCEL)
						{
							delete_cartridge();
							
							return;
						}
						
						//
						
						var wb_closer = new JCSL.ui.windows.WaitBox(Glob.MSG_CCI_WAIT_FOR_AUTH, "UI/Common/Images/AJAXImages/L03b_green.gif").open(null);
						
						JCSL.JICS.rpc
						(
							{
								url:			(Portal.url + "UI/Services/LockedContent/AuthorizationService.asmx/authorize_by_id"),
								parameters:		{
													id:				$this.cartridge_id.ToString(),
													key:			ib.get_value(),
													url:			JCSL.window.document.get_base()
												},
								callback:		ws_callback,
								err_callback:	ws_err_callback
							}
						);
					}
					
					////
					
					var ib = new JCSL.ui.windows.InputBox(Glob.TXT_LOCKED_CARTRIDGE, Glob.MSG_CCI_CARTRIDGE_AUTH_REQ, ib_callback);		

					ib.open(null);				
				}
				
				var delete_cartridge = function()
				{
					JCSL.window.document.disable(JCSL.JICS.DocumentProcessing);
					
					document.location.href = $this.FindControl("LNK_delete").get_element().href;
				}
				
				////
				
				if (returned instanceof Error)
				{
					//
					//adjust UI for encountered error
					
					DIV_toc.innerHTML = "";
					
					if (returned.exception.type == "SecurityException")
					{
						authorize_cartridge();
					}
					else
					{
						delete_cartridge();
					}
					
					return;
				}
				
				//

				DIV_toc.innerHTML = JCSL.ajax.insert_namespace(returned, $this.client_side_namespace);
			}
			
			////
					
			var DIV_toc = $this.FindControl("DIV_toc").get_element();
			
			//
			
			JCSL.element.create(JCSL.element.Type.image, DIV_toc, {src:($this.common_image_path + "AJAXImages/L02b_blue.gif")}, {marginTop:"10px"});
			
			//
			
			JCSL.JICS.rpc
			(
				{
					url:			(browse_ws + "Views/Browse.asmx/generate_toc"),
					parameters:		{
										cartridge_id:	$this.cartridge_id.ToString()
									},
					callback:		ws_callback,
					return_type:	JCSL.ajax.ReturnType.text,
					err_message:	null, //"The cartridge is not compatible.",
					timeout:		90
				}
			);
		}
	
	//#endregion
	
	//#region CONSTRUCTOR
		
        JCSL.lang.extend(this, extend, false);

        //

        browse_ws = (Portal.url + $this.url);

		//
		//set field default values
		
		curr_target_identifier = null;
		
	//#endregion
}

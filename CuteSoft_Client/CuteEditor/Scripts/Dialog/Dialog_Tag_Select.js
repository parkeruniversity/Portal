var OxOa3e1=["inp_name","inp_access","inp_id","inp_index","inp_size","inp_Multiple","inp_Disabled","inp_item_text","inp_item_value","btnInsertItem","btnUpdateItem","btnDeleteItem","btnMoveUpItem","btnMoveDownItem","list_options","list_options2","inp_item_forecolor","inp_item_forecolor_Preview","inp_item_backcolor_Preview","text","value","color","style","backgroundColor","selectedIndex","options","Please select an item first","length","ondblclick","onclick","OPTION","document","id","cssText","Name","name","size","checked","disabled","multiple","tabIndex","","accessKey"];var inp_name=Window_GetElement(window,OxOa3e1[0],true);var inp_access=Window_GetElement(window,OxOa3e1[1],true);var inp_id=Window_GetElement(window,OxOa3e1[2],true);var inp_index=Window_GetElement(window,OxOa3e1[3],true);var inp_size=Window_GetElement(window,OxOa3e1[4],true);var inp_Multiple=Window_GetElement(window,OxOa3e1[5],true);var inp_Disabled=Window_GetElement(window,OxOa3e1[6],true);var inp_item_text=Window_GetElement(window,OxOa3e1[7],true);var inp_item_value=Window_GetElement(window,OxOa3e1[8],true);var btnInsertItem=Window_GetElement(window,OxOa3e1[9],true);var btnUpdateItem=Window_GetElement(window,OxOa3e1[10],true);var btnDeleteItem=Window_GetElement(window,OxOa3e1[11],true);var btnMoveUpItem=Window_GetElement(window,OxOa3e1[12],true);var btnMoveDownItem=Window_GetElement(window,OxOa3e1[13],true);var list_options=Window_GetElement(window,OxOa3e1[14],true);var list_options2=Window_GetElement(window,OxOa3e1[15],true);var inp_item_forecolor=Window_GetElement(window,OxOa3e1[16],true);var inp_item_forecolor=Window_GetElement(window,OxOa3e1[16],true);var inp_item_forecolor_Preview=Window_GetElement(window,OxOa3e1[17],true);var inp_item_backcolor_Preview=Window_GetElement(window,OxOa3e1[18],true);function SetOption(Ox1a6){Ox1a6[OxOa3e1[19]]=inp_item_text[OxOa3e1[20]];Ox1a6[OxOa3e1[20]]=inp_item_value[OxOa3e1[20]];Ox1a6[OxOa3e1[22]][OxOa3e1[21]]=inp_item_forecolor[OxOa3e1[20]];Ox1a6[OxOa3e1[22]][OxOa3e1[23]]=inp_item_backcolor[OxOa3e1[20]];} ;function SetOption2(Ox1a6){Ox1a6[OxOa3e1[19]]=inp_item_value[OxOa3e1[20]];Ox1a6[OxOa3e1[20]]=inp_item_text[OxOa3e1[20]];Ox1a6[OxOa3e1[22]][OxOa3e1[21]]=inp_item_forecolor[OxOa3e1[20]];Ox1a6[OxOa3e1[22]][OxOa3e1[23]]=inp_item_backcolor[OxOa3e1[20]];} ;function Select(Ox1a6){var Ox5a0=Ox1a6[OxOa3e1[24]];list_options[OxOa3e1[24]]=Ox5a0;list_options2[OxOa3e1[24]]=Ox5a0;inp_item_text[OxOa3e1[20]]=list_options2[OxOa3e1[20]];inp_item_value[OxOa3e1[20]]=list_options[OxOa3e1[20]];} ;function Insert(){var Ox1a6= new Option();SetOption(Ox1a6);list_options[OxOa3e1[25]].add(Ox1a6);var Ox5a2= new Option();SetOption2(Ox5a2);list_options2[OxOa3e1[25]].add(Ox5a2);FireUIChanged();} ;function Update(){if(list_options[OxOa3e1[24]]==-1){alert(OxOa3e1[26]);return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);SetOption(Ox1a6);var Ox5a2=list_options2.options(list_options2.selectedIndex);SetOption2(Ox5a2);FireUIChanged();} ;function Move(Ox142){var Ox5a0=list_options[OxOa3e1[24]];if(Ox5a0<0){return ;} ;var Ox5a4=Ox5a0-Ox142;if(Ox5a4<0){Ox5a4=0;} ;if(Ox5a4>(list_options[OxOa3e1[25]][OxOa3e1[27]]-1)){Ox5a4=list_options[OxOa3e1[25]][OxOa3e1[27]]-1;} ;if(Ox5a0==Ox5a4){return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);var Ox12=list_options2[OxOa3e1[20]];var Ox8=list_options[OxOa3e1[20]];Delete();inp_item_text[OxOa3e1[20]]=Ox12;inp_item_value[OxOa3e1[20]]=Ox8;var Ox1a6= new Option();SetOption(Ox1a6);list_options[OxOa3e1[25]].add(Ox1a6,Ox5a4);var Ox5a2= new Option();SetOption2(Ox5a2);list_options2[OxOa3e1[25]].add(Ox5a2,Ox5a4);list_options[OxOa3e1[24]]=Ox5a4;list_options2[OxOa3e1[24]]=Ox5a4;FireUIChanged();} ;function Delete(){if(list_options[OxOa3e1[24]]==-1||list_options[OxOa3e1[24]]==-1){alert(OxOa3e1[26]);return ;} ;var Ox5a5=list_options[OxOa3e1[24]];var Ox1a6=list_options.options(list_options.selectedIndex);Ox1a6.removeNode(true);Ox1a6=list_options2.options(list_options2.selectedIndex);Ox1a6.removeNode(true);if(list_options[OxOa3e1[25]][OxOa3e1[27]]>Ox5a5){list_options[OxOa3e1[24]]=Ox5a5;} else {if(list_options[OxOa3e1[25]][OxOa3e1[27]]){list_options[OxOa3e1[24]]=list_options[OxOa3e1[25]][OxOa3e1[27]]-1;} ;} ;list_options.ondblclick();if(list_options2[OxOa3e1[25]][OxOa3e1[27]]>Ox5a5){list_options2[OxOa3e1[24]]=Ox5a5;} else {if(list_options2[OxOa3e1[25]][OxOa3e1[27]]){list_options2[OxOa3e1[24]]=list_options2[OxOa3e1[25]][OxOa3e1[27]]-1;} ;} ;FireUIChanged();} ;list_options[OxOa3e1[28]]=function list_options_ondblclick(){if(list_options[OxOa3e1[24]]==-1){return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);inp_item_text[OxOa3e1[20]]=Ox1a6[OxOa3e1[19]];inp_item_value[OxOa3e1[20]]=Ox1a6[OxOa3e1[20]];inp_item_forecolor[OxOa3e1[20]]=inp_item_forecolor[OxOa3e1[22]][OxOa3e1[23]]=inp_item_forecolor_Preview[OxOa3e1[22]][OxOa3e1[23]]=Ox1a6[OxOa3e1[22]][OxOa3e1[21]];inp_item_backcolor[OxOa3e1[20]]=inp_item_backcolor[OxOa3e1[22]][OxOa3e1[23]]=inp_item_backcolor_Preview[OxOa3e1[22]][OxOa3e1[23]]=Ox1a6[OxOa3e1[22]][OxOa3e1[23]];} ;inp_item_forecolor[OxOa3e1[29]]=inp_item_forecolor_Preview[OxOa3e1[29]]=function inp_item_forecolor_onclick(){SelectColor(inp_item_forecolor,inp_item_forecolor_Preview);} ;inp_item_backcolor[OxOa3e1[29]]=inp_item_backcolor_Preview[OxOa3e1[29]]=function inp_item_backcolor_onclick(){SelectColor(inp_item_backcolor,inp_item_backcolor_Preview);} ;function CopySelect(Ox5aa,Ox5ab){Ox5ab[OxOa3e1[25]][OxOa3e1[27]]=0;for(var i=0;i<Ox5aa[OxOa3e1[25]][OxOa3e1[27]];i++){var Ox5ac=Ox5aa[OxOa3e1[25]][i];var Ox5a2;if(Browser_IsWinIE()){Ox5a2=Ox5ab[OxOa3e1[31]].createElement(OxOa3e1[30]);} else {Ox5a2=document.createElement(OxOa3e1[30]);} ;if(Ox5ab[OxOa3e1[32]]!=OxOa3e1[15]){Ox5a2[OxOa3e1[20]]=Ox5ac[OxOa3e1[20]];Ox5a2[OxOa3e1[19]]=Ox5ac[OxOa3e1[19]];} else {Ox5a2[OxOa3e1[20]]=Ox5ac[OxOa3e1[19]];Ox5a2[OxOa3e1[19]]=Ox5ac[OxOa3e1[20]];} ;Ox5a2[OxOa3e1[22]][OxOa3e1[33]]=Ox5ac[OxOa3e1[22]][OxOa3e1[33]];Ox5ab[OxOa3e1[25]].add(Ox5a2);} ;Ox5ab[OxOa3e1[24]]=Ox5aa[OxOa3e1[24]];} ;UpdateState=function UpdateState_Select(){} ;SyncToView=function SyncToView_Select(){if(element[OxOa3e1[34]]){inp_name[OxOa3e1[20]]=element[OxOa3e1[34]];} ;if(element[OxOa3e1[35]]){inp_name[OxOa3e1[20]]=element[OxOa3e1[35]];} ;inp_id[OxOa3e1[20]]=element[OxOa3e1[32]];inp_size[OxOa3e1[20]]=element[OxOa3e1[36]];CopySelect(element,list_options);CopySelect(element,list_options2);inp_Disabled[OxOa3e1[37]]=element[OxOa3e1[38]];inp_Multiple[OxOa3e1[37]]=element[OxOa3e1[39]];if(element[OxOa3e1[40]]==0){inp_index[OxOa3e1[20]]=OxOa3e1[41];} else {inp_index[OxOa3e1[20]]=element[OxOa3e1[40]];} ;if(element[OxOa3e1[42]]){inp_access[OxOa3e1[20]]=element[OxOa3e1[42]];} ;} ;SyncTo=function SyncTo_Select(element){element[OxOa3e1[35]]=inp_name[OxOa3e1[20]];if(element[OxOa3e1[34]]){element[OxOa3e1[34]]=inp_name[OxOa3e1[20]];} else {if(element[OxOa3e1[35]]){element.removeAttribute(OxOa3e1[35],0);element[OxOa3e1[34]]=inp_name[OxOa3e1[20]];} else {element[OxOa3e1[34]]=inp_name[OxOa3e1[20]];} ;} ;element[OxOa3e1[32]]=inp_id[OxOa3e1[20]];element[OxOa3e1[36]]=inp_size[OxOa3e1[20]];element[OxOa3e1[38]]=inp_Disabled[OxOa3e1[37]];element[OxOa3e1[39]]=inp_Multiple[OxOa3e1[37]];element[OxOa3e1[42]]=inp_access[OxOa3e1[20]];element[OxOa3e1[40]]=inp_index[OxOa3e1[20]];if(element[OxOa3e1[40]]==OxOa3e1[41]){element.removeAttribute(OxOa3e1[40]);} ;if(element[OxOa3e1[42]]==OxOa3e1[41]){element.removeAttribute(OxOa3e1[42]);} ;CopySelect(list_options,element);} ;
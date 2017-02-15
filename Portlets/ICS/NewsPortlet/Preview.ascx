<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Preview.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Preview" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/PreviewNewsPost.ascx" tagname="PreviewNewsPost" tagprefix="JICS" %>

<asp:PlaceHolder ID="_phLightbox" runat="server" />
<STYLE TYPE="text/css">
<!--
#restrictedRoles {POSITION:absolute;VISIBILITY:hidden;Z-INDEX:200;}
#restrictedRoles td{background-color:white;}
//-->
</STYLE>

<cmn:SubHeader id="_hdrPost" runat="server" ></cmn:SubHeader>

<div class="pSection">

    <div id="newsPreview">
        <table class="newsAction" cellspacing="0"  cellpadding="6">
			<tr>
				<td class="newsActionSave">
					<asp:Button ID="_btnSaveA" runat="server" OnClick="_btnSave_Click" /></asp:Button>
				</td>
				<td class="newsActionEdit">
					<asp:Button ID="_btnEditA" runat="server" OnClick="_btnEdit_Click" /> &nbsp; &nbsp; <asp:Button ID="_btnCancelA" runat="server" OnClick="_btnCancel_Click" />
				</td>
				<td >
				    <asp:Image ID="_imgDiscuss" runat="server" />&nbsp;&nbsp;
                    <asp:Literal ID="_litPipe" runat="server">|</asp:Literal>&nbsp;&nbsp;
                    <asp:Label ID="_lblShow" runat="server"></asp:Label>
                    <asp:Hyperlink ID="_hypSelectedRoles" runat="server"></asp:Hyperlink>
                    <div id="restrictedRoles" />
				</td>
			</tr>
        </table>
        <div style="clear:both;"></div>
         <cmn:SubHeader id="_hdrSummary" runat="server" ></cmn:SubHeader>
        <JICS:PreviewNewsPost id="_pNewsPostSummary" runat="server" />
        
        <cmn:SubHeader id="_hdrFull" runat="server" ></cmn:SubHeader>
        <JICS:PreviewNewsPost id="_pNewsPostFull" runat="server" />
        
          <table class="newsAction newsActionBorderTop" cellspacing="0"  cellpadding="6">
			<tr>
				<td  class="newsActionSave">
					<asp:Button ID="_btnSaveB" runat="server" OnClick="_btnSave_Click" />
				</td>
				<td class="newsActionEdit">
					<asp:Button ID="_btnEditB" runat="server" OnClick="_btnEdit_Click" /> &nbsp; &nbsp; <asp:Button ID="_btnCancelB" runat="server" OnClick="_btnCancel_Click" />
				</td>
				<td>&nbsp;</td>
			</tr>
        </table>
    </div>
</div>

<SCRIPT TYPE="text/javascript">
<!--

Xoffset=-60;  
Yoffset= 20;    

var old,skn,iex=(document.all),yyy=-1000;

var ns4=document.layers
var ns6=document.getElementById&&!document.all
var ie4=document.all

if (ns4)
skn=document.restrictedRoles
else if (ns6)
skn=document.getElementById("restrictedRoles").style
else if (ie4)
skn=document.all.restrictedRoles.style
if(ns4)document.captureEvents(Event.MOUSEMOVE);
else{
skn.visibility="visible"
skn.display="none"
}
document.onmousemove=get_mouse;

function popup(msg,bak){
var content="<TABLE  WIDTH=220 BORDER=1 BORDERCOLOR=black CELLPADDING=2 CELLSPACING=0 "+
"BGCOLOR="+bak+"><TD ALIGN=left><FONT COLOR=black SIZE=2>"+msg+"</FONT></TD></TABLE>";
yyy=Yoffset;
 if(ns4){skn.document.write(content);skn.document.close();skn.visibility="visible"}
 if(ns6){document.getElementById("restrictedRoles").innerHTML=content;skn.display=''}
 if(ie4){document.all("restrictedRoles").innerHTML=content;skn.display=''}
}

function get_mouse(e){
var x=(ns4||ns6)?e.pageX:event.x+document.body.scrollLeft;
skn.left=x+Xoffset;
var y=(ns4||ns6)?e.pageY:event.y+document.body.scrollTop;
skn.top=y+yyy;
}

function kill(){
yyy=-1000;
if(ns4){skn.visibility="hidden";}
else if (ns6||ie4)
skn.display="none"
}

//-->
</SCRIPT>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditMsg_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BulletinBoardPortlet.AddEditMsg_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>

<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<LINK href="Portlets/ICS/BulletinBoardPortlet/BBStyle.css" type="text/css" rel="stylesheet">
<div class="pSection">
<p>
	<asp:PlaceHolder ID="MsgForm" Runat="server">
		<table>
			<tr>
				<th><asp:label ID="lblSubject" Runat=Server /></th>
				<td><asp:textbox id=txtSubject runat="server" MaxLength="250" Columns="40"></asp:textbox>&nbsp; 
				<asp:requiredfieldvalidator id=RequiredFieldValidator1 
				runat="server" ControlToValidate="txtSubject"  
				Display="Dynamic" CssClass="validationMsgError" /></td></tr>
			<tr>
				<th valign="top"><asp:label ID="lblMessage" Runat=Server /></th>
			    <td>
			        <div id="_divErrtxtMessage" runat="server">
			            <asp:Label ID="_lblErrtxtMessage" runat="server" CssClass="validationMsgError" />
			        </div>
			        <jenzabar:TextEditorControl id="txtMessage" runat="server" MaxLength="10000" />
			    </td>
			</tr>
			<tr>
				<th></th>
				<td vAlign=top align=left>
					<asp:label ID="lblMaxChars" Runat=Server /> 
					&nbsp;
					<asp:linkbutton ID="lnkQuote" Runat="server" Visible=false />
				</td>
			</tr>
			</tr>
			<tr height="10px">
				<td></td>
			</tr>
			<asp:placeholder id="phAttach" Runat="server">
				<asp:placeholder id="phOldFile" Runat="server" Visible="False">
				<TR>
					<th noWrap><asp:label ID="lblCurrAttachment" Runat=Server /></th>
					<TD>
						<asp:label id="lblOldFile" Runat="server"></asp:label></TD>
				</TR>
				</asp:placeholder>
			<tr>
				<th nowrap>
					<asp:label id="lblNewFile" runat="server" />
				</th>
				<td>
					<INPUT id=UFile type=file runat="server" NAME="UFile">
				</td>
			</tr>
			</asp:placeholder>
			<asp:placeholder id="phDeleteAfter" Runat="server">
				<tr>
					<th nowrap>
						<asp:label ID="lblDeleteAfter" Runat=Server />
					</th>
					<td>
						<asp:dropdownlist id="ddDeleteAfter" runat="server">
						</asp:dropdownlist>
					</td>
				</tr>
			</asp:placeholder>
			<asp:PlaceHolder ID="phPhoto" Runat="server">
				<tr>
					<th>
					</th>
					<td>
						<asp:CheckBox ID="chkPhoto" Runat="server"  Checked="True" />
					</td>
				</tr>
			</asp:PlaceHolder>
			<asp:PlaceHolder ID="phAnon" Runat="server" Visible="false">
				<tr>
					<th>
					</th>
					<td>
						<asp:CheckBox ID="chkAnon" Runat="server" />
					</td>
				</tr>
			</asp:PlaceHolder>
			<tr height="10px">
				<td>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><asp:button id=btnSave runat="server"></asp:button>&nbsp;
					<asp:button id="btnPreview" runat="server"></asp:button>&nbsp;
					<asp:button id=btnCancel runat="server"  CausesValidation="False"></asp:button>
				</td>
			</tr>
			<tr height="10px">
				<td>
				</td>
			</tr>
			<asp:PlaceHolder ID="phOrigMsg" Runat="server" Visible="false">
				<tr>
					<th nowrap><asp:label ID="lblTranOrigMsg" Runat=Server /></th>
					<td><asp:label ID="lblOrigMsg" Runat="server"></asp:label></td>
				</tr>
			</asp:PlaceHolder>
		</table>
	</asp:PlaceHolder>
	<asp:PlaceHolder ID="MsgPreview" Runat="server" Visible="False">
		<div class="pSection">
			<div class="forumPortlet">
				<table class="forumPosts" cellspacing="0" border="0">
					<tr>
						<th>
							<asp:label id="lblName" runat="server"></asp:label>
						</th>
						<td>
							<h5><asp:label id="lblSubject2" runat="server"></asp:label></h5>
							<div class="postInfo">
								<asp:label id="lblCreated" runat="server"></asp:label>
							</div>
							<div class="postBody">
								<asp:label id="lblMessage2" runat="server"></asp:label>
							</div>
						</td>
						</tr>
                    <asp:PlaceHolder ID="MsgPreviewFile" runat="server" Visible="false">
                        <tr>
                            <th nowrap>
                                <asp:Label ID="lblNewFile2" runat="server" />
                            </th>
                            <td align="center">
                                For security reasons your file was not saved. Please select it again.<br>
                                <input id="UFile2" type="file" runat="server" name="UFile2">
                            </td>
                        </tr>
                    </asp:PlaceHolder>
					<tr><td colspan="2" class="space">&nbsp;</td></tr>
					<tr>
						<td></td>
						<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
							<asp:button id="btnPSave" runat="server"></asp:button>&nbsp;
							<asp:button id="btnPEdit" runat="server"></asp:button>&nbsp;
							<asp:button id="btnPCancel" runat="server"></asp:button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</asp:PlaceHolder>
</p>
</div>
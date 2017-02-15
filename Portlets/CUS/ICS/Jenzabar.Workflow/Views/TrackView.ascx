<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackView.ascx.cs" Inherits="Jenzabar.Workflow.Track_View" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<%@ Register src="../../Jenzabar.ContainedForm/Controls/LSRView.ascx" tagname="LSRView" tagprefix="cf" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../Controls/EmailBuilder.ascx" TagPrefix="uc1" TagName="EmailBuilder" %>
<%@ Register Src="../../Jenzabar.ContainedForm/Controls/DatabaseView.ascx" TagPrefix="cf" TagName="DatabaseBuilder" %>
<%@ Register Src="../Controls/DynApproverBldr.ascx" TagPrefix="cf" TagName="DynApproverBldr" %>
<%@ Register Src="../Controls/RuleBuilder.ascx" TagPrefix="cf" TagName="RuleBuilder" %>
<%@ Register Src="../Controls/DataPointBuilder.ascx" TagPrefix="cf" TagName="DataPointBuilder" %>
<%@ Register Src="../Controls/ApproverBuilder.ascx" TagPrefix="cf" TagName="ApproverBuilder" %>


<script src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.Workflow/Scripts/workflowScripts.js") %>'></script>
<div class="pSection">
    <asp:HiddenField runat="server" ID="hdnTrackID" />
    <div class="cssmenu">
        <ul id="SCFToolBar">
            <li><asp:LinkButton runat="server" ID="lnkAddStage" OnClick="lnkAddStage_Click">Add Stage</asp:LinkButton></li>
            <li><a style="cursor:pointer;" onclick="showTrackSettings();">Track Settings</a></li>
            <asp:PlaceHolder runat="server" ID="plhSiteAdmin">
                <li class="has-sub"><a>Site Administrators</a>
                    <ul>
                        <li><asp:LinkButton runat="server" ID="lnkDatabases" OnClick="lnkDatabases_Click">Databases</asp:LinkButton></li>
                        <li><asp:LinkButton runat="server" ID="lnkDynApprovers" OnClick="lnkDynApprovers_Click">Dynamic Approvers</asp:LinkButton></li>
                        <li><asp:LinkButton runat="server" ID="lnkStringReplacer" OnClick="lnkStringReplacer_Click">String Replacer</asp:LinkButton></li>
                    </ul>
                </li>
            </asp:PlaceHolder>
        </ul>
    </div>
    <asp:Panel ID="pnlBuilder" runat="server">
    <asp:Panel runat="server" ID="pnlTrackSettings" CssClass="jwf-track-settings" title="Track Settings">
        <div class="jwf-settings-tabs">
            <ul>
                <li><a href='<%= jQueryURL + "#setTabs-1"%>'>Definition</a></li>
                <li><a href='<%= jQueryURL + "#setTabs-2"%>'>Data Points</a></li>
            </ul>
            <div id="setTabs-1">
                <table width="100%">
                    <tr>
                        <td width="25%">Name:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="tbxTrackName" runat="server" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="tbxTrackDesc" runat="server" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="setTabs-2">
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <cf:DataPointBuilder runat="server" id="DataPointBuilder" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div style="text-align:center;">
            <asp:Button ID="btnTrackSave" runat="server" onclick="btnTrackSave_Click" 
                        Text="Save" Width="55px" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlStages" runat="server" CssClass="SortStages">
        <asp:Repeater ID="rptStages" runat="server" OnItemDataBound="rptStages_ItemDataBound">
            <ItemTemplate>
                <asp:Panel runat="server" ID="pnlRowTemplate" CssClass="AdminTrackRow RowTemplate">
                    <input type="hidden" id="rowID" value='<%# DataBinder.Eval(Container.DataItem, "StageID") %>' />
                    <div class="commandDiv">
                            <div class="dragHandle">&nbsp;</div>
                        </div>
                    <table style="width:100%;margin-left:18px;">
                        <tr>
                            <td><asp:LinkButton ID="lnkStageName" runat="server" onclick="lnkStageName_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "StageID") %>'><%# DataBinder.Eval(Container.DataItem, "Name") %></asp:LinkButton></td>
                            <td style="width:20px;"><asp:ImageButton ID="imgStageDelete" runat="server" 
                                        onclick="imgStageDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "StageID") %>' ImageUrl='<%# Jenzabar.ContainedForm.Helpers.FormResources.GetImageIconUrl("16/delete.png") %>'/></td>
                            
                        </tr>
                    </table>
                </asp:Panel>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="pnlStageDef" runat="server" Visible="False" CssClass="jwf-stage-settings">
        <div class="jwf-settings-tabs">
            <asp:HiddenField runat="server" ID="hdnStageId" />
	        <ul>
		        <li><a href='<%= jQueryURL + "#tabs-1" %>'>Definition</a></li>
		        <asp:PlaceHolder ID="plhApproversLink" runat="server"><li><a href='<%= jQueryURL + "#tabs-2" %>'>Approvers</a></li></asp:PlaceHolder>
                <asp:PlaceHolder ID="plhTasksLink" runat="server"><li><a href='<%= jQueryURL + "#tabs-3" %>'>Tasks</a></li></asp:PlaceHolder>
                <asp:PlaceHolder ID="plhEmailsLink" runat="server"><li><a href='<%= jQueryURL + "#tabs-4" %>'>Emails</a></li></asp:PlaceHolder>
                <asp:PlaceHolder ID="plhProcsLink" runat="server"><li><a href='<%= jQueryURL + "#tabs-5" %>'>Procedures</a></li></asp:PlaceHolder>
                <asp:PlaceHolder ID="plhRulesLink" runat="server"><li><a href='<%= jQueryURL + "#tabs-6" %>'>Rules</a></li></asp:PlaceHolder>
	        </ul>
	        <div id="tabs-1">
                <table>
                    <tr>
                        <td>
                            Name:
                        </td>
                        <td>
                    
                            <asp:TextBox ID="tbxStageName" runat="server" MaxLength="50"></asp:TextBox>
                    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description:
                        </td>
                        <td>
                    
                            <asp:TextBox ID="tbxStageDesc" runat="server" MaxLength="255"></asp:TextBox>
                    
                        </td>
                    </tr>
                    <tr style="display:none;">
                        <td>
                            Allow Comments:
                        </td>
                        <td>
                    
                            <asp:CheckBox ID="cbxAllowComments" runat="server" />
                    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Number of Required Responses:<br />
                            <small><i>All are required by default</i></small>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxNumReqResp"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Log Emails to Audit Trail:<br />
                            (Scheduled emails are automatically logged)
                        </td>
                        <td>
                            <asp:CheckBox ID="cbxEmailsToAudit" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Execute Statements:
                        </td>
                        <td>
                            <asp:CheckBox ID="cbxExecute" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:PlaceHolder ID="plhApprovers" runat="server">
            <div id="tabs-2">
                <cf:ApproverBuilder runat="server" id="ApproverBuilder" />
            </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="plhTasks" runat="server">
                <div id="tabs-3">
                    <asp:UpdatePanel runat="server" ID="updpTasks">
                        <ContentTemplate>
                            <ul>
                                <li><label>Task Name:</label><asp:TextBox runat="server" ID="tbxTaskName"></asp:TextBox></li>
                                <li><asp:Button runat="server" ID="btnAddTask" OnClick="btnAddTask_Click" Text="Add" /></li>
                            </ul>
                            <cc1:GroupedGrid runat="server" ID="grdTasks" DataKeyField="TaskID" OnItemDataBound="grdTasks_ItemDataBound">
                                <EmptyTableTemplate>
                                    There are no tasks in this stage.
                                </EmptyTableTemplate>
                                <TableHeaderTemplate>
                                    Tasks
                                </TableHeaderTemplate>
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <div class="taskCommandDiv">
                                                <div class="taskDragHandle">&nbsp;</div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Subject">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Description") %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Assigned To">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hdnTask" Value='<%# DataBinder.Eval(Container.DataItem,"TaskID") %>' />
                                            <asp:DropDownList runat="server" ID="drpTaskApprover" AutoPostBack="true" OnSelectedIndexChanged="drpTaskApprover_SelectedIndexChanged"></asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="imgTaskDelete" ImageUrl='<%# Jenzabar.Workflow.Helpers.WorkflowHelper.GetImageIconUrl("delete.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TaskID") %>' OnClick="imgTaskDelete_Click"/>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </cc1:GroupedGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="plhEmails" runat="server">
                <div id="tabs-4">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <cc1:AddImageAndTextButton ID="imgEmailAdd" Text="Add Email" runat="server" OnClick="imgEmailAdd_Click"></cc1:AddImageAndTextButton>
                            <cc1:GroupedGrid runat="server" ID="grdEmails" DataKeyField="EmailID">
                                <EmptyTableTemplate>
                                    There are no emails in this stage.
                                </EmptyTableTemplate>
                                <TableHeaderTemplate>
                                    Emails
                                </TableHeaderTemplate>
                                <Columns>
                                    <asp:TemplateColumn HeaderText="Subject">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Subject") %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="imgEmailEdit" ImageUrl='<%# Jenzabar.Workflow.Helpers.WorkflowHelper.GetImageIconUrl("edit.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EmailID") %>' OnClick="imgEmailEdit_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="imgEmailDelete" ImageUrl='<%# Jenzabar.Workflow.Helpers.WorkflowHelper.GetImageIconUrl("delete.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "EmailID") %>' OnClick="imgEmailDelete_Click"/>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </cc1:GroupedGrid>
                            <uc1:EmailBuilder runat="server" id="EmailBuilder" Visible="false" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="plhProcedures">
                <div id="tabs-5">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                        <ContentTemplate>
                            <cc1:Hint runat="server" ID="hntProc">
                                Stored procedures will be executed on the selected event for this stage. Your procedures must only accept the parameters "DocumentID" and "ApproverID". No other values will be passed.
                            </cc1:Hint>
                            <asp:HiddenField runat="server" ID="hdnProcID" />
                            <table>
                                <tr>
                                    <th>Name</th>
                                    <th>Database</th>
                                    <th>Event</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td><asp:TextBox runat="server" ID="tbxProcName"></asp:TextBox></td>
                                    <td><asp:DropDownList runat="server" ID="ddlDatabase"></asp:DropDownList></td>
                                    <td><asp:DropDownList runat="server" ID="drpEvents"></asp:DropDownList></td>
                                    <td><asp:Button runat="server" ID="btnSaveProc" Text="Save" OnClick="btnSaveProc_Click" /></td>
                                </tr>
                            </table>
                            <cc1:GroupedGrid runat="server" ID="grdProcedures" DataKeyField="ProcedureID" RenderGroupHeaders="true" ShowHeader="true">
                                <EmptyTableTemplate>
                                    There are no procedures in this stage.
                                </EmptyTableTemplate>
                                <TableHeaderTemplate>
                                    Procedures
                                </TableHeaderTemplate>
                                <Columns>
                                    <asp:TemplateColumn HeaderText="Name">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="tbxProcName" Text='<%# DataBinder.Eval(Container.DataItem, "ProcName") %>'></asp:TextBox> 
                                        </EditItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Database">
                                        <ItemTemplate>
                                            <%# ((Jenzabar.Workflow.Entities.StoredProcedure)Container.DataItem).Database.Name %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="On Event">
                                        <ItemTemplate>
                                            <%# ((Jenzabar.Workflow.Entities.StoredProcedure)Container.DataItem).OnEvent.ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="imgProcEdit" ImageUrl='<%# Jenzabar.Workflow.Helpers.WorkflowHelper.GetImageIconUrl("edit.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ProcedureID") %>' OnClick="imgProcEdit_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="imgProcDelete" ImageUrl='<%# Jenzabar.Workflow.Helpers.WorkflowHelper.GetImageIconUrl("delete.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ProcedureID") %>' OnClick="imgProcDelete_Click"/>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </cc1:GroupedGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="plhRules">
                <div id="tabs-6">
                    <cf:RuleBuilder runat="server" id="RuleBuilder" />
                </div>
            </asp:PlaceHolder>
        </div>
        <div style="text-align:center;">
            <asp:Button ID="btnSaveStage" runat="server" OnClick="btnSaveStage_Click"
                Text="Save" OnClientClick="prepRules();JWF.saveStage();" />
            <asp:Button ID="btnCancelStageEdit" runat="server" 
                onclick="btnCancelStageEdit_Click" Text="Cancel" />
        </div>
    </asp:Panel>
    </asp:Panel>
    <cf:LSRView ID="LSRView1" runat="server" Visible="False"/>
    <cf:DatabaseBuilder ID="DatabaseBuilder1" runat="server" Visible="False" />
    <cf:DynApproverBldr runat="server" ID="DynamicApproverBuilder" Visible="False" />
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApprovalTrackControl.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Controls.ApprovalTrackControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<style type="text/css">
    #ROApprovalTrackControl
    {
        background-color: #FFF;
        width: 800px;
        overflow: hidden;
    }
    
    #ROApprovalTrackControl > div:first-child
    {
        margin: 20px 10px 20px 10px;
    }
    
    #ROApprovalTrackControlHeader
    {
        margin-bottom: 15px;
    }
    
    #ROApprovalTrackControlGrid
    {   
    }
    
    #ROApprovalTrackControlError
    {
        margin-top: 10px;
        text-align: center;
    }
    
    #ROApprovalTrackControlFooter
    {
        text-align: center;
        margin-top: 10px;
        padding: 10px;
    }
</style>

<div id="ROApprovalTrackControl">
    <asp:UpdatePanel ID="upResult" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="gvApprovalTracks" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlApprovalTrackControl" runat="server">
        
                        <div id="ROApprovalTrackControlHeader" class="ROInformativeText">Track Name: <%# (ApprovalTracks != null && ApprovalTracks.Count > 0) ? ApprovalTracks[0].TrackDescription : "" %></div>
                        <div id="ROApprovalTrackControlGrid">
                            <asp:GridView ID="gvApprovalTracks" runat="server" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="ROGridView" 
                                HeaderStyle-CssClass="ROGridViewHeader" AlternatingRowStyle-CssClass="alt" OnRowDataBound="gvApprovalTracks_RowDataBound">
                                <Columns>
                                    <asp:BoundField HeaderText="Approval Order" DataField="SeqNumPlace" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />                  
                                    <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApprover" runat="server" Text='<%# Eval("ApproverNames") %>' Visible="false" />
                                            <asp:ImageButton CssClass="ROFloatLeft ROMarginRight" ImageUrl='<%# GetEmailIcon()%>'
                                                CommandArgument='<%# Eval("SeqNum") %>' CommandName="EmailApprover" OnCommand="gvApprovalTracks_Command"
                                                runat="server" />
                                            <asp:LinkButton ID="lbEmailApprover" runat="server" Text='<%# Eval("ApproverNames") %>'
                                                CommandArgument='<%# Eval("SeqNum") %>' CommandName="EmailApprover"
                                                OnCommand="gvApprovalTracks_Command" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Approves if Over" DataField="ApproverLimit" DataFormatString="{0:C2}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField HeaderText="Approval Status" DataField="StatusLong" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField HeaderText="Review Date" DataField="Date" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                                </Columns>
                            </asp:GridView>
                        </div>
            </asp:Panel>
            <asp:Panel ID="pnlApprovalTrackControlError" runat="server" Visible="false">
                <div id="ROApprovalTrackControlError">There are no reviewers on this approval track.</div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="ROApprovalTrackControlFooter">
        <asp:Button ID="btnClose" runat="server" Text="Close" />
    </div>
</div>

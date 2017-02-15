<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PDFReport_View.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.PDFReportsPortlet.PDFReport_View" %>
<div class="pSection">
    <div class="hint">Your report has been generated. To view your report, click the below link.</div>
    <div><asp:HyperLink id="lnkCustomReport" Runat="server" Enabled="True" Visible="True"></asp:HyperLink></div>
    <asp:Panel runat="server" ID="pnlSubscription">
        <span>Email me a copy of this report </span>
         <asp:DropDownList runat="server" id="drpFrequency" OnSelectedIndexChanged="drpFrequency_OnSelectedIndexChanged" AutoPostBack="True">
            <Items>
                <asp:ListItem Value=""></asp:ListItem>
                <asp:ListItem Value="0">Daily</asp:ListItem>
                <asp:ListItem Value="1">Weekly</asp:ListItem>
                <asp:ListItem Value="2">Monthly</asp:ListItem>
            </Items>
         </asp:DropDownList>
        <asp:DropDownList runat="server" ID="drpWeekly" Visible="False" OnSelectedIndexChanged="drpWeekly_OnSelectedIndexChanged" AutoPostBack="True">
            <Items>
                <asp:ListItem Value="1">On Sunday</asp:ListItem>
                <asp:ListItem Value="2">On Monday</asp:ListItem>
                <asp:ListItem Value="3">On Tuesday</asp:ListItem>
                <asp:ListItem Value="4">On Wednesday</asp:ListItem>
                <asp:ListItem Value="5">On Thursday</asp:ListItem>
                <asp:ListItem Value="6">On Friday</asp:ListItem>
                <asp:ListItem Value="7">On Saturday</asp:ListItem>
            </Items>
        </asp:DropDownList>
        <asp:DropDownList runat="server" ID="drpMonthly" Visible="False" OnSelectedIndexChanged="drpMonthly_OnSelectedIndexChanged" AutoPostBack="True">
            <Items>
                <asp:ListItem Value="1">On the 1st</asp:ListItem>
                <asp:ListItem Value="2">On the 2nd</asp:ListItem>
                <asp:ListItem Value="3">On the 3rd</asp:ListItem>
                <asp:ListItem Value="4">On the 4th</asp:ListItem>
                <asp:ListItem Value="5">On the 5th</asp:ListItem>
                <asp:ListItem Value="6">On the 6th</asp:ListItem>
                <asp:ListItem Value="7">On the 7th</asp:ListItem>
                <asp:ListItem Value="8">On the 8th</asp:ListItem>
                <asp:ListItem Value="9">On the 9th</asp:ListItem>
                <asp:ListItem Value="10">On the 10th</asp:ListItem>
                <asp:ListItem Value="11">On the 11th</asp:ListItem>
                <asp:ListItem Value="12">On the 12th</asp:ListItem>
                <asp:ListItem Value="13">On the 13th</asp:ListItem>
                <asp:ListItem Value="14">On the 14th</asp:ListItem>
                <asp:ListItem Value="15">On the 15th</asp:ListItem>
                <asp:ListItem Value="16">On the 16th</asp:ListItem>
                <asp:ListItem Value="17">On the 17th</asp:ListItem>
                <asp:ListItem Value="18">On the 18th</asp:ListItem>
                <asp:ListItem Value="19">On the 19th</asp:ListItem>
                <asp:ListItem Value="20">On the 20th</asp:ListItem>
                <asp:ListItem Value="21">On the 21st</asp:ListItem>
                <asp:ListItem Value="22">On the 22nd</asp:ListItem>
                <asp:ListItem Value="23">On the 23rd</asp:ListItem>
                <asp:ListItem Value="24">On the 24th</asp:ListItem>
                <asp:ListItem Value="25">On the 25th</asp:ListItem>
                <asp:ListItem Value="26">On the 26th</asp:ListItem>
                <asp:ListItem Value="27">On the 27th</asp:ListItem>
                <asp:ListItem Value="28">On the 28th</asp:ListItem>
            </Items>
        </asp:DropDownList>
    </asp:Panel>
</div>


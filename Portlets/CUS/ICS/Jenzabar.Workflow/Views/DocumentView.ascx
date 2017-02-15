<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentView.ascx.cs" Inherits="Jenzabar.Workflow.Views.DocumentView" %>
<%@ Register Assembly="Jenzabar.CFWFCommon" Namespace="Jenzabar.ContainedForm.Controls"
    TagPrefix="cf" %>
<script>
    jQuery(document).ready(function () {
        jQuery('#itemTabs').tabs();
    });
</script>
<style>
    #itemTabs label {
        width:150px;
        display:inline-block;
    }
    #itemTabs ul li span {
        width:150px;
        display:inline-block;
    }
    .queryDoc{
        display:none;
    }
</style>
<script>
    $(document).ready(function () { typeChange(); });
    function typeChange() {
        if(jQuery('[id*=drpDocType]').val() == "query")
        {
            jQuery('.queryDoc').show();
        }
        else
        {
            jQuery('.queryDoc').hide();
        }
    }
</script>
<div class="pSection">
    <div id="itemTabs">
	        <ul>
		        <li><a href='<%= jQueryURL + "#tabs-1" %>'>Definition</a></li>
	        </ul>
	        <div id="tabs-1">
                <ul>
                    <li><label>Document Name:</label><span><asp:TextBox runat="server" ID="tbxDocName" /></span></li>
                    <li><label>Description:</label><span><asp:TextBox runat="server" ID="tbxDescription" /></span></li>
                    <li><label>Start Date:</label><span><cf:JSDatePicker runat="server" ID="dpStartDate"></cf:JSDatePicker></span></li>
                    <li><label>End Date:</label><span><cf:JSDatePicker runat="server" ID="dpEndDate"></cf:JSDatePicker></span></li>
                    <li><label>Assigned Track:</label><span><asp:DropDownList runat="server" ID="drpAssignTrack"></asp:DropDownList></span></li>
                    <li><label>Type:</label><span><asp:DropDownList runat="server" ID="drpDocType" onchange="typeChange();">
                                                <asp:ListItem Value="upload" Text="Upload Document"></asp:ListItem>
                                                <asp:ListItem Value="query" Text="Document Based on Query"></asp:ListItem>
                                            </asp:DropDownList></span></li>
                    <li class="queryDoc">
                        <label>Database:</label><asp:DropDownList runat="server" ID="drpDatabase"></asp:DropDownList>
                    </li>
                    <li class="queryDoc">
                        <label>Query:</label><br />
                        <asp:TextBox runat="server" ID="tbxQuery" TextMode="MultiLine" style="width:90%;height:150px;"></asp:TextBox>
                    </li>
                </ul>
                <center>
                    <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
                </center>
            </div>
    </div>
</div>
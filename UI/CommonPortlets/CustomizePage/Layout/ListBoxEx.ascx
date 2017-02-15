<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ListBoxEx.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ListBoxEx" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div align=center>
<div><asp:listbox id=listBox Runat="server" SelectionMode="Multiple"></asp:ListBox></DIV>
<div noWrap>
<input type="image" runat="server" id=imgUp name="imgUp">
&nbsp; 
<input type="image" runat="server" id="imgDown" name="imgDown">
</DIV>
</DIV>

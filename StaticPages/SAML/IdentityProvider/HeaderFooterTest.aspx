<%@ Page Language="C#" %>
<%@ Register TagPrefix="jics" TagName="CustomSamlHeader" Src="~/ClientConfig/Controls/CustomSamlHeader.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomSamlFooter" Src="~/ClientConfig/Controls/CustomSamlFooter.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Header Test</title>
	<link rel="stylesheet" type="text/css" href="../../../UI/Common/Styles/siteStyle.css" />
</head>
<body>
	<jics:CustomSamlHeader id="customSamlHeader" runat="server" />
	<div class="pSection">
		Page content would normally be seen here.
	</div>
	<jics:CustomSamlFooter id="customSamlFooter" runat="server" />
</body>
</html>
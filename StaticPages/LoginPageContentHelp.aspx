<%@ Page language="c#" Codebehind="LoginPageContentHelp.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.StaticPages.LoginPageContentHelp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>Login Page Content Help</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  </head>
  <body MS_POSITIONING="GridLayout">
	
    <form id="Form1" method="post" runat="server">
		<h3 align="center">What can go in the Content for a Login Page?</h3>
		<ul>
			<li>
				Content should contain an html snippet.
			</li>
			<li>
				The &lt;FORM&gt; tag is not allowed.
			</li>
			<li>
				The user's response to any input fields in the html will be stored.
			</li>
		</ul>
		<h4>Example 1, HTML with no Input tags</h4>
		<pre>
	&lt;b&gt;Classes Cancelled&lt;/b&gt;
	&lt;br&gt;
	There will be no classes today because of snow storms.
		</pre>
		
		<h4>Example 2, HTML with Input tags</h4>
		<pre>
	&lt;b&gt;Survey&lt;/b&gt;
	&lt;br&gt;
	Who's your favorite professor?
	&lt;input type=&quot;text&quot; name=&quot;favProf&quot;&gt;&lt;/input&gt;
		</pre>

     </form>
	
  </body>
</html>

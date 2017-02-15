<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSSExamples.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.CSSExamples.CSSExamples" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.ICS.Web.Portlets.LoginPortlet" Assembly="Portlet.Login" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~/UI/Controls/Head.ascx" %>
<%@ Register TagPrefix="jics" TagName="ThemeHead" Src="~/UI/Controls/ThemeHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomHead" Src="~/ClientConfig/Controls/CustomHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomBody" Src="~/ClientConfig/Controls/CustomBody.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JICS CSS Examples</title>
    <asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
    <jics:Head id="head" runat="server" />
    <jics:CustomHead id="customHead" runat="server" />
    <jics:ThemeHead id="themeHead" runat="server" />
    <style type="text/css" media="all" id="printStyleSheet" visible="false" runat="server">@import url( UI/Common/Styles/print.css );</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="pSection">
            <a href="StaticPages/DeveloperTools.aspx">Back to Developer Tools</a>    
            <h3>JICS CSS Examples</h3>
            <p>HTML is shown as part of the example for simpler cases, but separated for more complex ones.</p>
            <ul>
                <li><a href="StaticPages/CSSExamples/CSSExamples.aspx#HEADERS">Headers</a></li>
                <li><a href="StaticPages/CSSExamples/CSSExamples.aspx#CONTENT">Content</a></li>
                <li><a href="StaticPages/CSSExamples/CSSExamples.aspx#TD">Tabular Data</a></li>
            </ul>
        </div>
        <a name="HEADERS"></a>
        <h4>Headers</h4>
        <div class="pSection">
            <h3>&lt;h3&gt;Header&lt;/h3&gt;</h3>
            <h4>&lt;h4&gt;Header&lt;/h4&gt;</h4>
            <h4 class="textOnly">&lt;h4 class="textOnly"&gt;Header&lt;/h4&gt;</h4>
            <h5>&lt;h5&gt;Header&lt;/h5&gt;</h5>
            <h6>&lt;h6&gt;Header&lt;/h6&gt;</h6>
        </div> 
        <a name="CONTENT"></a>
        <h4>Content</h4>
        <div class="pSection">
            <div class="hint">&lt;div class="hint"&gt;Class that adds styling to present helpful info.&lt;/div&gt;</div>
            <div class="pSection">&lt;div class="pSection"&gt;Class that adds a margin for a section in a portlet.&lt;/div&gt;</div>
            <div class="placeHolderBox">&lt;div class="placeHolderBox"&gt;<a href='#' >Class that adds a box as placeholder for media.</a>&lt;/div&gt;</div>
        </div>
        <a name="TD"></a>
        <h4>Tabular Data</h4>
        <div class="pSection">
            <h5>Example</h5>
            <fieldset>
                <table>
                    <tbody>
                        <tr>
                            <th>Some Field 1:</th>
                            <td>Info about Field 1</td>
                        </tr>
                        <tr>
                            <th>Some Field 2:</th>
                            <td>Info about Field 2</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
            <h5>HTML</h5>
            <textarea readonly="true" cols="100" rows="15" >
<fieldset>
    <table>
        <tbody>
            <tr>
                <th>Some Field 1:</th>
                <td>Info about Field 1</td>
            </tr>
            <tr>
                <th>Some Field 2:</th>
                <td>Info about Field 2</td>
            </tr>
        </tbody>
    </table>
</fieldset>
            </textarea>
        </div>
          
        <h4>Detail Action Panels</h4> 
        <div class="pSection">
        <h5>Example</h5>
          Note this will expand to fit the container it is in. (It's on a 70% width container in this example)
        <div style="width:70%;">
            <div class="detailAction">
                <div class="buttons">
                    <input type="submit" name="pg0$V$btnSaveAssignment" value="Save and Return">
                </div>
                <div class="detailActionAlert">
                    <input type="submit" name="pg0$V$btnCancel" value="Cancel" >
                </div>    
                <div class="detailActionInfo">
                    Detail Info
                </div>
                <div class="detailActionInfo detailInfoRight">
                    <a href="#">detailInfoRight</a>
                </div>
            </div>
        </div>
          <h5>Code</h5>
         
        <textarea readonly="True" cols="100" rows="15"> <div class="detailAction">
                <div class="buttons">
                    <input type="submit" name="pg0$V$btnSaveAssignment" value="Save and Return">
                </div>
                <div class="detailActionAlert">
                    <input type="submit" name="pg0$V$btnCancel" value="Cancel" >
                </div>    
                <div class="detailActionInfo">
                    Detail Info
                </div>
                <div class="detailActionInfo detailInfoRight">
                    <a href="#">detailInfoRight</a>
                </div>
            </div>
           </textarea>
        </div>
          
        <h4>Portlet Pieces</h4> 
        <div class="pSection" style="width:450px;">
            <h5>Example</h5>
            <div>
                <div class="portlet" >
                    <div class="pHead">
                        <h3>Portlet Header</h3>
                        <div><a class="help" target="blank" href="Help/Base/Custom_Content.htm" title="Get help using 'Portlet Header'"><img alt="help" src="/ICS/ui/common/images/help.gif" title="Get help using 'Portlet Header'" /></a></div>
                    </div>
                    <div class="pContent"> 
                        <div class="pSection">
                        <div class="placeHolderBox">
                        <a href='#' >Add Text.</a>
                        </div>
                        <p>Portlet Content within a Paragraph</p>
                        <p>In blandit lacinia imperdiet. Vestibulum consectetur feugiat quam porttitor placerat. Nunc nec eros sapien, sit amet consectetur felis. Duis ut enim lorem, in consequat nulla. Etiam sollicitudin, eros vel laoreet ullamcorper, turpis mauris gravida sapien, sit amet pellentesque dolor purus quis lectus. Fusce sagittis pharetra massa quis suscipit. Nam ut est orci. Phasellus condimentum venenatis interdum. Morbi mattis ligula convallis enim egestas iaculis. Nulla egestas, erat et laoreet blandit, felis ante elementum metus, nec cursus augue risus a lorem. Mauris iaculis sagittis aliquam.</p>
                        <div class="oops"><h6>H6 Error</h6>Error! Will Robinson!</div>
                        </div>
                    </div>
                    <div class="pFoot">
                    Footer.
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThemeHelpView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.Themes.ThemeHelpView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<div class="themeAdmin" >
    <div class="pSection">
        <jics:ImageAndTextButton ID="lnkBackTop" runat="server" Text="Back to Portal Design Themes" />
    </div>
    <h4><%= Globalizer.GetString("TXT_HELP") %></h4>
    <div class="pSection">
        <h5>What is a theme?</h5>
        <p>
            A theme is a way to modify the look and feel of JICS.  This is achieved with CSS, as well as the optional usage of images and JavaScript.  Themes can be shared between JICS instances via specially formatted <a href="ui/commonportlets/customizesite/themes/sample_theme.zip" target="_blank">ZIP packages</a> that can be uploaded and downloaded in Site Manager.
        </p>
        <h5>Custom.css and themes</h5>
        <p>
            The custom.css file will still always be loaded, but it will be placed prior to theme CSS.  This is a fundamental change of the usage of that file, which historically was the only option to apply custom styling.  It can now be used for styles that should applied to all themes, and most styling can instead be moved to a theme.  However, theme styles may override custom.css styles.
        </p>
        <h5>Contents of a theme</h5>
        <p>
            The single required element of a theme is a CSS file.  A specially formatted XML file is also required to allow a theme to be uploaded to JICS with a ZIP package.  Files are found by convention instead of configuration, so files should have the names given below.
        </p>
        <p>
            The following files can be part of a theme:
        </p>
        <div class="pSection">
        <dl>
            <dt><b>style.css</b> <i>(required)</i></dt>
            <dd>The main CSS file for the theme that JICS will reference.</dd>
            <dt><b>installInfo.xml</b> <i>(required for uploads)</i></dt>
            <dd>A file that contains metadata with which to install a theme package.</dd>
            <dt><b>javascript.js</b></dt>
            <dd>The main JavaScript file that JICS will reference if it is included.</dd>
            <dt><b>thumbnail.jpg</b></dt>
            <dd>A snapshot of the theme that will be shown in Site Manager when choosing themes. Preferred size is 150px by 100px, but JICS will resize if not that size. A default "no image available" image will be used if this is not included.</dd>
            <dt><b>Images</b></dt>
            <dd>Any images reference by CSS or JavaScript can be included in the ZIP package in whatever directory is desired.</dd>
            <dt><b>Other CSS and JavaScript</b></dt>
            <dd>Any files referenced by the main CSS and JavaScript files can be included in the package in the desired directory.</dd>
        </dl>
        <h5>Theme metadata</h5>
        <p>Certain metadata is required to define a theme in JICS.</p>
        <p>The two required fields are:</p>
        <dl>
            <dt><b>Name</b></dt>
            <dd>The name of the theme will dictate its location on the file server, and will be used as a unique identifier.  This name must be alphanumeric with underscores. Spaces are not allowed.</dd>
            <dt><b>DisplayName</b></dt>
            <dd>The name that administrators will see when picking themes in Site Manager.</dd>
        </dl>
        <p>When adding a theme with Site Manager, two optional fields can also be submitted:</p>
        <dl>
            <dt><b>Author</b></dt>
            <dd>The creator of the theme, shown in the Site Manager.</dd>
            <dt><b>Description</b></dt>
            <dd>Detailed information about the theme that will be shown in Site Manager.</dd>
        </dl>
        <p>When uploading a theme, the four previous fields can be defined in installInfo.xml, as well as the following:</p>
        <dl>
            <dt><b>Version</b></dt>
            <dd>Can be used to override an existing theme with a newer version.  Defaults to 1 if not provided, must be an integer.</dd>
            <dt><b>HtmlType</b></dt>
            <dd>Can define which JICS HTML layout is used. Options are "div" for a div layout or "table" for the classic table layout.  Defaults to "div" if not provided.</dd>
            <dt><b>DisableDefaultCss</b></dt>
            <dd>Toggles whether default site CSS (siteStyle.css) and layout specific CSS (divStyle.css or tableStyle.css) will be enabled for this theme.  Portlet specific CSS will always be enabled, as will custom.css.</dd>
            <dt><b>ReadMe</b></dt>
            <dd>Information about the theme. Configuration tips can be given here if the theme needs  setup or customization after installation.</dd>
        </dl>
        <h5>Adding a theme</h5>
        <p>Adding a theme from Site Manager will generate a template theme on the JICS file server that can then be modified. The UI for adding a theme dictates what the required metadata fields are. The location of the template files will be given after the theme is added.</p>
        <h5>Uploading a theme</h5>
        <p>Uploading a theme from Site Manager requires a ZIP file that must contain the files style.css and installInfo.xml at a minimum.  Theme metadata must be defined in the XML file. The upload process will validate the contents of the ZIP file.</p>
        <h5>Downloading a theme</h5>
        <p>Every theme in JICS can be downloaded from Site Manager.  The only exception is the "No Theme" look and feel, which is not actually a theme.  A downloaded theme can be modified and then uploaded back to JICS.  The version in installInfo.xml must be incremented to allow this.  A theme that ships with JICS cannot be overridden, and when downloaded the name of the theme will be prefixed with "custom."</p>
        <jics:ImageAndTextButton ID="lnkBackBottom" runat="server" Text="Back to Portal Design Themes" />
    </div>
</div>
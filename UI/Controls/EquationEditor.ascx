<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EquationEditor.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.EquationEditor" %>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>
<%@ Import Namespace="Jenzabar.ICS.Equations" %>
<link rel="stylesheet" type="text/css" href="UI/Common/Styles/EquationEditor.css" />
<script type="text/javascript" src="UI/Common/Scripts/EquationEditor.js"></script>
<!--[if IE]>
<style type="text/css">
	.text {
		zoom: 1;     /* triggers hasLayout */
	}
</style>
<![endif]-->
<script type="text/javascript">
    // init object and pass vars to it.
    var ee = new EquationEditor();
    ee.url = "<%= EquationConsts.EQUATION_IMAGE_INTERNAL_URL_FORMAT %>";
    ee.eqText = "#<%=eqText.ClientID%>";
    ee.eqImage = "#<%=equationImage.ClientID%>";
    ee.imgHeight = "#<%=imgHeight.ClientID%>";
</script>
<div id="EqEditor">
    <div id="rowHolder">
	<h2 class="header"><span style="font-weight:normal;" class="right">Choose a menu item and/or type in the text area to create your equation</span>Equation Editor</h2>
        <div class="header">
            <!--// begin top left help box //-->
			<div class="leftHelpBlock">
				<h2><span class="wedge"></span>1. Start here&hellip;</h2>
				<p>Click the item you want to add to your equation.</p>
			</div>
			<!--// end top left help box //-->
			<div class="row">
			    <ul>
			        <li id="is1">
		                <div class="iconSet img53">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />   
                        </div>
                        <div id="isp1" class="iconSetPopup">
		                    <div>
		                        <a id="+" class="img53" />
                                <a id="-" class="img54" />
                                <a id="\\pm" class="img55" />
                                <a id="\\times" class="img56"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\cdot" class="img57" />
                                <a id="/" class="img58" />
                                <a id="!" class="img67" />
                                <a id="\\sim" class="img203"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\propto" class="img204"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is2">
		                <div class="iconSet img59">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
                        </div>
                        <div id="isp2" class="iconSetPopup">
                            <div>
                                <a id="=" class="img59" />
                                <a id="\\neq" class="img60" />
                                <a id="<" class="img61" />
                                <a id="\\leq" class="img62"></a>
                            </div>
                            <div class="iconRow">
                                <a id=">" class="img63" />
                                <a id="\\geq" class="img64" />
                                <a id="\\approx" class="img65" />
                                <a id="\\equiv" class="img66"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is3">
		                <div class="iconSet img1">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp3" class="iconSetPopup">
                            <a id="x^{a}" class="img1" />
	                        <a id="x_{a}" class="img2" />
                            <a id="x_{a}^{b}" class="img3" />
                            <a id="x{_{a}}^{b}" class="img4" />
                            <a id="_{a}^{b}\\textrm{C}" class="img5"></a>
                        </div>
                    </li>
			        <li id="is4">
		                <div class="iconSet img6">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
                        </div>
                        <div id="isp4" class="iconSetPopup">
                            <a id="\\frac{a}{b}" class="img6" />
                            <a id="\\frac{a/b}{c/d}" class="img68"></a>
                        </div>
                    </li>
			        <li id="is5">
		                <div class="iconSet img22">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
                        </div>
                        <div id="isp5" class="iconSetPopup">
                            <a id="\\sqrt{x}" class="img22" />
                            <a id="\\sqrt[n]{x}" class="img23"></a>
                        </div>
                    </li>
			        <li id="is6">
		                <div class="iconSet img29">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp6" class="iconSetPopup">
                            <div>
                                <a id="\\infty" class="img29" />
                                <a id="\\pi" class="img126" />
                                <a id="\\textrm{i}" class="img160" />
                                <a id="\\textrm{e}" class="img161"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\phi" class="img132" />
                                <a id="\\textrm{h}" class="img162" />
                                <a id="\\hbar" class="img163" />
                                <a id="\\aleph" class="img164"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is7">
		                <div class="iconSet img103">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp7" class="iconSetPopup">
                            <div>
                                <a id="\\left (  \\right )" class="img103" />
                                <a id="\\left [  \\right ]" class="img104" />
                                <a id="\\left \\{  \\right \\}" class="img105" />
                                <a id="\\left \\langle  \\right \\rangle" class="img106"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\left |  \\right |" class="img107" />
                                <a id="\\left \\|  \\right \\| " class="img108" />
                                <a id="\\left \\lfloor  \\right \\rfloor " class="img109" />
                                <a id="\\left \\lceiling  \\right \\rceiling" class="img110"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is8">
		                <div class="iconSet img173">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp8" class="iconSetPopup">
                            <div>
                                <a id="\\therefore" class="img173" />
                                <a id="\\neg" class="img181" />
                                <a id="\\rightarrow" class="img175" />
                                <a id="\\leftarrow" class="img176" />
                                <a id="\\leftrightarrow" class="img177"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\Rightarrow" class="img178" />
                                <a id="\\Leftarrow" class="img179" />
                                <a id="\\Leftrightarrow" class="img180" />
                                <a id="\\mid" class="img187" />
                                <a id="\\wedge" class="img182"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\vee" class="img183" />
                                <a id="\\exists" class="img184" />
                                <a id="\\forall" class="img185"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is9" class="largeIcon">
		                <div class="iconSet img165">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp9" class="iconSetPopup largeIcons">
                            <div>
                                <a id="f(x)" class="img165" />
                                <a id="\\lim_{x \\to 0}" class="img19" />
                                <a id="\\mapsto" class="img167" />
                                <a id="\\mathbb{Z}" class="img168"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\mathbb{N}" class="img169" />
                                <a id="\\mathbb{C}" class="img170" />
                                <a id="\\mathbb{Q}" class="img171" />
                                <a id="\\mathbb{R}" class="img172"></a>
                            </div>
                        </div>
                    </li>
                    <li class="separator"></li>
                    <li class="icons">
                        <a id="text_input" class="img202"></a>
                    </li>
                    <li class="separator"></li>
                    <li class="icons">
                        <a id="\\," class="img69" />
                        <a id="\\;" class="img70" />
                        <a id="\\\\\n" class="img71"></a>
                    </li>
                </ul>
            </div>
            <div class="row">
                <ul>
			        <li id="is10">
		                <div class="iconSet img190">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp10" class="iconSetPopup">
			                <div>
                                <a id="\\in" class="img188" />
                                <a id="\\notin" class="img189" />
                                <a id="\\cap" class="img190" />
                                <a id="\\cup" class="img191"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\subset" class="img192" />
                                <a id="\\supset" class="img193" />
                                <a id="\\subseteq" class="img194" />
                                <a id="\\supseteq" class="img195"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\rightarrow" class="img175" />
                                <a id="\\emptyset" class="img196" />
                                <a id="\\left \\{  ,  \\right \\}" class="img197"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is11">
		                <div class="iconSet img20">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp11" class="iconSetPopup">
                            <a id="\\sum" class="img20" />
                            <a id="\\sum_ {a}^{b}" class="img21" ></a>
                        </div>
                    </li>
			        <li id="is12">
		                <div class="iconSet img10">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp12" class="iconSetPopup">
                            <div>
                                <a id="\\int" class="img10" />
                                <a id="\\int_{a}^{b}" class="img11" />
                                <a id="\\oint" class="img12" />
                                <a id="\\oint_{a}^{b}" class="img13" />
                                <a id="\\iint_{a}^{b}" class="img14"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\nabla" class="img198" />
                                <a id="\\partial" class="img199" />
                                <a id="\\delta" class="img200" />
                                <a id="\\frac{\\partial}{\\partial}" class="img201"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is13">
		                <div class="iconSet img126">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp13" class="iconSetPopup">
                            <div>
                                <a id="\\alpha" class="img111" />
                                <a id="\\beta" class="img112" />
                                <a id="\\gamma" class="img113" />
                                <a id="\\delta" class="img114" />
                                <a id="\\epsilon" class="img115"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\zeta" class="img116" />
                                <a id="\\eta" class="img117" />
                                <a id="\\theta" class="img118" />
                                <a id="\\iota" class="img119" />
                                <a id="\\kappa" class="img120"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\lambda" class="img121" />
                                <a id="\\mu" class="img122" />
                                <a id="\\nu" class="img123" />
                                <a id="\\xi" class="img124" />
                                <a id="\\textrm{o}" class="img125"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\pi" class="img126" />
                                <a id="\\rho" class="img127" />
                                <a id="\\varsigma" class="img128" />
                                <a id="\\sigma" class="img129" />
                                <a id="\\tau" class="img130"></a>
                            </div>
                            <div class="iconRow">                                
                                <a id="\\upsilon" class="img131" />
                                <a id="\\phi" class="img132" />
                                <a id="\\chi" class="img133" />
                                <a id="\\psi" class="img134" />
                                <a id="\\omega" class="img135"></a>
                            </div>
                            <div class="iconRow">                               
                                <a id="\\textrm{A}" class="img136" />
                                <a id="\\textrm{B}" class="img137" />
                                <a id="\\Gamma" class="img138" />
                                <a id="\\Delta" class="img139" />
                                <a id="\\textrm{E}" class="img140"></a>
                            </div>
                            <div class="iconRow">    
                                <a id="\\textrm{Z}" class="img141" />
                                <a id="\\textrm{H}" class="img142" />
                                <a id="\\Theta" class="img143" />
                                <a id="\\textrm{I}" class="img144" />
                                <a id="\\textrm{K}" class="img145"></a>
                            </div>
                            <div class="iconRow">                                
                                <a id="\\Lambda" class="img146" />
                                <a id="\\textrm{M}" class="img147" />
                                <a id="\\textrm{N}" class="img148" />
                                <a id="\\Xi" class="img149" />
                                <a id="\\textrm{O}" class="img150"></a>
                            </div>
                            <div class="iconRow">                                
                                <a id="\\Pi" class="img151" />
                                <a id="\\textrm{P}" class="img152" />
                                <a id="\\Sigma" class="img153" />
                                <a id="\\textrm{T}" class="img154" />
                                <a id="\\Upsilon" class="img155"></a>
                            </div>
                            <div class="iconRow">                                
                                <a id="\\Phi" class="img156" />
                                <a id="\\textrm{X}" class="img157" />
                                <a id="\\Psi" class="img158" />
                                <a id="\\Omega" class="img159"></a>
                            </div>
                        </div>
                    </li>
			        <li id="is14">
		                <div class="iconSet img75">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp14" class="iconSetPopup">
			                <div>
                                <a id="\\exp" class="img72" />
                                <a id="\\lg" class="img73" />
                                <a id="\\ln" class="img74"></a>
                            </div>  
                            <div class="iconRow">
                                <a id="\\log" class="img75" />
                                <a id="\\log_{e}" class="img76" />
                                <a id="\\log_{10}" class="img77"></a>
                            </div>     
                        </div>
                    </li>
			        <li id="is15">
		                <div class="iconSet img78">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp15" class="iconSetPopup largeIcons">
                            <div>
                                <a id="\\sin" class="img78" />
                                <a id="\\sinh" class="img79" />
                                <a id="\\sin^{-1}" class="img80"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\cos" class="img81" />
                                <a id="\\cosh" class="img82" />
                                <a id="\\cos^{-1}" class="img83"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\tan" class="img84" />
                                <a id="\\tanh" class="img85" />
                                <a id="\\tan^{-1}" class="img86"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\csc" class="img87" />
                                <a id="\\coth" class="img88" />
                                <a id="\\sinh^{-1}" class="img89"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\sec" class="img90" />
                                <a id="\\arcsin" class="img91" />
                                <a id="\\cosh^{-1}" class="img92"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\cot" class="img93" />
                                <a id="\\arccos" class="img94" />
                                <a id="\\tanh^{-1}" class="img95"></a>
                            </div>
                            <div class="iconRow"> 
                                <a id="\\theta" class="img205" />
                                <a id="\\arctan" class="img96" />                          
                                <a id="90^{\\circ}" class="img206"></a>
                            </div> 
                        </div>
                    </li>
			        <li id="is16">
		                <div class="iconSet img24">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp16" class="iconSetPopup">
                            <a id="\\prod" class="img24" />
                            <a id="\\prod_{a}^{b}" class="img25" />
                            <a id="\\coprod" class="img26" />
                            <a id="\\coprod_{a}^{b}" class="img27"></a>                                
                        </div>
                    </li>
			        <li id="is17" class="largeIcon">
		                <div class="iconSet largeIcon img99">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp17" class="iconSetPopup largeIcons">
                            <div> 
                                <a id="\\begin{matrix}\n{0}\\end{matrix}\n" class="img97" />
                                <a id="\\begin{pmatrix}\n{0}\\end{pmatrix}\n" class="img98" />
                                <a id="\\begin{bmatrix}\n{0}\\end{bmatrix}\n" class="img99"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\begin{Bmatrix}\n{0}\\end{Bmatrix}\n" class="img100" />
                                <a id="\\begin{vmatrix}\n{0}\\end{vmatrix}\n" class="img101" />
                                <a id="\\begin{Vmatrix}\n{0}\\end{Vmatrix}\n" class="img102"></a>
                            </div>      
                        </div>
                    </li>
			        <li id="is18">
		                <div class="iconSet img31">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
			            <div id="isp18" class="iconSetPopup">
                            <div> 
                                <a id="{a}\'" class="img31" />
                                <a id="{a}\'\'" class="img32" />
                                <a id="\\dot{a}" class="img33" />
                                <a id="\\ddot{a}" class="img34" />
                                <a id="\\hat{a}" class="img35"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\check{a}" class="img36" />
                                <a id="\\grave{a}" class="img37" />
                                <a id="\\acute{a}" class="img38" />  
                                <a id="\\tilde{a}" class="img39" />
                                <a id="\\breve{a}" class="img40"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\bar{a}" class="img41" />
                                <a id="\\vec{a}" class="img42" />
                                <a id="\\not{a}" class="img43" />
                                <a  id="a^{\\circ}" class="img44"></a>
                            </div>                           
                        </div>
                    </li>
			        <li id="is19">
		                <div class="iconSet img45">
		                    <img src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>wedge-down.gif" />
			            </div>
                        <div id="isp19" class="iconSetPopup">
		                    <div> 
                                <a id="\\widetilde{abc}" class="img45" />
                                <a id="\\widehat{abc}" class="img46" />
                                <a id="\\overline{abc}" class="img47" />
                                <a id="\\underline{abc}" class="img48"></a>
                            </div>
                            <div class="iconRow">
                                <a id="\\overbrace{abc}" class="img49" />
                                <a id="\\underbrace{abc}" class="img50" />
                                <a id="\\overset{a}{abc}" class="img51" />
                                <a id="\\underset{a}{abc}" class="img52"></a>
                            </div> 
                        </div>
                    </li>
                </ul>
                <select>
                    <option value="">Templates</option>
                    <option value="\begin{array}
    {|c|c||c|}a&b&S\\
    \hline 
    0&0&1\\
    0&1&1\\
    1&0&1\\
    1&1&0\\
    \end{array}">Array</option>
                    <option value="f(n)=\begin{cases}
    n/2,&\mbox{if}n\mbox{ is even}\\
    3n+1,&\mbox{if}n\mbox{ is odd}
    \end{cases}">Case distinctions</option>
			        <option value="\frac{1 + \frac{3}{4}}{x + \frac{3x}{2}}">Complex fraction</option>
                    <option value="\int\limits_{1}^{3}\frac{e^3/x}{x^2}\, dx">Integral</option>
                    <option value="\int_{(x,y)\in C}x^3\,dx+4y^2\,dy">Line integral</option>
                    <option value="\begin{align}
    f(x)&=(a+b)^2\\
    &=a^2+2ab+b^2\\
    \end{align}">Multiline equation</option>
                    <option value="\frac{-b \pm \sqrt {b^2-4ac}}{2a}">Quadratic equation</option>
                    <option value="\left \{ x \mid x > 5 \right \}">Set-builder notation</option>
                    <option value="\begin{cases}
    3x+5y+z\\
    7x-2y+4z\\
    -6x+3y+2z
    \end{cases}">Simultaneous equations</option>
                </select>
            </div>
        </div>
        <div id="bottomGroup">
            <div class="text">
                <!--// begin middle left help box //-->
				<div class="leftHelpBlock">
					<h2 class="rightText"><span class="wedge"></span>&hellip;or here</h2>
					<p>You can also just start typing in the text area. Most basic text works and this editor uses the <strong>LaTex</strong> format for advanced items.</p>    
				</div>
				<!--// end middle left help box //-->
				<!--// begin top right help box //-->
				<div id="rightHelpHolder">
				    <div class="rightHelpBlock">
					    <h2><span class="wedge"></span>2. Customize</h2>
					    <p>When you use the icons above, default values are inserted. Find them in the text area and change them to the values you need in your equation.</p>
				    </div>
				</div>
				<!--// end top right help box //-->
                <textarea id="eqText" runat="server" rows="10" cols="40"
                    onselect="ee.storeCursorPosition();"
                    onkeyup="ee.storeCursorPosition();"
                    onchange="ee.storeCursorPosition();"
                    onclick="ee.storeCursorPosition();" />
                <div id="eqchars">200 characters left</div>
            </div>
            <div class="rightHolder">
                <div class="equation">
		            <!--// begin bottom right help box //-->
		            <div class="rightHelpBlock">
			            <h2><span class="wedge"></span>3. Preview</h2>
			            <p>Your equation will appear here and it is updated automatically each time you make a change.</p>
		            </div>
		            <!--// end bottom right help box //-->
                    <img id="equationImage" class="equationImage" runat="server" />
                </div>
		    </div>
            <div class="bottomBar">
		        <!--// begin bottom left help box //-->
		        <div class="leftHelpBlock" id="bottomLeftHelp">
			        <p>When you are finished, save here.</p>
			        <h2><span class="wedge"></span>4. Save</h2>
		        </div>
		        <!--// end bottom left help box //-->
		        <div class="buttonBar">
        		    <div>
		                Size:
		                <select id="imgHeight" runat="server">
		                    <option value="25">25</option>
		                    <option selected="selected" value="50">50</option>
		                    <option value="75">75</option>
		                    <option value="100">100</option>
		                    <option value="150">150</option>
		                    <option value="200">200</option>
			            </select>
			        </div>
			        <div class="buttons">
		                <asp:Button ID="btnSave" runat="server" Text="Save your equation" />
		                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
		            </div>
		            <div>       
		                <a href="#" id="helpLink" class="imageAndText">
		                    <img alt="Help" src="<%= ResolveUrl(ConfigSettings.Current.Location.PortletIconImagesPath) %>icon-help.gif">
		                    <span id="helpText">Show help text</span>
		                </a>
		            </div>
		        </div>
            </div>
        </div>       
    </div>
</div>

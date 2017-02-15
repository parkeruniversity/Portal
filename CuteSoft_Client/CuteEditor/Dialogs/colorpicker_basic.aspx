<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<script runat="server">
string GetDialogQueryString;
override protected void OnInit(EventArgs args)
{
	if(Context.Request.QueryString["Dialog"]=="Standard")
	{	
	if(Context.Request.QueryString["IsFrame"]==null)
	{
		string FrameSrc="colorpicker_basic.aspx?IsFrame=1&"+Request.ServerVariables["QUERY_STRING"];
		CuteEditor.CEU.WriteDialogOuterFrame(Context,"[[MoreColors]]",FrameSrc);
		Context.Response.End();
	}
	}
	string s="";
	if(Context.Request.QueryString["Dialog"]=="Standard")	
		s="&Dialog=Standard";
	
	GetDialogQueryString="Theme="+Context.Request.QueryString["Theme"]+s;	
	base.OnInit(args);
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<script type="text/javascript" src="Load.ashx?type=dialogscript&verfix=1006&file=DialogHead.js"></script>
		<script type="text/javascript" src="Load.ashx?type=dialogscript&verfix=1006&file=Dialog_ColorPicker.js"></script>
		<link href='Load.ashx?type=themecss&file=dialog.css&theme=[[_Theme_]]' type="text/css"
			rel="stylesheet" />
		<style type="text/css">
			.colorcell
			{
				width:16px;
				height:17px;
				cursor:hand;
			}
			.colordiv,.customdiv
			{
				border:solid 1px #808080;
				width:16px;
				height:17px;
				font-size:1px;
			}
			#ajaxdiv{padding:10px;margin:0;text-align:center; background:#eeeeee;}
		</style>
		<title>[[NamedColors]]</title>
		<script>
								
		var OxO734f=["Green","#008000","Lime","#00FF00","Teal","#008080","Aqua","#00FFFF","Navy","#000080","Blue","#0000FF","Purple","#800080","Fuchsia","#FF00FF","Maroon","#800000","Red","#FF0000","Olive","#808000","Yellow","#FFFF00","White","#FFFFFF","Silver","#C0C0C0","Gray","#808080","Black","#000000","DarkOliveGreen","#556B2F","DarkGreen","#006400","DarkSlateGray","#2F4F4F","SlateGray","#708090","DarkBlue","#00008B","MidnightBlue","#191970","Indigo","#4B0082","DarkMagenta","#8B008B","Brown","#A52A2A","DarkRed","#8B0000","Sienna","#A0522D","SaddleBrown","#8B4513","DarkGoldenrod","#B8860B","Beige","#F5F5DC","HoneyDew","#F0FFF0","DimGray","#696969","OliveDrab","#6B8E23","ForestGreen","#228B22","DarkCyan","#008B8B","LightSlateGray","#778899","MediumBlue","#0000CD","DarkSlateBlue","#483D8B","DarkViolet","#9400D3","MediumVioletRed","#C71585","IndianRed","#CD5C5C","Firebrick","#B22222","Chocolate","#D2691E","Peru","#CD853F","Goldenrod","#DAA520","LightGoldenrodYellow","#FAFAD2","MintCream","#F5FFFA","DarkGray","#A9A9A9","YellowGreen","#9ACD32","SeaGreen","#2E8B57","CadetBlue","#5F9EA0","SteelBlue","#4682B4","RoyalBlue","#4169E1","BlueViolet","#8A2BE2","DarkOrchid","#9932CC","DeepPink","#FF1493","RosyBrown","#BC8F8F","Crimson","#DC143C","DarkOrange","#FF8C00","BurlyWood","#DEB887","DarkKhaki","#BDB76B","LightYellow","#FFFFE0","Azure","#F0FFFF","LightGray","#D3D3D3","LawnGreen","#7CFC00","MediumSeaGreen","#3CB371","LightSeaGreen","#20B2AA","DeepSkyBlue","#00BFFF","DodgerBlue","#1E90FF","SlateBlue","#6A5ACD","MediumOrchid","#BA55D3","PaleVioletRed","#DB7093","Salmon","#FA8072","OrangeRed","#FF4500","SandyBrown","#F4A460","Tan","#D2B48C","Gold","#FFD700","Ivory","#FFFFF0","GhostWhite","#F8F8FF","Gainsboro","#DCDCDC","Chartreuse","#7FFF00","LimeGreen","#32CD32","MediumAquamarine","#66CDAA","DarkTurquoise","#00CED1","CornflowerBlue","#6495ED","MediumSlateBlue","#7B68EE","Orchid","#DA70D6","HotPink","#FF69B4","LightCoral","#F08080","Tomato","#FF6347","Orange","#FFA500","Bisque","#FFE4C4","Khaki","#F0E68C","Cornsilk","#FFF8DC","Linen","#FAF0E6","WhiteSmoke","#F5F5F5","GreenYellow","#ADFF2F","DarkSeaGreen","#8FBC8B","Turquoise","#40E0D0","MediumTurquoise","#48D1CC","SkyBlue","#87CEEB","MediumPurple","#9370DB","Violet","#EE82EE","LightPink","#FFB6C1","DarkSalmon","#E9967A","Coral","#FF7F50","NavajoWhite","#FFDEAD","BlanchedAlmond","#FFEBCD","PaleGoldenrod","#EEE8AA","Oldlace","#FDF5E6","Seashell","#FFF5EE","PaleGreen","#98FB98","SpringGreen","#00FF7F","Aquamarine","#7FFFD4","PowderBlue","#B0E0E6","LightSkyBlue","#87CEFA","LightSteelBlue","#B0C4DE","Plum","#DDA0DD","Pink","#FFC0CB","LightSalmon","#FFA07A","Wheat","#F5DEB3","Moccasin","#FFE4B5","AntiqueWhite","#FAEBD7","LemonChiffon","#FFFACD","FloralWhite","#FFFAF0","Snow","#FFFAFA","AliceBlue","#F0F8FF","LightGreen","#90EE90","MediumSpringGreen","#00FA9A","PaleTurquoise","#AFEEEE","LightCyan","#E0FFFF","LightBlue","#ADD8E6","Lavender","#E6E6FA","Thistle","#D8BFD8","MistyRose","#FFE4E1","Peachpuff","#FFDAB9","PapayaWhip","#FFEFD5"];var colorlist=[{n:OxO734f[0],h:OxO734f[1]},{n:OxO734f[2],h:OxO734f[3]},{n:OxO734f[4],h:OxO734f[5]},{n:OxO734f[6],h:OxO734f[7]},{n:OxO734f[8],h:OxO734f[9]},{n:OxO734f[10],h:OxO734f[11]},{n:OxO734f[12],h:OxO734f[13]},{n:OxO734f[14],h:OxO734f[15]},{n:OxO734f[16],h:OxO734f[17]},{n:OxO734f[18],h:OxO734f[19]},{n:OxO734f[20],h:OxO734f[21]},{n:OxO734f[22],h:OxO734f[23]},{n:OxO734f[24],h:OxO734f[25]},{n:OxO734f[26],h:OxO734f[27]},{n:OxO734f[28],h:OxO734f[29]},{n:OxO734f[30],h:OxO734f[31]}];var colormore=[{n:OxO734f[32],h:OxO734f[33]},{n:OxO734f[34],h:OxO734f[35]},{n:OxO734f[36],h:OxO734f[37]},{n:OxO734f[38],h:OxO734f[39]},{n:OxO734f[40],h:OxO734f[41]},{n:OxO734f[42],h:OxO734f[43]},{n:OxO734f[44],h:OxO734f[45]},{n:OxO734f[46],h:OxO734f[47]},{n:OxO734f[48],h:OxO734f[49]},{n:OxO734f[50],h:OxO734f[51]},{n:OxO734f[52],h:OxO734f[53]},{n:OxO734f[54],h:OxO734f[55]},{n:OxO734f[56],h:OxO734f[57]},{n:OxO734f[58],h:OxO734f[59]},{n:OxO734f[60],h:OxO734f[61]},{n:OxO734f[62],h:OxO734f[63]},{n:OxO734f[64],h:OxO734f[65]},{n:OxO734f[66],h:OxO734f[67]},{n:OxO734f[68],h:OxO734f[69]},{n:OxO734f[70],h:OxO734f[71]},{n:OxO734f[72],h:OxO734f[73]},{n:OxO734f[74],h:OxO734f[75]},{n:OxO734f[76],h:OxO734f[77]},{n:OxO734f[78],h:OxO734f[79]},{n:OxO734f[80],h:OxO734f[81]},{n:OxO734f[82],h:OxO734f[83]},{n:OxO734f[84],h:OxO734f[85]},{n:OxO734f[86],h:OxO734f[87]},{n:OxO734f[88],h:OxO734f[89]},{n:OxO734f[90],h:OxO734f[91]},{n:OxO734f[92],h:OxO734f[93]},{n:OxO734f[94],h:OxO734f[95]},{n:OxO734f[96],h:OxO734f[97]},{n:OxO734f[98],h:OxO734f[99]},{n:OxO734f[100],h:OxO734f[101]},{n:OxO734f[102],h:OxO734f[103]},{n:OxO734f[104],h:OxO734f[105]},{n:OxO734f[106],h:OxO734f[107]},{n:OxO734f[108],h:OxO734f[109]},{n:OxO734f[110],h:OxO734f[111]},{n:OxO734f[112],h:OxO734f[113]},{n:OxO734f[114],h:OxO734f[115]},{n:OxO734f[116],h:OxO734f[117]},{n:OxO734f[118],h:OxO734f[119]},{n:OxO734f[120],h:OxO734f[121]},{n:OxO734f[122],h:OxO734f[123]},{n:OxO734f[124],h:OxO734f[125]},{n:OxO734f[126],h:OxO734f[127]},{n:OxO734f[128],h:OxO734f[129]},{n:OxO734f[130],h:OxO734f[131]},{n:OxO734f[132],h:OxO734f[133]},{n:OxO734f[134],h:OxO734f[135]},{n:OxO734f[136],h:OxO734f[137]},{n:OxO734f[138],h:OxO734f[139]},{n:OxO734f[140],h:OxO734f[141]},{n:OxO734f[142],h:OxO734f[143]},{n:OxO734f[144],h:OxO734f[145]},{n:OxO734f[146],h:OxO734f[147]},{n:OxO734f[148],h:OxO734f[149]},{n:OxO734f[150],h:OxO734f[151]},{n:OxO734f[152],h:OxO734f[153]},{n:OxO734f[154],h:OxO734f[155]},{n:OxO734f[156],h:OxO734f[157]},{n:OxO734f[158],h:OxO734f[159]},{n:OxO734f[160],h:OxO734f[161]},{n:OxO734f[162],h:OxO734f[163]},{n:OxO734f[164],h:OxO734f[165]},{n:OxO734f[166],h:OxO734f[167]},{n:OxO734f[168],h:OxO734f[169]},{n:OxO734f[170],h:OxO734f[171]},{n:OxO734f[172],h:OxO734f[173]},{n:OxO734f[174],h:OxO734f[175]},{n:OxO734f[176],h:OxO734f[177]},{n:OxO734f[178],h:OxO734f[179]},{n:OxO734f[180],h:OxO734f[181]},{n:OxO734f[182],h:OxO734f[183]},{n:OxO734f[184],h:OxO734f[185]},{n:OxO734f[186],h:OxO734f[187]},{n:OxO734f[188],h:OxO734f[189]},{n:OxO734f[190],h:OxO734f[191]},{n:OxO734f[192],h:OxO734f[193]},{n:OxO734f[194],h:OxO734f[195]},{n:OxO734f[196],h:OxO734f[197]},{n:OxO734f[198],h:OxO734f[199]},{n:OxO734f[200],h:OxO734f[201]},{n:OxO734f[202],h:OxO734f[203]},{n:OxO734f[204],h:OxO734f[205]},{n:OxO734f[206],h:OxO734f[207]},{n:OxO734f[208],h:OxO734f[209]},{n:OxO734f[210],h:OxO734f[211]},{n:OxO734f[212],h:OxO734f[213]},{n:OxO734f[214],h:OxO734f[215]},{n:OxO734f[216],h:OxO734f[217]},{n:OxO734f[218],h:OxO734f[219]},{n:OxO734f[220],h:OxO734f[221]},{n:OxO734f[156],h:OxO734f[157]},{n:OxO734f[222],h:OxO734f[223]},{n:OxO734f[224],h:OxO734f[225]},{n:OxO734f[226],h:OxO734f[227]},{n:OxO734f[228],h:OxO734f[229]},{n:OxO734f[230],h:OxO734f[231]},{n:OxO734f[232],h:OxO734f[233]},{n:OxO734f[234],h:OxO734f[235]},{n:OxO734f[236],h:OxO734f[237]},{n:OxO734f[238],h:OxO734f[239]},{n:OxO734f[240],h:OxO734f[241]},{n:OxO734f[242],h:OxO734f[243]},{n:OxO734f[244],h:OxO734f[245]},{n:OxO734f[246],h:OxO734f[247]},{n:OxO734f[248],h:OxO734f[249]},{n:OxO734f[250],h:OxO734f[251]},{n:OxO734f[252],h:OxO734f[253]},{n:OxO734f[254],h:OxO734f[255]},{n:OxO734f[256],h:OxO734f[257]},{n:OxO734f[258],h:OxO734f[259]},{n:OxO734f[260],h:OxO734f[261]},{n:OxO734f[262],h:OxO734f[263]},{n:OxO734f[264],h:OxO734f[265]},{n:OxO734f[266],h:OxO734f[267]},{n:OxO734f[268],h:OxO734f[269]},{n:OxO734f[270],h:OxO734f[271]},{n:OxO734f[272],h:OxO734f[273]}];
		
		</script>
	</head>
	<body>
		<div id="ajaxdiv">
			<div class="tab-pane-control tab-pane" id="tabPane1">
				<div class="tab-row">
					<h2 class="tab">
						<a tabindex="-1" href='colorpicker.aspx?<%=GetDialogQueryString%>'>
							<span style="white-space:nowrap;">
								[[WebPalette]]
							</span>
						</a>
					</h2>
					<h2 class="tab selected">
							<a tabindex="-1" href='colorpicker_basic.aspx?<%=GetDialogQueryString%>'>
								<span style="white-space:nowrap;">
									[[NamedColors]]
								</span>
							</a>
					</h2>
					<h2 class="tab">
							<a tabindex="-1" href='colorpicker_more.aspx?<%=GetDialogQueryString%>'>
								<span style="white-space:nowrap;">
									[[CustomColor]]
								</span>
							</a>
					</h2>
				</div>
				<div class="tab-page">			
					<table class="colortable" align="center">
						<tr>
							<td colspan="16" height="16"><p align="left">Basic:
								</p>
							</td>
						</tr>
						<tr>
							<script>
								var OxOe25f=["length","\x3Ctd class=\x27colorcell\x27\x3E\x3Cdiv class=\x27colordiv\x27 style=\x27background-color:","\x27 title=\x27"," ","\x27 cname=\x27","\x27 cvalue=\x27","\x27\x3E\x3C/div\x3E\x3C/td\x3E",""];var arr=[];for(var i=0;i<colorlist[OxOe25f[0]];i++){arr.push(OxOe25f[1]);arr.push(colorlist[i].n);arr.push(OxOe25f[2]);arr.push(colorlist[i].n);arr.push(OxOe25f[3]);arr.push(colorlist[i].h);arr.push(OxOe25f[4]);arr.push(colorlist[i].n);arr.push(OxOe25f[5]);arr.push(colorlist[i].h);arr.push(OxOe25f[6]);} ;document.write(arr.join(OxOe25f[7]));
							</script>
						</tr>
						<tr>
							<td colspan="16" height="12"><p align="left"></p>
							</td>
						</tr>
						<tr>
							<td colspan="16"><p align="left">Additional:
								</p>
							</td>
						</tr>
						<script>
							var OxO5e90=["length","\x3Ctr\x3E","\x3Ctd class=\x27colorcell\x27\x3E\x3Cdiv class=\x27colordiv\x27 style=\x27background-color:","\x27 title=\x27"," ","\x27 cname=\x27","\x27 cvalue=\x27","\x27\x3E\x3C/div\x3E\x3C/td\x3E","\x3C/tr\x3E",""];var arr=[];for(var i=0;i<colormore[OxO5e90[0]];i++){if(i%16==0){arr.push(OxO5e90[1]);} ;arr.push(OxO5e90[2]);arr.push(colormore[i].n);arr.push(OxO5e90[3]);arr.push(colormore[i].n);arr.push(OxO5e90[4]);arr.push(colormore[i].h);arr.push(OxO5e90[5]);arr.push(colormore[i].n);arr.push(OxO5e90[6]);arr.push(colormore[i].h);arr.push(OxO5e90[7]);if(i%16==15){arr.push(OxO5e90[8]);} ;} ;if(colormore%16>0){arr.push(OxO5e90[8]);} ;document.write(arr.join(OxO5e90[9]));
						</script>
						<tr>
							<td colspan="16" height="8">
							</td>
						</tr>
						<tr>
							<td colspan="16" height="12">
								<input checked id="CheckboxColorNames" style="width: 16px; height: 20px" type="checkbox">
								<span style="width: 118px;">Use color names</span>
							</td>
						</tr>
						<tr>
							<td colspan="16" height="12">
							</td>
						</tr>
						<tr>
							<td colspan="16" valign="middle" height="24">
							<span style="height:24px;width:50px;vertical-align:middle;">Color : </span>&nbsp;
							<input type="text" id="divpreview" size="7" maxlength="7" style="width:180px;height:24px;border:#a0a0a0 1px solid; Padding:4;"/>
					
							</td>
						</tr>
				</table>
			</div>
		</div>
		<div id="container-bottom">
			<input type="button" id="buttonok" value="[[OK]]" class="formbutton" style="width:70px"	onclick="do_insert();" /> 
			&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="button" id="buttoncancel" value="[[Cancel]]" class="formbutton" style="width:70px"	onclick="do_Close();" />	
		</div>
	</div>
	</body>
</html>


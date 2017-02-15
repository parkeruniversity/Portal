using System;
using Jenzabar.Common.ApplicationBlocks.ExceptionManagement;
using Jenzabar.Common.Globalization;
using Jenzabar.Portal.Framework;
using Jenzabar.Portal.Framework.Data;
using Jenzabar.Portal.Framework.Preferences;
using Jenzabar.Portal.Framework.Web;
using Jenzabar.Portal.Framework.Web.UI;
using Jenzabar.Portal.Framework.Security.Authorization;
using Jenzabar.Portal.Framework.Web.UI.Controls.MetaControls;
using Jenzabar.Portal.Framework.Web.UI.Controls.MetaControls.Attributes;
using Jenzabar.ICS.Web.Portlets.Common;
using Jenzabar.ICS.Web.Portlets.BasePortletViews;

namespace CUS.ICS.JavascriptContent
{
	#region Settings
	[TextAreaMetaControl(0, "PlainTextTop", "CUS_JSCONTENT_PLAINTEXTTOP_TXT", "CUS_JSCONTENT_PLAINTEXTTOP_DESC", false,
	@"<NameValueDataSources><NameValueDataSource Name='PlainTextTop' Value='' /></NameValueDataSources>",
	NameValueDataSourceType.Static, NameValueType.PortletSetting, "MetaControl", 75, 5, 3000, true, LengthMaximum=3000)]

	[TextBoxMetaControl(1, "JavascriptSource", "CUS_JSCONTENT_SOURCE_TXT", "CUS_JSCONTENT_SOURCE_DESC", false,
	@"<NameValueDataSources><NameValueDataSource Name='JavascriptSource' Value='' /></NameValueDataSources>",
	NameValueDataSourceType.Static, NameValueType.PortletSetting, "MetaControl", 75, 3000)]

	[TextAreaMetaControl(2, "JavascriptCode", "CUS_JSCONTENT_CODE_TXT", "CUS_JSCONTENT_CODE_DESC", false,
	@"<NameValueDataSources><NameValueDataSource Name='JavascriptCode' Value='' /></NameValueDataSources>",
	NameValueDataSourceType.Static, NameValueType.PortletSetting, "MetaControl", 75, 5, 3000, true, LengthMaximum=3000)]

	[TextAreaMetaControl(3, "PlainTextBottom", "CUS_JSCONTENT_PLAINTEXTBOTTOM_TXT", "CUS_JSCONTENT_PLAINTEXTBOTTOM_DESC", false,
	@"<NameValueDataSources><NameValueDataSource Name='PlainTextBottom' Value='' /></NameValueDataSources>",
	NameValueDataSourceType.Static, NameValueType.PortletSetting, "MetaControl", 75, 5, 3000, true, LengthMaximum=3000)]

	#endregion
	/// <summary>
	/// Summary description for JavascriptContent.
	/// </summary>
	public class JavascriptContent : SecuredPortletBase
	{
		public JavascriptContent()
		{
		}
		
		protected override PortletViewBase GetCurrentScreen()
		{
			PortletViewBase screen = null;
			//Always display the main view
			screen = this.LoadPortletView("ICS/JavascriptContent/Main_View.ascx");
			return screen;
		}
	}
}

using System;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Jenzabar.Portal.Framework.Web.UI;
using Jenzabar.Portal.Framework;
using Jenzabar.Portal.Framework.Configuration;
using Jenzabar.ICS.Web.Portlets.Common;

namespace CUS.ICS.JavascriptContent
{

	/// <summary>
	///		Summary description for Main_View.
	/// </summary>
	public class Main_View : PortletViewBase
	{
		protected System.Web.UI.WebControls.Label lblContent;

		private void Page_Load(object sender, System.EventArgs e)
		{ 
			if(IsFirstLoad)
			{
				if (PortletUtilities.GetSettingValue(this.ParentPortlet,"JavascriptCode").Trim() == "" 
					&& PortletUtilities.GetSettingValue(this.ParentPortlet,"JavascriptSource").Trim() == ""
					&& PortletUtilities.GetSettingValue(this.ParentPortlet,"PlainTextTop").Trim() == ""
					&& PortletUtilities.GetSettingValue(this.ParentPortlet,"PlainTextBottom").Trim() == "")
				{
					lblContent.Visible = false;
					this.ParentPortlet.ShowFeedback(FeedbackType.Error, "This portlet has not yet been properly set up. Please contact a portal administrator.");
				}
				else
				{
					if (PortletUtilities.GetSettingValue(this.ParentPortlet,"PlainTextTop").Trim() != "")
					{
						lblContent.Text += ReplaceHostID(PortletUtilities.GetSettingValue(this.ParentPortlet,"PlainTextTop").Trim());
					}
					if (PortletUtilities.GetSettingValue(this.ParentPortlet,"JavascriptSource").Trim() != "")
					{
						lblContent.Text += "<script type=\"text/javascript\" src=\"" + ReplaceHostID(PortletUtilities.GetSettingValue(this.ParentPortlet,"JavascriptSource").Trim()) + "\"></script>";
					}
					if (PortletUtilities.GetSettingValue(this.ParentPortlet,"JavascriptCode").Trim() != "")
					{
						lblContent.Text += "<script type=\"text/javascript\">" + ReplaceHostID(PortletUtilities.GetSettingValue(this.ParentPortlet,"JavascriptCode").Trim()) + "</script>";
					}
					if (PortletUtilities.GetSettingValue(this.ParentPortlet,"PlainTextBottom").Trim() != "")
					{
						lblContent.Text += ReplaceHostID(PortletUtilities.GetSettingValue(this.ParentPortlet,"PlainTextBottom").Trim());
					}
					lblContent.Visible = true;
					//Regex.Replace(strQueryText, "@@HostID", Jenzabar.Portal.Framework.PortalUser.Current.HostID);

				}
			}
		}
		private string ReplaceHostID(string strIn)
		{
			if (Jenzabar.Portal.Framework.PortalUser.Current.HostID != null &&  Jenzabar.Portal.Framework.PortalUser.Current.HostID.Length > 0)
			{
				return Regex.Replace(strIn, "@@HostID",Jenzabar.Portal.Framework.PortalUser.Current.HostID);
				}
			else
			{
				return strIn;
			}

		}
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	}
}

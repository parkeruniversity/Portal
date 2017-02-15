<% @ webhandler language="C#" class="ViewHandler" %> 

using System;
using System.Web;
using Jenzabar.ICS;
using Jenzabar.Portal.Framework.Data;

/// <summary>
/// Handler for Readings.
/// </summary>
//TODO: base class
public class ViewHandler : IHttpHandler
{
	public ViewHandler()
	{
	}

	#region Implementation of IHttpHandler
	public void ProcessRequest(System.Web.HttpContext context)
	{
		try
		{
			Reading objReading = Reading.FindByID( new ObjectIdentifier( new Guid( HttpUtility.UrlDecode(context.Request.QueryString["id"] ))));
			if( objReading != null)
			{
				objReading.Views++;
				objReading.Commit();
			}
		}
		finally
		{	
			context.Response.Redirect(HttpUtility.UrlDecode(context.Request.QueryString["target"]));
		}
	}

	public bool IsReusable
	{
		get
		{
			return true;
		}
	}
	#endregion
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MyStore;

public partial class StoreLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (IsPostBack)
		{
			string storename = Request.Form["TPL_username"];
			string password = Request.Form["TPL_password"];
			storeSync temp = new storeSync();
			storeSync store;
			if (temp.judgeIfStoreExist(storename))
				store = new storeSync(storename);
			else
				store = new storeSync();

			if (!temp.judgeIfStoreExist(storename))
			{
				Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>printUserNotExistMsg();</script>");
			}
			else if (store.password != password)
			{
				Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>printPwdErrorMsg('" + storename + "');</script>");
			}
			else
			{
				// 创建一个HttpCookie对象
				HttpCookie cookie = new HttpCookie("isStoreLogin");
				// 设定此cookies值
				cookie.Value = storename;
				// 设定cookie的生命周期
				//cookie.Expires = DateTime.Now.AddMinutes(10);
				// 加入此cookie
				Response.Cookies.Add(cookie);

				Response.Redirect("./ManageProduct.aspx");
			}
		}
    }
}
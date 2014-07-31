using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["LoginbBackurl"] = Request.QueryString["backurl"];
        }
        else
        {
            string username = Request.Form["TPL_username"];
            string password = Request.Form["TPL_password"];
            consumerSync user = new consumerSync();

            if (!user.getUserByName(username))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>printUserNotExistMsg();</script>");
            }
            else if (user.password != password)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>printPwdErrorMsg('" + username + "');</script>");
            }
            else
            {
                // 创建一个HttpCookie对象
                HttpCookie cookie = new HttpCookie("isLogin");
                // 设定此cookies值
                cookie.Value = username;
                // 设定cookie的生命周期
                //cookie.Expires = DateTime.Now.AddMinutes(10);
                // 加入此cookie
                Response.Cookies.Add(cookie);

                if (Session["LoginbBackurl"] != null)
                {
                    Response.Redirect(Session["LoginbBackurl"].ToString());
                }
                else
                {
                    Response.Redirect("./Index.aspx");
                }
            }
        }
    }
}
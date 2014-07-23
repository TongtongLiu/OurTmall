using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OurTmall_v2
{
    public partial class RegisterSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UN;
            string MS;
            UN = Request.QueryString["UN"];
            MS = Request.QueryString["MS"];
            if (MS == "1")
                SuccessInfo_UserName.Text = UN + ",恭喜您注册成功！";
            else
                SuccessInfo_UserName.Text = "用户名" + UN + "已经被人抢先注册啦，试试别的名字吧~";
        }
    }
}
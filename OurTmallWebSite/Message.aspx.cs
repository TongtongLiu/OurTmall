using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UN;
        string MS;
        UN = Request.QueryString["UN"];
        MS = Request.QueryString["MS"];
		if (MS == "1")
				SuccessInfo_UserName.Text = UN + "，恭喜您注册成功！祝您购物愉快";
		else if (MS == "0")
				SuccessInfo_UserName.Text = "用户名" + UN + "已经被人抢先注册啦，试试别的名字吧~";
		else if (MS == "2")
				SuccessInfo_UserName.Text = "店铺名称" + UN + "已经被人抢先注册啦，试试别的名字吧~";
		else if (MS == "3")
				SuccessInfo_UserName.Text = "恭喜您，店铺" + UN + "已经注册成功！祝您生意兴隆";
		else if (MS == "4")
				SuccessInfo_UserName.Text = UN + "，您所做的更改已被保存，祝您购物愉快！";
		else if (MS == "5")
				SuccessInfo_UserName.Text = "检测到您还未登录，请先登录";
		else if (MS == "6")
				SuccessInfo_UserName.Text = UN + "，您所做的更改已被保存，祝您生意兴隆！";
		else
				SuccessInfo_UserName.Text = "页面出现了未知的错误，请关闭本页面";
    }
}
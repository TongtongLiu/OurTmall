using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;

public partial class ModifyUserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        string un;
        if (cookie == null)
        {
            //未登录
        }
        else
        {
            //得到用户名
            un = cookie.Value;
            consumerSync user = new consumerSync(un);
            CorrectPrePassWord2.Text = user.password;
            ModifyUserName.Text = un;
            NewTelephone.Text = user.telephone;
            NewEmail.Text = user.email;
            UserAvatar.ImageUrl = user.photo;
        }
        //以下是测试用的数据，以后应屏蔽
        //CorrectPrePassWord2.Text = "123";
        //ModifyUserName.Text = "123";
        //NewTelephone.Text = "18888888888";
        //NewEmail.Text = "123@163.com";
        //UserAvatar.ImageUrl = "img/123Avatar.jpg";
    }

    protected void SubmitModificationButton_Click(object sender, EventArgs e)
    {
        string un = ModifyUserName.Text;
        string pw = NewPassWord.Text;
        string em = NewEmail.Text;
        string tl = NewTelephone.Text;
        consumerSync user = new consumerSync(un);
        if (NewAvatar.HasFile)
        {
            int iTmp = 0;
            string postFix = "";
            iTmp = NewAvatar.FileName.LastIndexOf('.');
            if (iTmp <= 0)
            {
                //添加默认头像url
                user.photo = "./consumerImg/DefaultAvatar.jpg";
            }
            else
            {
                postFix = NewAvatar.FileName.Substring(iTmp);
                if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
                {
                    NewAvatar.SaveAs(Server.MapPath("./consumerImg/") + ModifyUserName.Text + "Avatar" + postFix);
                    //添加头像url赋值
                    user.photo = "./consumerImg/" + ModifyUserName.Text + "Avatar" + postFix;
                }
                else
                {
                    user.photo = "./consumerImg/DefaultAvatar.jpg";
                }
            }
        }
        else
        {
            //添加默认头像url
            user.photo = "./consumerImg/DefaultAvatar.jpg";
        }
        //给数据库传值
        user.password = pw;
        user.email = em;
        user.telephone = tl;
        user.points = 0;
        user.score = 0;
        Response.Redirect("Message.aspx?UN=" + ModifyUserName.Text + "&MS=4");
    }
}
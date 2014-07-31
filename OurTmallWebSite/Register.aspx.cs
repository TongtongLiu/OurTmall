using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        string un = UserName.Text;
        string pw = Request.Form["PassWord"];
        string em = Request.Form["Email"];
        string tl = Request.Form["Telephone"];
        consumerSync test = new consumerSync();
        if (test.judgeIfUserExist(UserName.Text))//这里回头用查重函数替代
        {
            Response.Redirect("Message.aspx?UN=" + UserName.Text + "&MS=0");
        }
        else
        {
            consumerSync user = new consumerSync(un);
            if (UploadAvatar.HasFile)
            {
                int iTmp = 0;
                string postFix = "";
                iTmp = UploadAvatar.FileName.LastIndexOf('.');
                if (iTmp <= 0)
                {
                    //添加默认头像url
                    user.photo = "./consumerImg/DefaultAvatar.jpg";
                }
                else
                {
                    postFix = UploadAvatar.FileName.Substring(iTmp);
                    if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
                    {
                        UploadAvatar.SaveAs(Server.MapPath("./consumerImg/") + UserName.Text + "Avatar" + postFix);
                    //添加头像url赋值
                        user.photo = "./consumerImg/" + UserName.Text + "Avatar" + postFix;
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
            
            // 创建一个HttpCookie对象
            HttpCookie cookie = new HttpCookie("isLogin");
            // 设定此cookies值
            cookie.Value = un;
            // 设定cookie的生命周期
            //cookie.Expires = DateTime.Now.AddMinutes(10);
            // 加入此cookie
            Response.Cookies.Add(cookie);

            Response.Redirect("Message.aspx?UN=" + UserName.Text + "&MS=1");
        }
    }
}
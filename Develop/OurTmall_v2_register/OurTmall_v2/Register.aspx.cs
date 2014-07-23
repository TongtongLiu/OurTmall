using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using MyDef;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace OurTmall_v2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void submitButton_Click(object sender, EventArgs e)
        {
            string un = UserName.Text;
            string pw = PassWord.Text;
            string em = Email.Text;
            string tl = Telephone.Text;
            consumerSync test = new consumerSync();
            if (test.judgeIfUserExist(UserName.Text))//这里回头用查重函数替代
            {
                Response.Redirect("RegisterMessage.aspx?UN=" + UserName.Text + "&MS=0");
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
                        user.photo = "img/DefaultAvatar.jpg";
                    }
                    else
                    {
                        postFix = UploadAvatar.FileName.Substring(iTmp);
                        UploadAvatar.SaveAs(Server.MapPath("~/img/") + UserName.Text + "Avatar" + postFix);
                        //添加头像url赋值
                        user.photo = "img/" + UserName.Text + "Avatar" + postFix;
                    }
                }
                else
                {
                    //添加默认头像url
                    user.photo = "img/DefaultAvatar.jpg";
                }
                //给数据库传值
                user.password = pw;
                user.email = em;
                user.telephone = tl;
                user.points = 0;
                user.score = 0;
                Response.Redirect("RegisterMessage.aspx?UN=" + UserName.Text + "&MS=1");
            }
        }
    }
}
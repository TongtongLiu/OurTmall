using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyStore;

public partial class RegisterStore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void StoreSubmitButton_Click(object sender, EventArgs e)
    {
        string sn = StoreName.Text;
        string spw = Request.Form["StorePassWord"];
        string son = Request.Form["StoreOwnerName"];
        string sem = Request.Form["StoreEmail"];
        string stel = Request.Form["StoreTelephone"];
        string sd = Request.Form["StoreDescription"];
        storeSync test = new storeSync();
        if (test.judgeIfStoreExist(sn))
        {
            Response.Redirect("Message.aspx?UN=" + sn + "&MS=2");
        }
        else
        {
            storeSync store = new storeSync(sn);
            if (UploadStoreLogo.HasFile)
            {
                int iTmp = 0;
                string postFix = "";
                iTmp = UploadStoreLogo.FileName.LastIndexOf('.');
                if (iTmp <= 0)
                {
                    //添加默认头像url
                    store.logo = "./storeImg/DefaultLogo.jpg";
                }
                else
                {
                    postFix = UploadStoreLogo.FileName.Substring(iTmp);
                    if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
                    {
                        UploadStoreLogo.SaveAs(Server.MapPath("./storeImg/") + sn + "Logo" + postFix);
                        //添加头像url赋值
                        store.logo = "./storeImg/" + sn + "Logo" + postFix;
                    }
                    else
                    {
                        store.logo = "./storeImg/DefaultLogo.jpg";
                    }
                }
            }
            else
            {
                store.logo = "./storeImg/DefaultLogo.jpg";
            }
            store.password = spw;
            store.owner_name = son;
            store.telephone = stel;
            store.email = sem;
            store.description = sd;
            store.score = 0;

			// 创建一个HttpCookie对象
			HttpCookie cookie = new HttpCookie("isStoreLogin");
			// 设定此cookies值
			cookie.Value = sn;
			// 设定cookie的生命周期
			//cookie.Expires = DateTime.Now.AddMinutes(10);
			// 加入此cookie
			Response.Cookies.Add(cookie);

            Response.Redirect("Message.aspx?UN=" + sn + "&MS=3");
        }
    }
}
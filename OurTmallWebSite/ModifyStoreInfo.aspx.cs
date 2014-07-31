using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyStore;

public partial class ModifyStoreInfo : System.Web.UI.Page
{
		protected void Page_Load(object sender, EventArgs e)
		{
				HttpCookie cookie = Request.Cookies.Get("isStoreLogin");//回头换成卖家的cookie
				string sn;
				if (cookie == null)
				{
					//未登录
					Response.Redirect("StoreLogin.aspx");
				}
				else
				{
						sn = cookie.Value;
						//sn = "123";
						storeSync store = new storeSync(sn);
						CorrectStorePrePassWord.Text = store.password;
						NewStoreName.Text = sn;
						NewOwnerName.Text = store.owner_name;
						NewStoreTelephone.Text = store.telephone;
						NewStoreEmail.Text = store.email;
						NewStoreDescription.Text = store.description;
						StoreLogo.ImageUrl = store.logo;
				}
		}
		protected void SubmitStoreModificationButton_Click(object sender, EventArgs e)
		{
				string sn = NewStoreName.Text;
				string pw = Request.Form["NewStorePassWord"];
				string on = Request.Form["NewOwnerName"];
				string em = Request.Form["NewStoreEmail"];
				string tl = Request.Form["NewStoreTelephone"];
				storeSync store = new storeSync(sn);
				if (NewLogo.HasFile)
				{
						int iTmp = 0;
						string postFix = "";
						iTmp = NewLogo.FileName.LastIndexOf('.');
						if (iTmp <= 0)
						{
								//添加默认头像url
								store.logo = "storeImg/DefaultLogo.jpg";
						}
						else
						{
								postFix = NewLogo.FileName.Substring(iTmp);
								if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
								{
										NewLogo.SaveAs(Server.MapPath("./storeImg/") + NewStoreName.Text + "Logo" + postFix);
										//添加头像url赋值
										store.logo = "./storeImg/" + NewStoreName.Text + "Logo" + postFix;
								}
								else
								{
										store.logo = "storeImg/DefaultLogo.jpg";
								}
						}
				}
				//给数据库传值
				if (pw != "")
						store.password = pw;
				store.owner_name = on;
				store.telephone = tl;
				store.email = em;
				store.description = Request.Form["NewStoreDescription"];
				store.score = 0;
				Response.Redirect("Message.aspx?UN=" + on + "&MS=6");
		}
}
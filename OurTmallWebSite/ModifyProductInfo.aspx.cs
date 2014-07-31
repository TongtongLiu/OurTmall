using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyStore;
using MyProduct;

public partial class ModifyProductInfo : System.Web.UI.Page
{
	protected string productID;
	protected long storeID;
	protected string storeOwner;
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
			storeID = store.id;
			productID = Request.QueryString["pid"];
			storeOwner = store.owner_name;

			if (productID != null)
			{
				productSync modifyProduct = new productSync(Convert.ToInt64(productID));
				ProductName.Text = modifyProduct.product_name;
				ProductPrice.Text = modifyProduct.price.ToString();
				ProductDescription.Text = modifyProduct.description;
			}
		}
    }

	protected void submitProductInfoButton_Click(object sender, EventArgs e)
	{
		string pn = Request.Form["ProductName"];
		string pp = Request.Form["ProductPrice"];
		string pd = Request.Form["ProductDescription"];
		if (productID != null)
		{
			productSync modifyProduct = new productSync(Convert.ToInt64(productID));
			modifyProduct.product_name = pn;
			modifyProduct.price = Convert.ToDecimal(pp);
			modifyProduct.description = pd;

			if (UploadProductImg1.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg1.FileName.LastIndexOf('.');
				postFix = UploadProductImg1.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg1.SaveAs(Server.MapPath("./productImg/") + productID + "_1" + postFix);
					//添加头像url赋值
					modifyProduct.img1 = "./productImg/" + productID + "_1" + postFix;
				}
			}
			else
				modifyProduct.img1 = "";

			if (UploadProductImg2.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg2.FileName.LastIndexOf('.');
				postFix = UploadProductImg2.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg2.SaveAs(Server.MapPath("./productImg/") + productID + "_2" + postFix);
					//添加头像url赋值
					modifyProduct.img2 = "./productImg" + productID + "_2" + postFix;
				}
			}
			else
				modifyProduct.img2 = "";

			if (UploadProductImg3.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg3.FileName.LastIndexOf('.');
				postFix = UploadProductImg3.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg3.SaveAs(Server.MapPath("./productImg/") + productID + "_3" + postFix);
					//添加头像url赋值
					modifyProduct.img3 = "./productImg" + productID + "_3" + postFix;
				}
			}
			else
				modifyProduct.img3 = "";

			if (UploadProductImg4.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg4.FileName.LastIndexOf('.');
				postFix = UploadProductImg4.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg4.SaveAs(Server.MapPath("./productImg/") + productID + "_4" + postFix);
					//添加头像url赋值
					modifyProduct.img4 = "./productImg" + productID + "_4" + postFix;
				}
			}
			else
				modifyProduct.img4 = "";

			if (UploadProductImg5.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg5.FileName.LastIndexOf('.');
				postFix = UploadProductImg5.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg5.SaveAs(Server.MapPath("./productImg/") + productID + "_5" + postFix);
					//添加头像url赋值
					modifyProduct.img5 = "./productImg" + productID + "_5" + postFix;
				}
			}
			else
				modifyProduct.img5 = "";

			string[] flag = new string[5];
			int j = 0;
			for (j = 0; j < 5; j++)
				flag[j] = "";
			j = 0;
			if (modifyProduct.img1 != "")
			{
				flag[j] = modifyProduct.img1;
				j++;
			}
			if (modifyProduct.img2 != "")
			{
				flag[j] = modifyProduct.img2;
				j++;
			}
			if (modifyProduct.img3 != "")
			{
				flag[j] = modifyProduct.img3;
				j++;
			}
			if (modifyProduct.img4 != "")
			{
				flag[j] = modifyProduct.img4;
				j++;
			}
			if (modifyProduct.img5 != "")
			{
				flag[j] = modifyProduct.img5;
				j++;
			}
			modifyProduct.img1 = flag[0];
			modifyProduct.img2 = flag[1];
			modifyProduct.img3 = flag[2];
			modifyProduct.img4 = flag[3];
			modifyProduct.img5 = flag[4];
		}
		else
		{
			productSync newProduct = new productSync(pn, storeID);
			newProduct.price = Convert.ToDecimal(pp);
			newProduct.description = pd;

			if (UploadProductImg1.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg1.FileName.LastIndexOf('.');
				postFix = UploadProductImg1.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg1.SaveAs(Server.MapPath("./productImg/") + productID + "_1" + postFix);
					//添加头像url赋值
					newProduct.img1 = "./productImg" + productID + "_1" + postFix;
				}
			}
			else
				newProduct.img1 = "";

			if (UploadProductImg2.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg2.FileName.LastIndexOf('.');
				postFix = UploadProductImg2.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg2.SaveAs(Server.MapPath("./productImg/") + productID + "_2" + postFix);
					//添加头像url赋值
					newProduct.img2 = "./productImg" + productID + "_2" + postFix;
				}
			}
			else
				newProduct.img2 = "";

			if (UploadProductImg3.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg3.FileName.LastIndexOf('.');
				postFix = UploadProductImg3.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg3.SaveAs(Server.MapPath("./productImg/") + productID + "_3" + postFix);
					//添加头像url赋值
					newProduct.img3 = "./productImg" + productID + "_3" + postFix;
				}
			}
			else
				newProduct.img3 = "";

			if (UploadProductImg4.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg4.FileName.LastIndexOf('.');
				postFix = UploadProductImg4.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg4.SaveAs(Server.MapPath("./productImg/") + productID + "_4" + postFix);
					//添加头像url赋值
					newProduct.img4 = "./productImg" + productID + "_4" + postFix;
				}
			}
			else
				newProduct.img4 = "";

			if (UploadProductImg5.HasFile)
			{
				int iTmp = 0;
				string postFix = "";
				iTmp = UploadProductImg5.FileName.LastIndexOf('.');
				postFix = UploadProductImg5.FileName.Substring(iTmp);
				if ((postFix == ".jpg" || (postFix == ".png") || (postFix == ".bmp")))
				{
					UploadProductImg5.SaveAs(Server.MapPath("./productImg/") + productID + "_5" + postFix);
					//添加头像url赋值
					newProduct.img5 = "./productImg" + productID + "_5" + postFix;
				}
			}
			else
				newProduct.img5 = "";

			string[] flag = new string[5];
			int j = 0;
			for (j = 0; j < 5; j++)
				flag[j] = "";
			j = 0;
			if (newProduct.img1 != "")
			{
				flag[j] = newProduct.img1;
				j++;
			}
			if (newProduct.img2 != "")
			{
				flag[j] = newProduct.img2;
				j++;
			}
			if (newProduct.img3 != "")
			{
				flag[j] = newProduct.img3;
				j++;
			}
			if (newProduct.img4 != "")
			{
				flag[j] = newProduct.img4;
				j++;
			}
			if (newProduct.img5 != "")
			{
				flag[j] = newProduct.img5;
				j++;
			}
			newProduct.img1 = flag[0];
			newProduct.img2 = flag[1];
			newProduct.img3 = flag[2];
			newProduct.img4 = flag[3];
			newProduct.img5 = flag[4];

			//下面加上绑定商店的数据库语句
		}
		Response.Redirect("Message.aspx?UN=" + storeOwner + "&MS=6");
	}
}
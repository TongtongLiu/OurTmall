using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using System.Data;
using MyCollection;
using System.Collections;
using MyStore;
using System.Web.UI.HtmlControls;

public partial class ModifyStoreCollection : System.Web.UI.Page
{
	protected long userID;
	protected void Page_Load(object sender, EventArgs e)
	{
		//显示用户头像
		HttpCookie cookie = Request.Cookies.Get("isLogin");
		string un;
		if (cookie == null)
		{
			//未登录
			Response.Redirect("Login.aspx");
		}
		else
		{
			un = cookie.Value;
			consumerSync user = new consumerSync(un);
			UserAvatar.ImageUrl = user.photo;
			userID = user.id;
		}
		if (!IsPostBack)
		{
			ViewState["pageindex"] = "0";
			Bind();
		}
	}
	protected void Bind()
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("picurl");
		dt.Columns.Add("url");
		dt.Columns.Add("CollectionCheckBoxValue");
		dt.Columns.Add("HyperLinkText");
		dt.Columns.Add("HyperLinkURL");
		dt.Columns.Add("DeleteCollectionCommandName");
		dt.Columns.Add("EnterStoreCommandName");
		//dt.Columns.Add("DeleteCollectionURL");
		//dt.Columns.Add("AddToCartURL");
		//添加产品信息
		//这是一个测试dt.Rows.Add("productImg/1.jpg", "Register.aspx", "保暖女士半袖手套", "Register.aspx", "123", "Login.aspx", "ModifyUserInfo.aspx");
		collectionSync iList = new collectionSync();
		ArrayList list = iList.getAllCollection(userID, 2);
		if (list.Count == 0)
		{
			ShowNoCollection.Text = "您没有任何收藏信息";
		}
		for (int i = 0; i < list.Count; i++)
		{
			long temp = Convert.ToInt64(list[i]);
			collectionSync collection = new collectionSync(temp);
			storeSync store = new storeSync(collection.object_id);
			dt.Rows.Add(store.logo, "Store.aspx?ID=" + store.id, collection.id.ToString(), store.store_name, "Store.aspx?ID=" + store.id, collection.id.ToString(), store.id.ToString());
		}

		if (dt != null && dt.Rows.Count > 0)
		{
			DataView dv = dt.DefaultView;
			PagedDataSource dvPds = new PagedDataSource();
			dvPds.DataSource = dv;
			dvPds.AllowPaging = true;
			dvPds.PageSize = 9;
			dvPds.CurrentPageIndex = int.Parse(ViewState["pageindex"].ToString());
			if (!dvPds.IsFirstPage)
			{
				lkPre.Visible = true;
			}
			else
			{
				lkPre.Visible = false;
			}
			if (!dvPds.IsLastPage)
			{
				lkNext.Visible = true;
			}
			else
			{
				lkNext.Visible = false;
			}
			CollectionList.DataSource = dvPds;
			CollectionList.DataBind();
		}
	}
	protected void IndexChanging(object sender, EventArgs e)
	{
		string strCommand = ((LinkButton)sender).CommandArgument.ToString();
		int pageindex = int.Parse(ViewState["pageindex"].ToString());
		if (strCommand == "pre")
		{
			pageindex = pageindex - 1;
		}
		else
		{
			pageindex = pageindex + 1;
		}
		ViewState["pageindex"] = pageindex;
		Bind();
	}
	protected void DeleteCollectionHyperLink_Command(object sender, CommandEventArgs e)
	{
		collectionSync temp = new collectionSync();
		temp.deleteCollectionByID(Convert.ToInt64(e.CommandName));
		Response.Redirect("ModifyStoreCollection.aspx");
	}
	protected void DeleteSeletedCollection_Click(object sender, EventArgs e)
	{
		collectionSync temp = new collectionSync();
		for (int i = 0; i < CollectionList.Items.Count; i++)
		{
			HtmlInputCheckBox chb = (HtmlInputCheckBox)CollectionList.Items[i].FindControl("CollectionCheckBox");
			if (chb.Checked == true)
			{
				temp.deleteCollectionByID(Convert.ToInt64(chb.Value));
			}
		}
		Response.Redirect("ModifyStoreCollection.aspx");
	}
	protected void AddToCartHyperLink_Command(object sender, CommandEventArgs e)
	{
		Response.Redirect("Store.aspx?ID=" + e.CommandName);
	}
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyStore;
using System.Data;
using MyProduct;
using System.Web.UI.HtmlControls;

public partial class ManageProduct : System.Web.UI.Page
{
    protected long storeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isStoreLogin");//这里换上商家的cookie
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
            StoreLogo.ImageUrl = store.logo;
            storeID = store.id;
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
        dt.Columns.Add("ProductImgURL");
        dt.Columns.Add("ProductURL");
        dt.Columns.Add("ProductCheckBoxValue");
        //dt.Columns.Add("StoreLinkText");
        //dt.Columns.Add("StoreLinkURL");
        dt.Columns.Add("ProductNameLabelText");
        dt.Columns.Add("ProductPriceLabelText");
        dt.Columns.Add("SalesNumLabelText");
        dt.Columns.Add("ProductScoreLabelText");
        dt.Columns.Add("DeleteProductCommandName");
        dt.Columns.Add("ModifyProductCommandName");

        //示例dt.Rows.Add("productImg/1.jpg", "Product.aspx", "商店名称", "Store.aspx", "120", "1000", "5", "Message.aspx", "Message.aspx");
        productSync product = new productSync();
        DataTable list = product.getAllProductOfStore(storeID);
        if (list.Rows.Count == 0)
        {
            ShowNoProductInfo.Text = "您没添加任何商品";
        }
        for (int i = 0; i < list.Rows.Count; i++)
        {
            dt.Rows.Add(list.Rows[i]["img1"].ToString(), "Product.aspx?ID=" + list.Rows[i]["id"].ToString(), list.Rows[i]["id"].ToString(), list.Rows[i]["product_name"].ToString(), list.Rows[i]["price"].ToString(), list.Rows[i]["sales"].ToString(), list.Rows[i]["score"].ToString(), list.Rows[i]["id"].ToString(), list.Rows[i]["id"].ToString());
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
            ManageProductList.DataSource = dvPds;
            ManageProductList.DataBind();
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
    protected void DeleteProductLink_Command(object sender, CommandEventArgs e)
    {
        productSync ipro = new productSync();
        ipro.deleteProductByID(Convert.ToInt64(e.CommandName));
        Response.Redirect("ManageProduct.aspx");
    }
    protected void ModifyProductInfoLink_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ModifyProductInfo.aspx?pid=" + e.CommandName);
    }
    protected void DeleteSelectedProduct_Command(object sender, CommandEventArgs e)
    {
        productSync ipro = new productSync();
        for (int i = 0; i < ManageProductList.Items.Count; i++)
        {
            HtmlInputCheckBox chb = (HtmlInputCheckBox)ManageProductList.Items[i].FindControl("ProductCheckBox");
            if (chb.Checked == true)
            {
                ipro.deleteProductByID(Convert.ToInt64(chb.Value));
            }
        }
        Response.Redirect("ManageProduct.aspx");
    }
}
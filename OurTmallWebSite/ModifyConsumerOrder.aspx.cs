using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using System.Data;
using MyOrder;
using MyProduct;
using MyStore;
using System.Collections;

public partial class ModifyConsumerOrder : System.Web.UI.Page
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
        for (int i = 0; i < ConsumerOrderList.Items.Count; i++)
        {
            Label tempLabel = (Label)ConsumerOrderList.Items[i].FindControl("ConsumerOrderStatus");
            //LinkButton cancel = (LinkButton)ConsumerOrderList.Items[i].FindControl("CancelOrder");
            //LinkButton comment = (LinkButton)ConsumerOrderList.Items[i].FindControl("CommentLink");
            Label oidlb = (Label)ConsumerOrderList.Items[i].FindControl("ConsumerOrderID");
            Panel area = (Panel)ConsumerOrderList.Items[i].FindControl("OperationArea");
            if (tempLabel.Text == "订单状态：<br/>待付款")
            {
                LinkButton cancel = new LinkButton();
                cancel.CommandName = oidlb.Text.Substring(4);
                cancel.Text = "取消订单";
                cancel.Command += new CommandEventHandler(DeleteOrderCorrect);
                area.Controls.Add(cancel);

                Label place = new Label();
                place.Text = "  ";
                area.Controls.Add(place);

                LinkButton payOrder = new LinkButton();
                payOrder.CommandName = oidlb.Text.Substring(4);
                payOrder.Text = "付款";
                payOrder.Command += new CommandEventHandler(PayOrderClick);
                area.Controls.Add(payOrder);
            }
            else if (tempLabel.Text == "订单状态：<br/>交易成功")
            {
                LinkButton comment = new LinkButton();
                comment.Text = "评论";
                comment.CommandName = oidlb.Text.Substring(4);
                comment.Command += new CommandEventHandler(ConfirmAndCommentCorrect);
                area.Controls.Add(comment);
            }
        }
    }
    protected void Bind()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ConsumerOrderDateText");
        dt.Columns.Add("ConsumerOrderIDText");
        dt.Columns.Add("StoreLinkText");
        dt.Columns.Add("StoreLinkURL");
        dt.Columns.Add("ProductImgURL");
        dt.Columns.Add("ProductImgLinkURL");
        dt.Columns.Add("ProductLinkURL");
        dt.Columns.Add("ProductLinkText");
        dt.Columns.Add("ProductPriceText");
        dt.Columns.Add("ProductQuantityText");
        dt.Columns.Add("ConsumerOrderStatusText");
        //dt.Columns.Add("OrderIDCommandName");
        //dt.Columns.Add("OrderIDCommandName2");

        //示例dt.Rows.Add("2014-07-28", "订单号：123456", "商店名称", "Store.aspx", "productImg/1.jpg", "Product.aspx", "Product.aspx", "商品名称", "价格：<br/>￥123", "个数：<br/>1", "订单状态：<br/>已发货");
        orderSync temp = new orderSync();
        DataTable list = temp.getAllOrderOfConsumer(userID);
        if (list.Rows.Count == 0)
        {
            ShowNoOrderInfo.Text = "您暂时没有任何订单";
        }
        for (int i = 0; i < list.Rows.Count; i++)
        {
            productSync tempProduct = new productSync(Convert.ToInt64(list.Rows[i]["product_id"]));
            storeSync tempStore = new storeSync(tempProduct.store_id);
            string state = "";
            if (Convert.ToInt32(list.Rows[i]["state_id"]) == 1)
                state = "待付款";
            else if (Convert.ToInt32(list.Rows[i]["state_id"]) == 2)
                state = "交易成功";
            dt.Rows.Add(list.Rows[i]["time"], "订单号：" + list.Rows[i]["id"].ToString(), tempStore.store_name, "Store.aspx?ID=" + tempStore.id, tempProduct.img1, "Product.aspx?ID=" + tempProduct.id, "Product.aspx?ID=" + tempProduct.id, tempProduct.product_name, "价格：<br/>￥" + tempProduct.price, "个数：<br/>" + list.Rows[i]["buy_number"], "订单状态：<br/>" + state);
        }



        if (dt != null && dt.Rows.Count > 0)
        {
            DataView dv = dt.DefaultView;
            PagedDataSource dvPds = new PagedDataSource();
            dvPds.DataSource = dv;
            dvPds.AllowPaging = true;
            dvPds.PageSize = 5;
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
            ConsumerOrderList.DataSource = dvPds;
            ConsumerOrderList.DataBind();
        }
        /*for (int i = 0; i < ConsumerOrderList.Items.Count; i++)
        {
            Label tempLabel = (Label)ConsumerOrderList.Items[i].FindControl("ConsumerOrderStatus");
            //LinkButton cancel = (LinkButton)ConsumerOrderList.Items[i].FindControl("CancelOrder");
            //LinkButton comment = (LinkButton)ConsumerOrderList.Items[i].FindControl("CommentLink");
            Label oidlb = (Label)ConsumerOrderList.Items[i].FindControl("ConsumerOrderID");
            Panel area = (Panel)ConsumerOrderList.Items[i].FindControl("OperationArea");
            if (tempLabel.Text == "订单状态：<br/>待付款")
            {
                LinkButton cancel = new LinkButton();
                cancel.CommandName = oidlb.Text.Substring(4);
                cancel.Text = "取消订单";
                cancel.Command += new CommandEventHandler(DeleteOrderCorrect);
                area.Controls.Add(cancel);

                Label place = new Label();
                place.Text = "  ";
                area.Controls.Add(place);

                LinkButton payOrder = new LinkButton();
                payOrder.CommandName = oidlb.Text.Substring(4);
                payOrder.Text = "付款";
                payOrder.Command += new CommandEventHandler(PayOrderClick);
                area.Controls.Add(payOrder);
            }
            else if (tempLabel.Text == "订单状态：<br/>交易成功")
            {
                LinkButton comment = new LinkButton();
                comment.Text = "评论";
                comment.CommandName = oidlb.Text.Substring(4);
                comment.Command += new CommandEventHandler(ConfirmAndCommentCorrect);
                area.Controls.Add(comment);
            }
        }*/
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
        for (int i = 0; i < ConsumerOrderList.Items.Count; i++)
        {
            Label tempLabel = (Label)ConsumerOrderList.Items[i].FindControl("ConsumerOrderStatus");
            //LinkButton cancel = (LinkButton)ConsumerOrderList.Items[i].FindControl("CancelOrder");
            //LinkButton comment = (LinkButton)ConsumerOrderList.Items[i].FindControl("CommentLink");
            Label oidlb = (Label)ConsumerOrderList.Items[i].FindControl("ConsumerOrderID");
            Panel area = (Panel)ConsumerOrderList.Items[i].FindControl("OperationArea");
            if (tempLabel.Text == "订单状态：<br/>待付款")
            {
                LinkButton cancel = new LinkButton();
                cancel.CommandName = oidlb.Text.Substring(4);
                cancel.Text = "取消订单";
                cancel.Command += new CommandEventHandler(DeleteOrderCorrect);
                area.Controls.Add(cancel);

                Label place = new Label();
                place.Text = "  ";
                area.Controls.Add(place);

                LinkButton payOrder = new LinkButton();
                payOrder.CommandName = oidlb.Text.Substring(4);
                payOrder.Text = "付款";
                payOrder.Command += new CommandEventHandler(PayOrderClick);
                area.Controls.Add(payOrder);
            }
            else if (tempLabel.Text == "订单状态：<br/>交易成功")
            {
                LinkButton comment = new LinkButton();
                comment.Text = "评论";
                comment.CommandName = oidlb.Text.Substring(4);
                comment.Command += new CommandEventHandler(ConfirmAndCommentCorrect);
                area.Controls.Add(comment);
            }
        }
    }
    protected void DeleteOrderCorrect(object sender, CommandEventArgs e)
    {
        orderSync temp = new orderSync();
        temp.deleteProductByID(Convert.ToInt64(e.CommandName));
        Response.Redirect("ModifyConsumerOrder.aspx");
    }
    protected void ConfirmAndCommentCorrect(object sender, CommandEventArgs e)
    {
        orderSync temp = new orderSync(Convert.ToInt64(e.CommandName));
        Response.Redirect("Product.aspx?ID=" + temp.product_id + "&CID=" + userID.ToString() + "#CommentSpace");
    }

    protected void PayOrderClick(object sender, CommandEventArgs e)
    {
        HttpCookie cookie = new HttpCookie("OrderID");
        cookie.Value = e.CommandName;
        Response.Cookies.Add(cookie);
        Response.Redirect("Order.aspx");
    }
}
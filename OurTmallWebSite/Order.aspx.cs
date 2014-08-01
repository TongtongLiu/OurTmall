using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyOrder;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void J_GO2_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("OrderID");
        if (cookie != null)
        {
            string OrderIDStr = cookie.Value;
            string[] OrderIDList = OrderIDStr.Split('+');
            orderSync order;
            for (int i = 0; i < OrderIDList.Length; i++)
            {
                order = new orderSync(Convert.ToInt64(OrderIDList[i]));
                order.state_id = 2;
            }
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(cookie);
        }
        Response.Redirect("./ModifyConsumerOrder.aspx");
    }

    protected void J_BackCart_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("OrderID");
        if (cookie != null)
        {
            string OrderIDStr = cookie.Value;
            string[] OrderIDList = OrderIDStr.Split('+');
            orderSync order = new orderSync();
            if (OrderIDStr != "")
            {
                for (int i = 0; i < OrderIDList.Length; i++)
                {
                    order.deleteProductByID(Convert.ToInt64(OrderIDList[i]));
                }
            }
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(cookie);
        }
        Response.Redirect("./Cart.aspx");
    }
}
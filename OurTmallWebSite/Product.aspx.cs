using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyCart;
using MyCartProduct;
using MyConsumer;
using MyOrder;

public partial class Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ProductID"] = Request.QueryString["ID"];
        Quantity.Text = "1";
        J_LinkMessage.Text = "";
    }

    protected void J_LinkBasket_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie == null)
        {
            Response.Redirect("./Login.aspx?backurl=" + Request.Url);
        }
        else
        {
            consumerSync consumer = new consumerSync(cookie.Value);
            cartSync cart = new cartSync(consumer.id);
            cart_productSync relation = new cart_productSync(cart.id, Convert.ToInt64(Session["ProductID"]));
            relation.quantity += Convert.ToInt32(Quantity.Text);
            J_LinkMessage.Text = "添加成功";
        }
    }

    protected void J_LinkBuy_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie == null)
        {
            Response.Redirect("./Login.aspx?backurl=" + Request.Url);
        }
        else
        {
            HttpCookie cookie2 = new HttpCookie("OrderID");
            consumerSync consumer = new consumerSync(cookie.Value);
            orderSync order = new orderSync(consumer.id, Convert.ToInt64(Session["ProductID"]));
            order.buy_number += Convert.ToInt32(Quantity.Text);
            cookie2.Value = order.id.ToString();
            Response.Cookies.Add(cookie2);
            Response.Redirect("./Order.aspx");
        }
    }
    
}
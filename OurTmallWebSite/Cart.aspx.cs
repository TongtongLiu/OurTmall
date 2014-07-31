using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using MyCart;
using MyCartProduct;
using MyOrder;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void J_PAY_Click(object sender, EventArgs e)
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
            orderSync order;
            cart_productSync cp = new cart_productSync();
            cartSync cart = new cartSync(consumer.id);
            string OrderIDList = "";

            if (ItemCheckbox0.Text != "0")
            {
                order = new orderSync(consumer.id, Convert.ToInt64(ItemCheckbox0.Text));
                order.buy_number += Convert.ToInt32(Amount0.Text);
                OrderIDList = OrderIDList + "+" + order.id.ToString();
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox0.Text));
            }
            if (ItemCheckbox1.Text != "0")
            {
                order = new orderSync(consumer.id, Convert.ToInt64(ItemCheckbox1.Text));
                order.buy_number += Convert.ToInt32(Amount1.Text);
                OrderIDList = OrderIDList + "+" + order.id.ToString();
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox1.Text));
            }
            if (ItemCheckbox2.Text != "0")
            {
                order = new orderSync(consumer.id, Convert.ToInt64(ItemCheckbox2.Text));
                order.buy_number += Convert.ToInt32(Amount2.Text);
                OrderIDList = OrderIDList + "+" + order.id.ToString();
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox2.Text));
            }
            if (ItemCheckbox3.Text != "0")
            {
                order = new orderSync(consumer.id, Convert.ToInt64(ItemCheckbox3.Text));
                order.buy_number += Convert.ToInt32(Amount3.Text);
                OrderIDList = OrderIDList + "+" + order.id.ToString();
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox3.Text));
            }
            if (ItemCheckbox4.Text != "0")
            {
                order = new orderSync(consumer.id, Convert.ToInt64(ItemCheckbox4.Text));
                order.buy_number += Convert.ToInt32(Amount4.Text);
                OrderIDList = OrderIDList + "+" + order.id.ToString();
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox4.Text));
            }

            if (OrderIDList != "")
            {
                OrderIDList = OrderIDList.Substring(1);
                cookie2.Value = OrderIDList;
                Response.Cookies.Add(cookie2);
                Response.Redirect("./Order.aspx");
            }
        }
    }

    protected void J_DeleteSelect_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie == null)
        {
            Response.Redirect("./Login.aspx?backurl=" + Request.Url);
        }
        else
        {
            consumerSync consumer = new consumerSync(cookie.Value);
            cart_productSync cp = new cart_productSync();
            cartSync cart = new cartSync(consumer.id);

            if (ItemCheckbox0.Text != "0")
            {
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox0.Text));
                ItemCheckbox0.Text = "0";
            }
            if (ItemCheckbox1.Text != "0")
            {
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox1.Text));
                ItemCheckbox1.Text = "0";
            }
            if (ItemCheckbox2.Text != "0")
            {
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox2.Text));
                ItemCheckbox2.Text = "0";
            }
            if (ItemCheckbox3.Text != "0")
            {
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox3.Text));
                ItemCheckbox3.Text = "0";
            }
            if (ItemCheckbox4.Text != "0")
            {
                cp.deleteRelationship(cart.id, Convert.ToInt64(ItemCheckbox4.Text));
                ItemCheckbox4.Text = "0";
            }
        }
    }
}
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
using MyCollection;
using MyProduct;
using MyComment;

public partial class Product : System.Web.UI.Page
{
    public long uid;
    public long pid;
    public long sid;
    public bool sc;
    public bool pc;
    protected void Page_Load(object sender, EventArgs e)
    {
        string productID = Request.QueryString["ID"];
        Session["ProductID"] = Request.QueryString["ID"];
        Quantity.Text = "1";
        J_LinkMessage.Text = "";

        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie != null)
        {
            consumerSync user = new consumerSync(cookie.Value);
            collectionSync judge = new collectionSync();
            if (judge.isExist(user.id, 1, Convert.ToInt64(productID)))//商品是收藏的
            {
                ProductCollected.Text = "";
                this.pc = true;
            }
            else
            {
                ProductCollected.Text = "";
                this.pc = false;
            }
            productSync pro = new productSync(Convert.ToInt64(productID));
            if (judge.isExist(user.id, 2, pro.store_id))//商店是收藏的
            {
                StoreCollected.Text = "";
                this.sc = true;
            }
            else
            {
                StoreCollected.Text = "";
                this.sc = false;
            }
            this.uid = user.id;
            this.pid = pro.id;
            this.sid = pro.store_id;
        }
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
            order.buy_number += Convert.ToInt32(Request.Form["Quantity"]);
            cookie2.Value = order.id.ToString();
            Response.Cookies.Add(cookie2);
            Response.Redirect("./Order.aspx");
        }
    }

    /*protected void StoreUncollected_Command(object sender, CommandEventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie == null)
        {
            Response.Redirect("./Login.aspx?backurl=" + Request.Url);
        }
        else
        {
            collectionSync c = new collectionSync(uid, 2, sid);
            Response.Redirect("./Product.aspx?ID=" + pid);
        }
    }*/
    protected void StoreCollected_Command(object sender, CommandEventArgs e)
    {
        if (this.sc == true)
        {
            collectionSync del = new collectionSync();
            del.deleteCollectionByDetail(uid, 2, sid);
            Response.Redirect("./Product.aspx?ID=" + this.pid);
        }
        else
        {
            HttpCookie cookie = Request.Cookies.Get("isLogin");
            if (cookie == null)
            {
                Response.Redirect("./Login.aspx?backurl=" + Request.Url);
            }
            else
            {
                collectionSync c = new collectionSync(this.uid, 2, this.sid);
                Response.Redirect("./Product.aspx?ID=" + this.pid);
            }
        }
    }
    /*protected void ProductUncollected_Command(object sender, CommandEventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie == null)
        {
            Response.Redirect("./Login.aspx?backurl=" + Request.Url);
        }
        else
        {
            collectionSync c = new collectionSync(uid, 1, pid);
            Response.Redirect("./Product.aspx?ID=" + pid);
        }
    }*/
    protected void ProductCollected_Command(object sender, CommandEventArgs e)
    {
        if (this.pc == true)
        {
            collectionSync del = new collectionSync();
            del.deleteCollectionByDetail(this.uid, 1, this.pid);
            Response.Redirect("./Product.aspx?ID=" + this.pid);
        }
        else
        {
            HttpCookie cookie = Request.Cookies.Get("isLogin");
            if (cookie == null)
            {
                Response.Redirect("./Login.aspx?backurl=" + Request.Url);
            }
            else
            {
                collectionSync c = new collectionSync(this.uid, 1, this.pid);
                Response.Redirect("./Product.aspx?ID=" + this.pid);
            }
        }
    }

    protected void J_OK_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie == null)
        {
            Response.Redirect("./Login.aspx?backurl=" + Request.Url);
        }
        else
        {
            string detail = J_Comment.Text;
            float score = Convert.ToSingle(J_Score.Text);
            long proid = Convert.ToInt64(Request.QueryString["ID"]);
            long conid = Convert.ToInt64(Request.QueryString["CID"]);
            commentSync comment = new commentSync(conid, proid);
            comment.detail = detail;
            comment.product_score = score;
            Response.Redirect("./Product.aspx?ID=" + proid + "#J_Detail");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using MyCollection;
using MyStore;

public partial class Store : System.Web.UI.Page
{
    public long uid;
    public long sid;
    public bool sc;
    protected void Page_Load(object sender, EventArgs e)
    {
        string storeID = Request.QueryString["ID"];
        HttpCookie cookie = Request.Cookies.Get("isLogin");
        if (cookie != null)
        {
            consumerSync user = new consumerSync(cookie.Value);
            collectionSync judge = new collectionSync();
            if (judge.isExist(user.id, 2, Convert.ToInt64(storeID)))//商店是收藏的
            {
                StoreCollected.Text = "";
                this.sc = true;
            }
            else
            {
                StoreCollected.Text = "";
                this.sc = false;
            }
            uid = user.id;
            sid = Convert.ToInt64(storeID);
        }
    }
    protected void StoreCollected_Command(object sender, CommandEventArgs e)
    {
        if (this.sc == true)
        {
            collectionSync del = new collectionSync();
            del.deleteCollectionByDetail(uid, 2, sid);
            Response.Redirect("./Store.aspx?ID=" + this.sid);
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
                Response.Redirect("./Store.aspx?ID=" + this.sid);
            }
        }
    }
}
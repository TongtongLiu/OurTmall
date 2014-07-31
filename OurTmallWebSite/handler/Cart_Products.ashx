<%@ WebHandler Language="C#" Class="Cart_Products" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
using MyCart;
using MyCartProduct;
using MyConsumer;
using MyProduct;

public class ProductOfCart
{
  public long id;
  public string name;
  public string img;
  public Decimal price;
}

public class ProductOfCartList
{
  public List<ProductOfCart> plist;
  
  public ProductOfCartList(string iConsumerName)
  {
    consumerSync co = new consumerSync(iConsumerName);
    cartSync ca = new cartSync(co.id);
    cart_productSync productList = new cart_productSync();
    ArrayList list = productList.getProductInCart(ca.id);
    ProductOfCart pr;
    productSync tmp;
    plist = new List<ProductOfCart>();
    for (int i = 0; i < list.Count; i++)
    {
      pr = new ProductOfCart();
      pr.id = Convert.ToInt64(list[i]);
      tmp = new productSync(pr.id);
      pr.name = tmp.product_name;
      pr.img = tmp.img1;
      pr.price = tmp.price;
      plist.Add(pr);
    }
  }
}

public class Cart_Products : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      string iConsumerName = context.Request.QueryString["USER"];
      ProductOfCartList list = new ProductOfCartList(iConsumerName);
      string json = JsonConvert.SerializeObject(list.plist);
      context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
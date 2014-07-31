<%@ WebHandler Language="C#" Class="Product_Info" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using MyProduct;
using MyStore;

public class HotProduct
{
  public long id;
  public string name;
  public string img;
}

public class ProductInfo
{
  public long id;
  public string name;
  public List<string> img;
  public Decimal price;
  public int sales;
  public float score;
  public string description;
  public long store_id;
  public string store_name;
  public string store_logo;
  public List<HotProduct> store_hot;
  
  public ProductInfo(long iProductID)
  {
    productSync pr = new productSync();
    //if (!pr.judgeIfProductExist(iProductID))
    //  return;
    pr = new productSync(iProductID);
    id = pr.id;
    name = pr.product_name;
    img = new List<string>();
    if (pr.img1 != "")
    {
      img.Add(pr.img1);
    }
    if (pr.img2 != "")
    {
      img.Add(pr.img2);
    }
    if (pr.img3 != "")
    {
      img.Add(pr.img3);
    }
    if (pr.img4 != "")
    {
      img.Add(pr.img4);
    }
    if (pr.img5 != "")
    {
      img.Add(pr.img5);
    }
    price = pr.price;
    sales = pr.sales;
    score = pr.score;
    description = pr.description;
    store_id = pr.store_id;
    storeSync st = new storeSync(store_id);
    store_name = st.store_name;
    store_logo = st.logo;
    
    store_hot = new List<HotProduct>();
    DataTable dt = getAllProduct(store_id);
    HotProduct hp;
    int n = dt.Rows.Count < 5 ? dt.Rows.Count : 5;
    for (int i = 0; i < n; i++)
    {
      hp = new HotProduct();
      hp.id = Convert.ToInt64(dt.Rows[i]["id"]);
      hp.name = dt.Rows[i]["product_name"].ToString();
      hp.img = dt.Rows[i]["img1"].ToString();
      store_hot.Add(hp);
    }
  }

  public DataTable getAllProduct(long iStoreID)//得到某一店铺的全部商品，并按照由高到低返回
  {
    productSync product = new productSync();
    DataTable tb = product.getAllProductOfStore(iStoreID);
    return tb;
  }
}

public class Product_Info : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      long iProductID = Convert.ToInt64(context.Request.QueryString["ID"]);
      if (iProductID > 0)
      {
        ProductInfo pi = new ProductInfo(iProductID);
        string json = JsonConvert.SerializeObject(pi);
        context.Response.Write(json);
      }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
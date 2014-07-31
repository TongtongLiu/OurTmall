<%@ WebHandler Language="C#" Class="Category_Products" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using MyProduct;
using MyCategory;
using MyProductCategory;

public class ProductOfCategory
{
  public long id;
  public string name;
  public string img;
  public Decimal price;
  public int sales;
  public float score;
}

public class ProductOfCategoryList
{
  public string name;
  public List<ProductOfCategory> plist;

  public ProductOfCategoryList(long iCategoryID)
  {
    categorySync tmp = new categorySync();
    name = tmp.getCategoryByID(iCategoryID);
    
    DataTable dt = getTopProductByName(30, iCategoryID);
    ProductOfCategory ps;

    plist = new List<ProductOfCategory>();
    for (int i = 0; i < dt.Rows.Count; i++)
    {
      ps = new ProductOfCategory();
      ps.id = Convert.ToInt64(dt.Rows[i]["id"]);
      ps.name = dt.Rows[i]["product_name"].ToString();
      ps.img = dt.Rows[i]["img1"].ToString();
      ps.price = Convert.ToDecimal(dt.Rows[i]["price"]);
      ps.sales = Convert.ToInt32(dt.Rows[i]["sales"]);
      ps.score = Convert.ToSingle(dt.Rows[i]["score"]);
      plist.Add(ps);
    }
  }

  public DataTable getTopProductByName(long iTopNum, long iCategoryID)
  {
    product_belongto_categorySync belongs = new product_belongto_categorySync();
    ArrayList productIDList = belongs.getProductID(iCategoryID);
    productSync product = new productSync();
    DataTable tb = product.getProductOfTopSales(iTopNum, productIDList);
    return tb;
  }
}

public class Category_Products : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      long iCategoryID = Convert.ToInt64(context.Request.QueryString["ID"]);
      if (iCategoryID > 0)
      {
        ProductOfCategoryList list = new ProductOfCategoryList(iCategoryID);
        string json = JsonConvert.SerializeObject(list);
        context.Response.Write(json);
      }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
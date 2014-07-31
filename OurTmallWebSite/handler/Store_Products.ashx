<%@ WebHandler Language="C#" Class="Store_Products" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using MyProduct;
using MyCategory;
using MyProductCategory;

public class ProductOfStore
{
  public long id;
  public string name;
  public string img;
  public Decimal price;
  public int sales;
  public float score;
}
/*
public class ProductSortBySales : IComparer<ProductOfStore>
{
  public int Compare(ProductOfStore x, ProductOfStore y)
  {
    if (x == null && y == null)
      return 0;
    else if (x == null)
      return 1;
    else if (y == null)
      return -1;
    else
      return y.sales - x.sales;
  }
}

public class ProductSortByPrice : IComparer<ProductOfStore>
{
  public int Compare(ProductOfStore x, ProductOfStore y)
  {
    if (x == null && y == null)
      return 0;
    else if (x == null)
      return 1;
    else if (y == null)
      return -1;
    else if (x.price < y.price)
      return 1;
    else if (x.price > y.price)
      return -1;
    else
      return 0;
  }
}

public class ProductSortByScore : IComparer<ProductOfStore>
{
  public int Compare(ProductOfStore x, ProductOfStore y)
  {
    if (x == null && y == null)
      return 0;
    else if (x == null)
      return 1;
    else if (y == null)
      return -1;
    else if (x.score < y.score)
      return 1;
    else if (x.score > y.score)
      return -1;
    else
      return 0;
  }
}
*/
public class ProductOfStoreList
{
  public List<ProductOfStore> plist;
  
  public ProductOfStoreList(long iStoreID)
  {
    DataTable dt = getAllProduct(iStoreID);
    ProductOfStore ps;

    plist = new List<ProductOfStore>();
    for (int i = 0; i < dt.Rows.Count; i++)
    {
      ps = new ProductOfStore();
      ps.id = Convert.ToInt64(dt.Rows[i]["id"]);
      ps.name = dt.Rows[i]["product_name"].ToString();
      ps.img = dt.Rows[i]["img1"].ToString();
      ps.price = Convert.ToDecimal(dt.Rows[i]["price"]);
      ps.sales = Convert.ToInt32(dt.Rows[i]["sales"]);
      ps.score = Convert.ToSingle(dt.Rows[i]["score"]);
      plist.Add(ps);
    }
  }

  public ProductOfStoreList(long iStoreID, long iCategoryID)
  {
    DataTable dt = getProductOfStoreAndCategory(iStoreID, iCategoryID);
    ProductOfStore ps;

    plist = new List<ProductOfStore>();
    for (int i = 0; i < dt.Rows.Count; i++)
    {
      ps = new ProductOfStore();
      ps.id = Convert.ToInt64(dt.Rows[i]["id"]);
      ps.name = dt.Rows[i]["product_name"].ToString();
      ps.img = dt.Rows[i]["img1"].ToString();
      ps.price = Convert.ToDecimal(dt.Rows[i]["price"]);
      ps.sales = Convert.ToInt32(dt.Rows[i]["sales"]);
      ps.score = Convert.ToSingle(dt.Rows[i]["score"]);
      plist.Add(ps);
    }
  }

  public DataTable getAllProduct(long iStoreID)//得到某一店铺的全部商品，并按照由高到低返回
  {
    productSync product = new productSync();
    DataTable tb = product.getAllProductOfStore(iStoreID);
    return tb;
  }

  public DataTable getProductOfStoreAndCategory(long iStoreID, long iCategoryID)
  {
    product_belongto_categorySync belongs = new product_belongto_categorySync();
    ArrayList productIDList = belongs.getProductID(iCategoryID);
    productSync product = new productSync();
    DataTable tb = product.getProductOfStoreAndCategory(iStoreID, productIDList);
    return tb;
  }
  /*
  public void sortList(int type) // type:1 销量，2 价格，3 评分
  {
    switch (type)
    {
      case 3:
        plist.Sort(new ProductSortByScore());
        break;
        
      case 2:
        plist.Sort(new ProductSortByPrice());
        break;
        
      default:
        plist.Sort(new ProductSortBySales());
        break;
    }
  }
  
  public List<ProductOfStore> getSubList(int page)
  {
    int pagesize = 30;
    List<ProductOfStore> result = new List<ProductOfStore>();

    if (page <= 0) page = 1;
    for (int i = (page - 1) * pagesize; i < page * pagesize && i < plist.Count; i++)
    {
      result.Add(plist[i]);
    }
    return result;
  }*/
}

public class Store_Products : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      long iStoreID = Convert.ToInt64(context.Request.QueryString["ID"]);
      long iCategoryID = Convert.ToInt64(context.Request.QueryString["CID"]);
      //int page = Convert.ToInt32(context.Request.QueryString["Page"]);
      //int type = Convert.ToInt32(context.Request.QueryString["Type"]);
      ProductOfStoreList list;
      
      if (iStoreID > 0)
      {
        if (iCategoryID > 0)
          list = new ProductOfStoreList(iStoreID, iCategoryID);
        else
          list = new ProductOfStoreList(iStoreID);

        //if (type > 0)
        //  list.sortList(type);
        
        //string json = JsonConvert.SerializeObject(list.getSubList(page));
        string json = JsonConvert.SerializeObject(list.plist);
        context.Response.Write(json);
      }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
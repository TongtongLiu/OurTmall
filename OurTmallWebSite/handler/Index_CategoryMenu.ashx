<%@ WebHandler Language="C#" Class="Index_CategoryMenu" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
using MyCategory;
using MyProduct;
using MyProductCategory;

public class Category
{
  public long id;
  public string name;
  public List<string> product_img;
  public List<long> product_id;
}

public class CategoryList
{
  public List<Category> clist;

  public CategoryList()
  {
    ArrayList namelist;
    DataTable dt;
    Category ca;
    int i, j;

    clist = new List<Category>();
    namelist = runCategory();
    for (i = 0; i < namelist.Count && i < 8; i++)
    {
      ca = new Category();
      ca.name = namelist[i].ToString();
      categorySync category = new categorySync(ca.name);
      ca.id = category.id;
      ca.product_img = new List<string>();
      ca.product_id = new List<long>();
      dt = getTopProductByCategoryID(3, ca.id);
      for (j = 0; j < 3 && j < dt.Rows.Count; j++)
      {
        ca.product_img.Add(dt.Rows[j]["img1"].ToString());
        ca.product_id.Add(Convert.ToInt64(dt.Rows[j]["id"]));
      }
      clist.Add(ca);
    }
    for (; i < 8; i++)
    {
      ca = new Category();
      ca.name = "暂无";
      ca.id = 0;
      ca.product_img = new List<string>();
      ca.product_id = new List<long>();
      clist.Add(ca);
    }
  }
  
  public ArrayList runCategory()
  {
    categorySync category = new categorySync();
    ArrayList list = category.getAllCategory();
    return list;
  }

  public DataTable getTopProductByCategoryID(long iTopNum, long iCategoryID)
  {
    product_belongto_categorySync belongs = new product_belongto_categorySync();
    ArrayList productIDList = belongs.getProductID(iCategoryID);
    productSync product = new productSync();
    DataTable tb = product.getProductOfTopSales(iTopNum, productIDList);
    return tb;
  }
}

public class Index_CategoryMenu : IHttpHandler {  
  public void ProcessRequest (HttpContext context) {
    CategoryList list = new CategoryList();
    string json = JsonConvert.SerializeObject(list.clist);
    context.Response.Write(json);
  }
 
  public bool IsReusable {
      get {
          return false;
      }
  }

}
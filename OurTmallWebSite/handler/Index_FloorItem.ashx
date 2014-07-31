<%@ WebHandler Language="C#" Class="Index_FloorItem" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Data;
using MyCategory;
using MyProduct;
using MyProductCategory;
using Newtonsoft.Json;
using MyStoreCategory;
using MyStore;

public class Category2
{
  public long id;
  public string name;
  public List<string> product_img;
  public List<long> product_id;
  public List<string> product_name;
  public List<string> store_logo;
  public List<long> store_id;
  public List<string> store_name;
}

public class Category2List
{
  public List<Category2> clist;

  public Category2List()
  {
    ArrayList namelist;
    DataTable dt;
    Category2 ca;
    int i, j;

    clist = new List<Category2>();
    namelist = getCategory();
    for (i = 0; i < namelist.Count && i < 8; i++)
    {
      ca = new Category2();
      ca.name = namelist[i].ToString();
      categorySync category = new categorySync(ca.name);
      ca.id = category.id;
      ca.product_img = new List<string>();
      ca.product_id = new List<long>();
      ca.product_name = new List<string>();
      ca.store_logo = new List<string>();
      ca.store_id = new List<long>();
      ca.store_name = new List<string>();
      dt = getTopProductByCategoryID(7, ca.id);
      for (j = 0; j < 7 && j < dt.Rows.Count; j++)
      {
        ca.product_img.Add(dt.Rows[j]["img1"].ToString());
        ca.product_id.Add(Convert.ToInt64(dt.Rows[j]["id"]));
        ca.product_name.Add(dt.Rows[j]["product_name"].ToString());
      }
      dt = getTopStoreOfCategory(5, ca.id);
      for (j = 0; j < 5 && j < dt.Rows.Count; j++)
      {
        ca.store_id.Add(Convert.ToInt64(dt.Rows[j]["id"]));
        ca.store_name.Add(dt.Rows[j]["store_name"].ToString());
        ca.store_logo.Add(dt.Rows[j]["logo"].ToString());
      }
      clist.Add(ca);
    }
    for (; i < 8; i++)
    {
      ca = new Category2();
      ca.name = "暂无";
      ca.id = 0;
      ca.product_img = new List<string>();
      ca.product_id = new List<long>();
      ca.product_name = new List<string>();
      ca.store_logo = new List<string>();
      ca.store_id = new List<long>();
      ca.store_name = new List<string>();
      clist.Add(ca);
    }
  }

  public ArrayList getCategory()
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

  public DataTable getProductOfStoreAndCategory(long iStoreID, long iCategoryID)
  {
    product_belongto_categorySync belongs = new product_belongto_categorySync();
    ArrayList productIDList = belongs.getProductID(iCategoryID);
    productSync product = new productSync();
    DataTable list = product.getProductOfStoreAndCategory(iStoreID, productIDList);
    return list;
  }

  public DataTable getTopStoreOfCategory(long iTopNum, long iCategoryID)
  {
    store_sell_categorySync belongs = new store_sell_categorySync();
    ArrayList storeIDList = belongs.getCategoryStoreID(iCategoryID);

    for (int i = 0; i < storeIDList.Count; i++)//求每家商店的sales总和
    {
      DataTable list = getProductOfStoreAndCategory(Convert.ToInt64(storeIDList[i]), iCategoryID);
      int total_sales = 0;
      for (int j = 0; j < list.Rows.Count; j++)
        total_sales += Convert.ToInt32(list.Rows[0]["sales"]);
      storeSync store = new storeSync(Convert.ToInt64(storeIDList[i]));
      store.total_sales = total_sales;
    }
    storeSync iStore = new storeSync();
    DataTable tb = iStore.getStoreOfTopSales(iTopNum, storeIDList);
    return tb;
  }
}

public class Index_FloorItem : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      Category2List list = new Category2List();
      string json = JsonConvert.SerializeObject(list.clist);
      context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
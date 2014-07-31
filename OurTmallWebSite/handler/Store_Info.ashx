<%@ WebHandler Language="C#" Class="Store_Info" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using MyStore;
using MyCategory;
using MyStoreCategory;

public class StoreInfo
{
  public long id;
  public string name;
  public string logo;
  public string telephone;
  public string email;
  public float score;
  public string description;
  public List<string> category_name;
  public List<long> category_id;
  
  public StoreInfo(long store_id) {
    id = store_id;
    storeSync st = new storeSync(id);
    name = st.store_name;
    logo = st.logo;
    telephone = st.telephone;
    email = st.email;
    score = st.score;
    description = st.description;

    category_id = new List<long>();
    category_name = new List<string>();
    ArrayList idlist = getAllCategoryOfStore(id);
    for (int i = 0; i < idlist.Count && i < 8; i++)
    {
      category_id.Add(Convert.ToInt64(idlist[i]));
      category_name.Add(getCategoryNameByID(category_id[i]));
    }
  }

  public ArrayList getAllCategoryOfStore(long iStoreID)//获得某一商店全部经营类别
  {
    store_sell_categorySync store = new store_sell_categorySync();
    ArrayList categoryList = store.getStoreCategoryID(iStoreID);
    return categoryList;
  }
  
  public string getCategoryNameByID(long iCategoryID)
  {
    categorySync category = new categorySync();
    string name = category.getCategoryByID(iCategoryID);
    return name;
  }
}

public class Store_Info : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      long iStoreID = Convert.ToInt64(context.Request.QueryString["ID"]);
      if (iStoreID > 0)
      {
        StoreInfo info = new StoreInfo(iStoreID);
        string json = JsonConvert.SerializeObject(info);
        context.Response.Write(json);
      }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
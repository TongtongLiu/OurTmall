<%@ WebHandler Language="C#" Class="Index_HotStore" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
using MyStore;
using MyProduct;

public class HotStore
{
  public long id;
  public string name;
  public string logo;
}

public class HotStoreList
{
  public List<HotStore> slist;
  
  public HotStoreList()
  {
    DataTable dt = getTopSalesStore(8);
    HotStore ht;
    int i;
    slist = new List<HotStore>();
    
    for (i = 0; i < 8 && i < dt.Rows.Count; i++)
    {
      ht = new HotStore();
      ht.id = Convert.ToInt64(dt.Rows[i]["id"]);
      ht.name = dt.Rows[i]["store_name"].ToString();
      ht.logo = dt.Rows[i]["logo"].ToString();
      slist.Add(ht);
    }
    for (; i < 8; i++)
    {
      ht = new HotStore();
      ht.id = 0;
      ht.name = "暂无";
      ht.logo = "";
      slist.Add(ht);
    }
  }

  public DataTable getTopSalesStore(long iTopNum)
  {
    storeSync storeID = new storeSync();
    ArrayList storeIDList = storeID.getAllStore();
    for (int i = 0; i < storeIDList.Count; i++)//求每家商店的sales总和
    {
      productSync productList = new productSync();
      DataTable list = productList.getAllProductOfStore(Convert.ToInt64(storeIDList[i]));
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

public class Index_HotStore : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      HotStoreList list = new HotStoreList();
      string json = JsonConvert.SerializeObject(list.slist);
      context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
<%@ WebHandler Language="C#" Class="Order_Address" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
using MyConsumer;
using MyAddress;

public class OrderAddress
{
  public long id;
  public string name;
  public string prov;
  public string city;
  public string dist;
  public string street;
  public string phone;
  public bool isDefault;
}

public class OrderAddressList
{
  public List<OrderAddress> alist;
  
  public OrderAddressList(string iConsumerName)
  {
    consumerSync co = new consumerSync(iConsumerName);
    addressSync addr = new addressSync();
    ArrayList list = addr.getAllAddress(co.id);
    OrderAddress oa;
    alist = new List<OrderAddress>();
    for (int i = 0; i < list.Count; i++)
    {
      addr = new addressSync();
      addr.getAddressByID(Convert.ToInt64(list[i]));
      oa = new OrderAddress();
      oa.id = addr.id;
      oa.name = addr.consignee;
      oa.prov = addr.province;
      oa.city = addr.city;
      oa.dist = addr.county;
      oa.street = addr.street;
      oa.phone = addr.telephone;
      oa.isDefault = addr.isdefault;
      alist.Add(oa);
    }
  }
}


public class Order_Address : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      string iConsumerName = context.Request.QueryString["USER"];
      OrderAddressList list = new OrderAddressList(iConsumerName);
      string json = JsonConvert.SerializeObject(list.alist);
      context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
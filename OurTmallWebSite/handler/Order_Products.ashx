<%@ WebHandler Language="C#" Class="Order_Products" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
using MyOrder;
using MyProduct;

public class OrderItem
{
  public long id;
  public string img;
  public string name;
  public Decimal price;
  public int amount;
}

public class OrderList
{
  public List<OrderItem> olist;
  
  public OrderList(List<long> OrderIDList)
  {
    olist = new List<OrderItem>();
    OrderItem oi;
    orderSync order;
    productSync pro;
    for (int i = 0; i < OrderIDList.Count; i++)
    {
      oi = new OrderItem();
      order = new orderSync(OrderIDList[i]);
      pro = new productSync(order.product_id);

      oi.id = pro.id;
      oi.name = pro.product_name;
      oi.img = pro.img1;
      oi.price = pro.price;
      oi.amount = order.buy_number;
      olist.Add(oi);
    }
  }
}

public class Order_Products : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      List<long> OrderIDList = new List<long>();
      long id = 0;
      if ((id = Convert.ToInt64(context.Request.QueryString["ID0"])) > 0)
      {
        OrderIDList.Add(id);
        id = 0;
        if ((id = Convert.ToInt64(context.Request.QueryString["ID1"])) > 0)
        {
          OrderIDList.Add(id);
          id = 0;
          if ((id = Convert.ToInt64(context.Request.QueryString["ID2"])) > 0)
          {
            OrderIDList.Add(id);
            id = 0;
            if ((id = Convert.ToInt64(context.Request.QueryString["ID3"])) > 0)
            {
              OrderIDList.Add(id);
              id = 0;
              if ((id = Convert.ToInt64(context.Request.QueryString["ID4"])) > 0)
              {
                OrderIDList.Add(id);
              }
            }
          }
        }
      }
      //List<long> OrderIDList2 = new List<long>();
      //OrderIDList2.Add(4);
      //OrderIDList2.Add(5);
      OrderList list = new OrderList(OrderIDList);
      string json = JsonConvert.SerializeObject(list.olist);
      context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
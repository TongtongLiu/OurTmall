<%@ WebHandler Language="C#" Class="Product_Comments" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Collections;
using MyComment;
using MyConsumer;

public class Comment
{
  public long id;
  public string name;
  public string time;
  public float score;
  public string detail;
}

public class CommentList
{
  public List<Comment> clist;
  
  public CommentList(long iProductID)
  {
    commentSync comment = new commentSync();
    DataTable dt = comment.getAllComments(iProductID);
    consumerSync consumer;
    Comment tt;
    
    clist = new List<Comment>();
    for (int i = 0; i < dt.Rows.Count; i++)
    {
      tt = new Comment();
      tt.id = Convert.ToInt64(dt.Rows[i]["id"]);
      consumer = new consumerSync(Convert.ToInt64(dt.Rows[i]["consumer_id"]));
      tt.name = consumer.consumer_name;
      tt.time = dt.Rows[i]["time"].ToString();
      tt.detail = dt.Rows[i]["detail"].ToString();
      tt.score = Convert.ToSingle(dt.Rows[i]["product_score"]);
      clist.Add(tt);
    }
  }
  
  public List<Comment> getsublist(int page)
  {
    int pagesize = 5;
    List<Comment> result = new List<Comment>();
    for (int i = page * pagesize; i < (page + 1) * pagesize && i < clist.Count; i++)
    {
      result.Add(clist[i]);
    }
    return result;
  }
}

public class Product_Comments : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      long iProductID = Convert.ToInt64(context.Request.QueryString["ID"]);
      int page = Convert.ToInt32(context.Request.QueryString["Page"]);

      if (iProductID > 0)
      {
        CommentList list = new CommentList(iProductID);
        string json = JsonConvert.SerializeObject(list.getsublist(page));
        context.Response.Write(json);
      }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
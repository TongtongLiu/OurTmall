<%@ WebHandler Language="C#" Class="Search" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using MyProduct;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public class ProductOfStore
{
	public long id;
	public string name;
	public string img;
	public Decimal price;
	public int sales;
	public float score;
}
public class ProductOfStoreList
{
	public List<ProductOfStore> plist;
}

public class Function
{
	//protected string dictpath;
	
	//public Function(string s)
	//{
	//	this.dictpath = s;
	//}
	
	public bool isValidString(string s)
	{
		if (s == "")
			return false;
		else
		{
			for (int i = 0; i < s.Length; i++)
				if (s[i] == '=' || s[i] == '?' || s[i] == '<' || s[i] == '>' || s[i] == '"' || s[i] == '-' || s[i] == '+' || s[i] == '(' || s[i] == ')' || s[i] == '#' || s[i] == '@' || s[i] == '，' || s[i] == '。' || s[i] == '*' || s[i] == '！')
					return false;
			return true;
		}
	}
	
	public List<string> SeparateKeyWords(string s)
	{
		NICTCLAS nictclas = null;
		string dictFolderPath = ConfigurationManager.ConnectionStrings["DictPath"].ToString();
		List<string>result = new List<string>();
		string temp;
		nictclas = new NICTCLAS(dictFolderPath);
		string r = "";
		nictclas.ParagraphProcessing(s, ref r);
	
		int i = 0;
		int startPos = 0, sublen = 0;
		for (i = 0; i < r.Length; i++)
		{
			if (r[i] == ' ')
			{
				temp = "";
				sublen = i - startPos;
				temp = r.Substring(startPos, sublen);
				if (isValidString(temp))
					result.Add(temp);
				while (i < r.Length && r[i] == ' ')
					i++;
				startPos = i;
				if (startPos >= r.Length)
					break;
			}
		}
		if (startPos < r.Length)
		{
			temp = "";
			sublen = i - startPos;
			temp = r.Substring(startPos, sublen);
			if (isValidString(temp))
				result.Add(temp);
		}
		nictclas = null;
		return result;
	}

	public ProductOfStoreList SearchResult(List<string> key)
	{
		ProductOfStoreList res = new ProductOfStoreList();
		List<string> FinalKey = new List<string>();
		for (int i = 0; i < key.Count; i++)
		{
			if (key[i] != "电脑" && key[i] != "手机" && !key[i].Contains('色') && key[i] != "笔记本")
				FinalKey.Add(key[i]);
		}
		productSync temp = new productSync();
		DataTable d = temp.SearchproductByKeyWords(FinalKey);
		List<ProductOfStore> a = new List<ProductOfStore>();
		for (int i = 0; i < d.Rows.Count; i++)
		{
			ProductOfStore b = new ProductOfStore();
			b.id = Convert.ToInt64(d.Rows[i]["id"]);
			b.img = d.Rows[i]["img1"].ToString();
			b.name = d.Rows[i]["product_name"].ToString();
			b.price = Convert.ToDecimal(d.Rows[i]["price"]);
			b.sales = Convert.ToInt32(d.Rows[i]["sales"]);
			b.score = Convert.ToSingle(d.Rows[i]["score"]);
			a.Add(b);
		}
		res.plist = a;
		return res;
	}
}

public class Search : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
		string searchString = context.Request.QueryString["search"];
		//string dictPath = context.Request.QueryString["path"];

		Function oper = new Function();
		List<string> w = oper.SeparateKeyWords(searchString);
		ProductOfStoreList result = oper.SearchResult(w);
		string json = JsonConvert.SerializeObject(result.plist);
        context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
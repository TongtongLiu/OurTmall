using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Configuration;

namespace MyProductCategory
{
    public class product_belongto_categorySync
    {
        private bool isProductCategoryExist;//是否存在，存在为true, 不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象,连接数据库
        private SqlDataAdapter myAdapter;//声明SqlDataAdapter对象
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!isProductCategoryExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!isProductCategoryExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        private void isExist(long iCategoryID, long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product_belongto_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                isProductCategoryExist = false;
            else
                isProductCategoryExist = true;
        }

        //*********************************************************//
        public product_belongto_categorySync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            isProductCategoryExist = false;
        }

        public product_belongto_categorySync(long iCategoryID, long iProductID)
        {
            if (iCategoryID == 0 || iProductID == 0)
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            isExist(iCategoryID, iProductID);

            if (isProductCategoryExist == false)//不存在,添加
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product_belongto_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection);
                new SqlCommandBuilder(adp);
                DataTable table = new DataTable();
                DataRow row = table.NewRow();
                adp.Fill(table);

                row["category_id"] = iCategoryID;
                row["product_id"] = iProductID;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
            }
            //将用户数据储存于mydata
            isProductCategoryExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_product_belongto_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public ArrayList getProductID(long iCategoryID)
        {
            ArrayList list;
            //string address;
            list = new ArrayList();

            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_product_belongto_category] WHERE category_id  = '" + iCategoryID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            isProductCategoryExist = true;
            pullData();

            for (int i = 0; i < myData.Rows.Count; i++)
            {
                list.Add(Convert.ToInt64(myData.Rows[i]["product_id"]));
            }
            return list;
        }
    }
}

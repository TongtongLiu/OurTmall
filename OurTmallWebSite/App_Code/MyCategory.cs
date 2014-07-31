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

namespace MyCategory
{
    public class categorySync
    {
        private bool categoryExist;//默认收藏是否存在，存在为true, 不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象,连接数据库
        private SqlDataAdapter myAdapter;//声明SqlDataAdapter对象
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!categoryExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!categoryExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        private void isExist(string iCategory)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_category] WHERE category_name  = '" + iCategory + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                categoryExist = false;
            else
                categoryExist = true;
        }

        //*********************************************************//
        public categorySync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            categoryExist = false;
        }

        public categorySync(string iCategory)
        {
            if (iCategory == "")
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            isExist(iCategory);

            if (categoryExist == false)//不存在,添加
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_category]", myConnection);
                new SqlCommandBuilder(adp);
                DataTable table = new DataTable();
                DataRow row = table.NewRow();
                adp.Fill(table);

                DateTime dt = DateTime.Now;
                row["category_name"] = iCategory;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
            }
            //将用户数据储存于mydata
            categoryExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_category] WHERE category_name  = '" + iCategory + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public long id
        {
            get
            {
                if (!categoryExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public string category_name
        {
            get
            {
                if (!categoryExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["category_name"];
            }
            set
            {
                if (!categoryExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["category_name"] = value;
                pushData();
            }
        }

        //*********************************************************//
        public ArrayList getAllCategory()
        {
            ArrayList list;
            list = new ArrayList();
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_category]", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            myAdapter.Fill(myData);

            for (int i = 0; i < myData.Rows.Count; i++)
            {
                list.Add(myData.Rows[i]["category_name"].ToString());
            }
            return list;
        }

        public String getCategoryByID(long iCategoryID)
        {
            ArrayList list;
            list = new ArrayList();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_category] WHERE id  = '" + iCategoryID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            DataTable table = new DataTable();
            adp.Fill(table);

            if (table.Rows.Count == 0)
                throw new System.Exception("NO_EXIST");
            return (table.Rows[0]["category_name"].ToString());
        }
    }
}
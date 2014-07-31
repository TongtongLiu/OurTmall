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

namespace MyCart
{
    public class cartSync
    {
        private bool cartExist;//购物车是否存在，存在为0，不存在为-1
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!cartExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!cartExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        public bool judgeIfcartExist(long iConsumerID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart] WHERE consumer_id ='" + iConsumerID + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }
        //*********************************************************//
        public cartSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            cartExist = false;
        }

        public cartSync(long iConsumerID)
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();

            if (!judgeIfcartExist(iConsumerID))//不存在
                cartExist = false;
            else
                cartExist = true;

            if (cartExist == false)//不存在
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart]", myConnection);
                DataTable table = new DataTable();
                new SqlCommandBuilder(adp);
                adp.Fill(table);
                DataRow row = table.NewRow();
                row["consumer_id"] = iConsumerID;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
            }
            //将用户数据储存于mydata
            cartExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_cart] WHERE consumer_id ='" + iConsumerID + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public long id
        {
            get
            {
                if (!cartExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long consumer_id
        {
            get
            {
                if (!cartExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["consumer_id"];
            }
        }

        //*********************************************************//
        public void deleteCartByID(long iConsumerID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart] WHERE consumer_id  = '" + iConsumerID + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();
            adp.Fill(table);
            if (table.Rows.Count == 0)
                return;
            else
            {
                DataRow row = table.Rows[0];
                row.Delete();
                adp.Update(table);
                table.Rows.Clear();
            }
        }
    }
}

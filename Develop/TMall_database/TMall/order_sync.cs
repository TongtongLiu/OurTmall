using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyDef;

namespace MyOrder
{
    class orderSync
    {
        private bool orderExist;//订单是否存在，存在为0，不存在为-1
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!orderExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!orderExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        public bool judgeIfOrderExist(long iConsumerID, long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_order] WHERE consumer_id  = '" + iConsumerID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection); 
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        //*********************************************************//
        public orderSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();
            orderExist = false;
        }

        public orderSync(long iConsumerID, long iProductID)
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!judgeIfOrderExist(iConsumerID, iProductID))//不存在
                orderExist = false;
            else
                orderExist = true;

            if(orderExist == false)//不存在
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_order] WHERE consumer_id  = '" + iConsumerID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection); 
                DataTable table = new DataTable();
                new SqlCommandBuilder(adp);
                adp.Fill(table);
                DataRow row = table.NewRow();
                row["consumer_id"] = iConsumerID;
                row["product_id"] = iProductID;
                row["discount"] = 1;
                row["state_id"] = 0;//待付款1，待收货2，待发货3
                row["delivery_address_id"] = 0;
                row["buy_number"] = 1;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
                //adp.Fill(table);
            }
            //将用户数据储存于mydata
            orderExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_order] WHERE consumer_id  = '" + iConsumerID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection); 
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public long id
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long consumer_id
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["consumer_id"];
            }
        }

        public long product_id
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["product_id"];
            }
        }

        public double discount
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (double)myData.Rows[0]["discount"];
            }
        }

        public DateTime time
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (DateTime)myData.Rows[0]["time"];
            }
        }

        public int state_id
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["state_id"];
            }
            set
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["state_id"] = value;
                pushData();
            }
        }

        public long delivery_address_id
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["delivery_address_id"];
            }
            set
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["delivery_address_id"] = value;
                pushData();
            }
        }

        public int buy_number
        {
            get
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["buy_number"];
            }
            set
            {
                if (!orderExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["buy_number"] = value;
                pushData();
            }
        }

        //*********************************************************//
        public void deleteProductByID(long iOrderID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_order] WHERE id  = '" + iOrderID.ToString() + "'", myConnection);
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyDef;

namespace MyProduct
{
    class productSync
    {
        private bool productExist;//商品是否存在，存在为true，不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!productExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!productExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        public bool judgeIfProductExist(string iProduct, long iStoreID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE product_name ='" + iProduct + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
            {
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    if(Convert.ToInt64(table.Rows[i]["store_id"]) == iStoreID)
                        return true;
                }
                return false;
            }
        }
        //*********************************************************//
        public productSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();
            productExist = false;
        }

        public productSync(String iProduct, long iStoreID)
        {
            if(iProduct == "")
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!judgeIfProductExist(iProduct, iStoreID))//不存在
                productExist = false;
            else
                productExist = true;

            if(productExist == false)//不存在
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE product_name ='" + iProduct + "'", myConnection);
                DataTable table = new DataTable();
                new SqlCommandBuilder(adp);
                adp.Fill(table);
                DataRow row = table.NewRow();
                row["product_name"] = iProduct;
                row["store_id"] = iStoreID;
                row["price"] = 0;
                row["sales"] = 0;
                row["score"] = 0;
                row["description"] = "";
                row["img1"] = "";
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
                //adp.Fill(table);
            }
            //将用户数据储存于mydata
            productExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE product_name ='" + iProduct + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public long id
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long store_id
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["store_id"];
            }
        }

        public string product_name
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["product_name"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["product_name"] = value;
                pushData();
            }
        }

        public int price
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["price"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["price"] = value;
                pushData();
            }
        }

        public int sales
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["sales"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["sales"] = value;
                pushData();
            }
        }

        public int score
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["score"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["score"] = value;
                pushData();
            }
        }

        public string description
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["description"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["description"] = value;
                pushData();
            }
        }

        public string img1
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["img1"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["img1"] = value;
                pushData();
            }
        }

        public string img2
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["img2"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["img2"] = value;
                pushData();
            }
        }

        public string img3
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["img3"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["img3"] = value;
                pushData();
            }
        }

        public string img4
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["img4"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["img4"] = value;
                pushData();
            }
        }

        public string img5
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["img5"];
            }
            set
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["img5"] = value;
                pushData();
            }
        }
    }
}

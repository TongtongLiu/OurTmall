using System;
using System.Collections;
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

        public bool judgeIfProductExist(long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE id ='" + iProductID + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
            {
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    if (Convert.ToInt64(table.Rows[i]["id"]) == iProductID)
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

        public productSync(long iProductID)
        {
            if (iProductID == 0)
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!judgeIfProductExist(iProductID))//不存在
                productExist = false;
            else
                productExist = true;

            //将用户数据储存于mydata
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE id ='" + iProductID + "'", myConnection);
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

        public Decimal price
        {
            get
            {
                if (!productExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (Decimal)myData.Rows[0]["price"];
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

        //*********************************************************//
        public void deleteProductByID(long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE id  = '" + iProductID.ToString() + "'", myConnection);
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

        public DataTable getProductOfTopSales(long iTopNum, ArrayList iProductID)//某一个类别下的top sales
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product]", myConnection);
            new SqlCommandBuilder(adp);
            DataTable tableOrigin = new DataTable();
            adp.Fill(tableOrigin);
            DataTable tableSelect = tableOrigin.Clone();
            for (int i = 0; i < iProductID.Count; i++)
            {
                DataRow[] dr = tableOrigin.Select("id = '" + iProductID[i] + "'");
                tableSelect.ImportRow((DataRow)dr[0]);
            }
            DataTable tableSort = tableSelect.Clone();
            DataView dv = tableSelect.DefaultView;
            dv.Sort = "sales Desc";
            tableSort = dv.ToTable();
            tableSelect.Clear();
            long num = iTopNum < tableSort.Rows.Count ? iTopNum : tableSort.Rows.Count;
            for (int i = 0; i < num; i++)
            {
                DataRow dr = tableSort.Rows[i];
                tableSelect.ImportRow((DataRow)dr);
                //Console.WriteLine(tableSelect.Rows[i]["product_name"]);
            }
            return tableSelect;
        }

        public DataTable getAllProductOfStore(long iStoreID)//某一个店铺下的所有商品
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE store_id = '" + iStoreID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable tableOrigin = new DataTable();
            adp.Fill(tableOrigin);
            
            DataTable tableSort = tableOrigin.Clone();
            DataView dv = tableOrigin.DefaultView;
            dv.Sort = "sales Desc";
            tableSort = dv.ToTable();

            return tableSort;
        }

        public DataTable getProductOfStoreAndCategory(long iStoreID, ArrayList iProductID)//某店铺某类别商品，排序返回
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_product] WHERE store_id = '" + iStoreID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable tableOrigin = new DataTable();
            adp.Fill(tableOrigin);
            DataTable tableSelect = tableOrigin.Clone();
            for (int i = 0; i < iProductID.Count; i++)
            {
                DataRow[] dr = tableOrigin.Select("id = '" + iProductID[i] + "'");
                if (dr.Length == 0)
                    continue;
                tableSelect.ImportRow((DataRow)dr[0]);
            }
            DataTable tableSort = tableSelect.Clone();
            DataView dv = tableSelect.DefaultView;
            dv.Sort = "sales Desc";
            tableSort = dv.ToTable();
            return tableSort;
        }

    }
}

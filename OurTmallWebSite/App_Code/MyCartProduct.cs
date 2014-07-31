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

namespace MyCartProduct
{
    public class cart_productSync
    {
        private bool relationshipExist;//购物车商品关系是否存在，存在为true，不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!relationshipExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!relationshipExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        public bool judgeIfRelationshipExist(long iCartID, long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart_product] WHERE cart_id  = '" + iCartID +
                "' AND product_id = '" + iProductID + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }
        //*********************************************************//
        public cart_productSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            relationshipExist = false;
        }

        public cart_productSync(long iCartID, long iProductID)
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();

            if (!judgeIfRelationshipExist(iCartID, iProductID))//不存在
                relationshipExist = false;
            else
                relationshipExist = true;

            if (relationshipExist == false)//不存在
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart_product]", myConnection);
                DataTable table = new DataTable();
                new SqlCommandBuilder(adp);
                adp.Fill(table);
                DataRow row = table.NewRow();
                row["cart_id"] = iCartID;
                row["product_id"] = iProductID;
                row["quantity"] = 0;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
            }
            //将用户数据储存于mydata
            relationshipExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_cart_product] WHERE cart_id  = '" + iCartID +
                "' AND product_id = '" + iProductID + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public long id
        {
            get
            {
                if (!relationshipExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long cart_id
        {
            get
            {
                if (!relationshipExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["cart_id"];
            }
        }

        public long product_id
        {
            get
            {
                if (!relationshipExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["product_id"];
            }
        }

        public int quantity
        {
            get
            {
                if (!relationshipExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["quantity"];
            }
            set
            {
                if (!relationshipExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["quantity"] = value;
                pushData();
            }
        }

        //*********************************************************//
        public void deleteRelationship(long iCartID, long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart_product] WHERE cart_id  = '" + iCartID +
                "' AND product_id = '" + iProductID + "'", myConnection);
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

        public ArrayList getProductInCart(long iCartID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_cart_product] WHERE cart_id  = '" + iCartID + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();
            adp.Fill(table);

            ArrayList list = new ArrayList();
            for (int i = 0; i < table.Rows.Count; i++)
                list.Add(table.Rows[i]["product_id"]);
            return list;
        }
    }
}

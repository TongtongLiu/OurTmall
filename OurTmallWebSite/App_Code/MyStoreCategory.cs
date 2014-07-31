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

namespace MyStoreCategory
{
    public class store_sell_categorySync
    {
        //private bool isStoreExist;//商店是否存在，存在为true, 不存在为false
        private bool isRelationshipExist;//类别商店对应关系是否存在，存在为true，不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象,连接数据库
        private SqlDataAdapter myAdapter;//声明SqlDataAdapter对象
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!isRelationshipExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!isRelationshipExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        private void isExist(long iStoreID, long iCategoryID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_store_sell_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND store_id = '" + iStoreID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                isRelationshipExist = false;
            else
                isRelationshipExist = true;
        }

        //*********************************************************//
        public store_sell_categorySync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            isRelationshipExist = false;
        }

        public store_sell_categorySync(long iStoreID, long iCategoryID)
        {
            if (iCategoryID == 0 || iStoreID == 0)
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            isExist(iStoreID, iCategoryID);

            if (isRelationshipExist == false)//不存在,添加
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_store_sell_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND store_id = '" + iStoreID.ToString() + "'", myConnection);
                new SqlCommandBuilder(adp);
                DataTable table = new DataTable();
                DataRow row = table.NewRow();
                adp.Fill(table);

                row["category_id"] = iCategoryID;
                row["store_id"] = iStoreID;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
            }
            //将用户数据储存于mydata
            isRelationshipExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_store_sell_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND store_id = '" + iStoreID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public ArrayList getStoreCategoryID(long iStoreID)//得到商店所有经营类别的id
        {
            ArrayList list;
            list = new ArrayList();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_store_sell_category] WHERE store_id  = '" + iStoreID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            DataTable table = new DataTable();
            adp.Fill(table);

            if (table.Rows.Count == 0)
                throw new System.Exception("NO_EXIST");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                list.Add(Convert.ToInt64(table.Rows[i]["category_id"]));
            }
            return list;
        }

        public ArrayList getCategoryStoreID(long iCategoryID)//得到经营该类别的所有商店的id
        {
            ArrayList list;
            list = new ArrayList();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_store_sell_category] WHERE category_id  = '" + iCategoryID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();
            adp.Fill(table);

//             if (table.Rows.Count == 0)
//                 throw new System.Exception("NO_EXIST");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                list.Add(Convert.ToInt64(table.Rows[i]["store_id"]));
            }
            return list;
        }

        public void deleteAddressByID(long iStoreID, long iCategoryID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_store_sell_category] WHERE category_id  = '" + iCategoryID.ToString() +
                "' AND store_id = '" + iStoreID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();
            adp.Fill(table);

            if (table.Rows.Count == 0)
                return;
            DataRow row = table.Rows[0];
            row.Delete();
            adp.Update(table);
            table.Rows.Clear();
        }
    }
}

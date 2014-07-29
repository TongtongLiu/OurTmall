using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyDef;

namespace MyCategory
{
    class categorySync
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

        //*********************************************************//
        public categorySync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();
            categoryExist = false;
        }
        /*
        public categorySync(string iCategory)
        {
            if(iCategory == "")
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!isExist(iConsumerID, iObjectType, iObjectID))//不存在
                collectionExist = false;
            else
                collectionExist = true;

            if (collectionExist == false)//不存在,添加
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection]", myConnection);
                new SqlCommandBuilder(adp);
                DataTable table = new DataTable();
                DataRow row = table.NewRow();
                adp.Fill(table);

                DateTime dt = DateTime.Now;
                row["consumer_id"] = iConsumerID;
                row["object_type"] = iObjectType;
                row["object_id"] = iObjectID;
                row["time"] = dt;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
                //adp.Fill(table);
            }
            //将用户数据储存于mydata
            collectionExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id  = '" + iObjectID.ToString() +
                "' AND object_type = '" + iObjectType.ToString() + "' AND consumer_id='" + iConsumerID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }*/
    }
}

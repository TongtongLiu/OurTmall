using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Configuration;
//using MyDef;

namespace MyCollection
{
    public class collectionSync
    {
        private bool collectionExist;//收藏是否存在，存在为true, 不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象,连接数据库
        private SqlDataAdapter myAdapter;//声明SqlDataAdapter对象
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!collectionExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!collectionExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        private bool isExist(long iConsumerID, int iObjectType, long iObjectID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id  = '" + iObjectID.ToString() +
                "' AND object_type = '" + iObjectType.ToString() + "' AND consumer_id='" + iConsumerID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        //*******************************************************************************//
        public collectionSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(/*def.dbName*/ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            collectionExist = false;
        }

        public collectionSync(long iConsumerID, int iObjectType, long iObjectID)
        {
            if (iObjectID == 0 || iConsumerID == 0 || iObjectType == 0)
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(/*def.dbName*/ConfigurationManager.ConnectionStrings["connStr"].ToString());
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
        }

        public collectionSync(long iCollectionID)
        {
            if (iCollectionID == 0)
            {
                return;
            }
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();

            if (!judgeIfCollectionExist(iCollectionID))
                collectionExist = false;
            else
                collectionExist = true;

            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE id ='" + iCollectionID + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*******************************************************************************//
        public long id
        {
            get
            {
                if (!collectionExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long consumer_id
        {
            get
            {
                if (!collectionExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["consumer_id"];
            }
        }

        public long object_id
        {
            get
            {
                if (!collectionExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["object_id"];
            }
        }

        public int object_type
        {
            get
            {
                if (!collectionExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["object_type"];
            }
        }

        public DateTime time
        {
            get
            {
                if (!collectionExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (DateTime)myData.Rows[0]["time"];
            }
        }
        //***********************对外接口**************************//
        public bool judgeIfCollectionExist(long iConsumerID, int iObjectType, long iObjectID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id  = '" + iObjectID.ToString() +
                "' AND object_type = '" + iObjectType.ToString() + "' AND consumer_id='" + iConsumerID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        public bool judgeIfCollectionExist(long iCollectionID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE id  = '" + iCollectionID.ToString() +
                "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        public ArrayList getAllCollection(long iConsumerID, int iObjectType)
        {
            ArrayList list;
            list = new ArrayList();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE consumer_id  = '" + iConsumerID.ToString() +
                "' AND object_type = '" + iObjectType.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();
            adp.Fill(table);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                list.Add(Convert.ToInt64(table.Rows[i]["id"]));	//更改处
            }
            return list;
        }

        public void deleteCollectionByID(long iCollectionID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE id  = '" + iCollectionID + "'", myConnection);
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

        public void deleteCollectionByDetail(long iConsumerID, int iObjectType, long iObjectID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id  = '" + iObjectID.ToString() +
                "' AND object_type = '" + iObjectType.ToString() + "' AND consumer_id='" + iConsumerID.ToString() + "'", myConnection);
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

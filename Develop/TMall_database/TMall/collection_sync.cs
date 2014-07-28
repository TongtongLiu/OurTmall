using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyDef;

namespace MyCollection
{
    class collectionSync
    {
        private bool collectionExist;//收藏是否存在，存在为true, 不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
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

        //*******************************************************************************//
        public bool judgeIfProductExist(long iCollectionID, long iConsumerID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id ='" + iCollectionID.ToString() + "'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
            {
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    if (Convert.ToInt64(table.Rows[i]["consumer_id"]) == iConsumerID)
                        return true;
                }
                return false;
            }
        }

        //*******************************************************************************//
        public collectionSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();
            collectionExist = false;
        }

        public collectionSync(long iCollectionID, long iConsumerID)
        {
            if(iCollectionID == 0 || iConsumerID == 0)
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!judgeIfProductExist(iCollectionID, iConsumerID))//不存在
                collectionExist = false;
            else
                collectionExist = true;

            if (collectionExist == false)//不存在
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id ='" + iCollectionID.ToString() + "'", myConnection);
                DateTime dt = DateTime.Now;
                DataTable table = new DataTable();
                new SqlCommandBuilder(adp);
                adp.Fill(table);
                DataRow row = table.NewRow();
                row["consumer_id"] = iConsumerID;
                row["object_type"] = 0;
                row["object_id"] = iCollectionID;
                row["time"] = dt;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
                //adp.Fill(table);
            }
            //将用户数据储存于mydata
            collectionExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_collection] WHERE object_id ='" + iCollectionID.ToString() + "'", myConnection);
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
            set
            {
                if (!collectionExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["object_type"] = value;
                pushData();
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
    }
}

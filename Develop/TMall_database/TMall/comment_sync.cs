using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyDef;

namespace MyComment
{
    class commentSync
    {
        private bool commentExist;//订单是否存在，存在为0，不存在为-1
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            if (!commentExist)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (!commentExist)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        public bool judgeIfOrderExist(long iConsumerID, long iProductID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_comment] WHERE consumer_id  = '" + iConsumerID.ToString() +
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
        public commentSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();
            commentExist = false;
        }

        public commentSync(long iConsumerID, long iProductID)
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!judgeIfOrderExist(iConsumerID, iProductID))//不存在
                commentExist = false;
            else
                commentExist = true;

            if(commentExist == false)//不存在
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_comment] WHERE consumer_id  = '" + iConsumerID.ToString() +
                "' AND product_id = '" + iProductID.ToString() + "'", myConnection); 
                DataTable table = new DataTable();
                new SqlCommandBuilder(adp);
                adp.Fill(table);
                DataRow row = table.NewRow();
                row["consumer_id"] = iConsumerID;
                row["product_id"] = iProductID;
                row["product_score"] = 5;
                row["detail"] = "无评论";
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
            }
            //将用户数据储存于mydata
            commentExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_comment] WHERE consumer_id  = '" + iConsumerID.ToString() +
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
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long consumer_id
        {
            get
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["consumer_id"];
            }
        }

        public long product_id
        {
            get
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["product_id"];
            }
        }

        public int product_score
        {
            get
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["score"];
            }
            set
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["pruduct_score"] = value;
                pushData();
            }
        }

        public string detail
        {
            get
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["detail"];
            }
            set
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["detail"] = value;
                pushData();
            }
        }

        public DateTime time
        {
            get
            {
                if (!commentExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (DateTime)myData.Rows[0]["time"];
            }
        }

        //*********************************************************//
        public void deleteCommentByID(long iCommentID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_comment] WHERE id  = '" + iCommentID + "'", myConnection);
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

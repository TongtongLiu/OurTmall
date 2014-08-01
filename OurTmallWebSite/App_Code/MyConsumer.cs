using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Configuration;

namespace MyConsumer
{
    public class consumerSync
    {
        private int UserExist;//用户是否存在，存在为0，不存在为-1
        private SqlConnection myConnection;//声明sqlconnection对象
        private SqlDataAdapter myAdapter;
        private DataTable myData;

        //------------------------------------------//
        private void pullData()
        {
            if (UserExist == -1)
                return;
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            if (UserExist == -1)
                return;
            myAdapter.Update(myData);//更新到数据库
        }

        //------------------------------------------//
        public void setUserByName(string UName)//根据用户名创建用户，并将用户信息储存在mydata中
        {
            if (UName == "")
                return;
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE consumer_name ='" + UName + "'", myConnection);
            DataTable table = new DataTable();

            new SqlCommandBuilder(adp);
            adp.Fill(table);
            if (table.Rows.Count == 0)
            {
                DataRow row = table.NewRow();
                row["consumer_name"] = UName;
                row["password"] = "";
                row["email"] = "";
                row["telephone"] = "";
                row["photo"] = "";
                row["points"] = 0;
                row["score"] = 0;
                table.Rows.Add(row);
                adp.Update(table);
                table.Rows.Clear();
                adp.Fill(table);
            }
            //将用户数据储存于mydata
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE id ='" + table.Rows[0]["id"] + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            UserExist = 0;
            pullData();
        }

        public bool getUserByName(string UName)//根据用户名创建用户，并将用户信息储存在mydata中
        {
            if (UName == "")
                return false;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE consumer_name ='" + UName + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            myAdapter.Fill(myData);
            if (myData.Rows.Count == 0)
            {
                UserExist = -1;
                return false;
            }
            else
            {
                UserExist = 0;
                return true;
            }
        }

        public bool judgeIfUserExist(string UName)//检查用户名是否重复
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE consumer_name ='" + UName + "'", myConnection);
            DataTable table = new DataTable();

            new SqlCommandBuilder(adp);
            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        public bool judgeIfUserExist(long UserID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE id ='" + UserID + "'", myConnection);
            DataTable table = new DataTable();

            new SqlCommandBuilder(adp);
            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        //------------------------------------------//
        public consumerSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            try
            {
                myConnection.Open();
            }
            catch (Exception e)
            {

            }
            UserExist = -1;
            myConnection.Close();
        }

        public consumerSync(string UserName)
        {
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            try
            {
                myConnection.Open();
            }
            catch (Exception e)
            {

            }
            UserExist = -1;
            setUserByName(UserName);
        }

        public consumerSync(long UserID)
        {
            myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ToString());
            myConnection.Open();
            if (judgeIfUserExist(UserID))
                UserExist = 0;
            else
                UserExist = -1;

            if (UserExist == 0)
            {
                myAdapter = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE id  = '" + UserID.ToString() + "'", myConnection);
                new SqlCommandBuilder(myAdapter);
                myData = new DataTable();
                pullData();
            }
        }

        //------------------数据库数据内容修改函数------------------------//
        public long id
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public string consumer_name
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["consumer_name"];
            }
        }

        public string password
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["password"];
            }
            set
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["password"] = value;
                pushData();
            }
        }

        public string email
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["email"];
            }
            set
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["email"] = value;
                pushData();
            }
        }

        public string telephone
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["telephone"];
            }
            set
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["telephone"] = value;
                pushData();
            }
        }

        public string photo
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["photo"];
            }
            set
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["photo"] = value;
                pushData();
            }
        }

        public int score
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["score"];
            }
            set
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["score"] = value;
                pushData();
            }
        }

        public int points
        {
            get
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["points"];
            }
            set
            {
                if (UserExist == -1)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["points"] = value;
                pushData();
            }
        }
    }
}

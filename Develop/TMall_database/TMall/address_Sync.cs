using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyDef;

namespace MyAddress
{
    class addressSync
    {
        private bool defaultAddressExist;//默认收藏是否存在，存在为true, 不存在为false
        private SqlConnection myConnection;//声明sqlconnection对象,连接数据库
        private SqlDataAdapter myAdapter;//声明SqlDataAdapter对象
        private DataTable myData;

        //*********************************************************//
        private void pullData()
        {
            myAdapter.Fill(myData);//从数据库中得到
        }

        private void pushData()
        {
            myAdapter.Update(myData);//更新到数据库
        }

        private bool isExist(long iConsumerID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_delivery_address] WHERE consumer_id  = '" + iConsumerID.ToString() +
                "' AND isdefault = 'true'", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();

            adp.Fill(table);
            if (table.Rows.Count == 0)
                return false;
            else
                return true;
        }

        //*********************************************************//
        public addressSync()
        {
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();
            defaultAddressExist = false;
        }

        public addressSync(long iConsumerID)
        {
            if(iConsumerID == 0)
                return;
            //构造myconnection对象
            myConnection = new SqlConnection(def.dbName);
            myConnection.Open();

            if (!isExist(iConsumerID))//不存在
                defaultAddressExist = false;
            else
                defaultAddressExist = true;

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_delivery_address]", myConnection);
            new SqlCommandBuilder(adp);
            DataTable table = new DataTable();
            DataRow row = table.NewRow();
            adp.Fill(table);
            row["consumer_id"] = iConsumerID;
            row["consignee"] = "";
            row["telephone"] = "";
            row["country"] = "";
            row["province"] = "";
            row["city"] = "";
            row["county"] = "";
            row["street"] = "";
            row["zipcode"] = "";

            if (defaultAddressExist == false)//默认地址不存在,添加
                row["isdefault"] = 1;
            else//默认地址存在,添加非默认地址
                row["isdefault"] = 0;

            table.Rows.Add(row);
            adp.Update(table);
            table.Rows.Clear();
            //将用户数据储存于mydata
            defaultAddressExist = true;
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_delivery_address] WHERE id  = (select max(id) from [tb_delivery_address])", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
        }

        //*********************************************************//
        public long id
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["id"];
            }
        }

        public long consumer_id
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (long)myData.Rows[0]["consumer_id"];
            }
        }

        public string consignee
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["consignee"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["consignee"] = value;
                pushData();
            }
        }

        public string telephone
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["telephone"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["telephone"] = value;
                pushData();
            }
        }

        public string country
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["country"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["country"] = value;
                pushData();
            }
        }

        public string province
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["province"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["province"] = value;
                pushData();
            }
        }

        public string city
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["city"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["city"] = value;
                pushData();
            }
        }

        public string county
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["county"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["county"] = value;
                pushData();
            }
        }

        public string street
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["street"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["street"] = value;
                pushData();
            }
        }

        public string zipcode
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (string)myData.Rows[0]["zipcode"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["zipcode"] = value;
                pushData();
            }
        }

        public int isdefault
        {
            get
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                pullData();
                return (int)myData.Rows[0]["isdefault"];
            }
            set
            {
                if (!defaultAddressExist)
                    throw new System.Exception("NO_EXIST");
                myData.Rows[0]["isdefault"] = value;
                pushData();
            }
        }

        //*********************************************************//
        public ArrayList getAllAddress(long iConsumerID)
        {
            ArrayList list;
            //string address;
            list = new ArrayList();

            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_delivery_address] WHERE consumer_id  = '" + iConsumerID.ToString() + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();

            for (int i = 0; i < myData.Rows.Count; i++)
            {
                /* = "";
                address = myData.Rows[i]["country"].ToString() + myData.Rows[i]["province"].ToString() +
                    myData.Rows[i]["city"].ToString() + myData.Rows[i]["county"].ToString() + myData.Rows[i]["street"].ToString();*/
                list.Add(Convert.ToInt64(myData.Rows[i]["id"]));
            }
            return list;
        }

        public void getAddressByID(long iAddressID)
        {
            myAdapter = new SqlDataAdapter("SELECT * FROM [tb_delivery_address] WHERE id  = '" + iAddressID + "'", myConnection);
            new SqlCommandBuilder(myAdapter);
            myData = new DataTable();
            pullData();
            if (myData.Rows.Count == 0)
                return;
            else
                defaultAddressExist = true;
        }

        public void deleteAddressByID(long iAddressID)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_delivery_address] WHERE id  = '" + iAddressID + "'", myConnection);
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

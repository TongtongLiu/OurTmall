using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyConsumer;
using MyDef;

namespace TMall_connectionSql
{
    class Program
    {
        static void Main(string[] args)
        {
            consumerSync iuser = new consumerSync("zhaoxinyi");
            iuser.email = "stefanie_xin@163.com";
            /*SqlConnection myConnection;//声明sqlconnection对象
            myConnection = new SqlConnection(def.dbName);
            try
            {
                myConnection.Open();
            }
            catch (Exception e)
            {
                Console.WriteLine("Second exception caugth", e);
                Console.ReadLine();
            }
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [tb_consumer] WHERE consumer_name ='" + "zhaoxinyi" + "'", myConnection);
            DataTable table = new DataTable();

            new SqlCommandBuilder(adp);
            adp.Fill(table);
            Console.WriteLine("hao!");
            Console.ReadLine();*/
        }
    }
}

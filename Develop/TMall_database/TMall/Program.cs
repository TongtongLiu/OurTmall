using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using MyConsumer;
using MyProduct;
using MyDef;
using MyStore;
using MyCollection;

namespace TMall_connectionSql
{
    class Program
    {
        static void Main(string[] args)
        {
            //consumerSync iuser = new consumerSync("zhaoxinyi");
            //iuser.email = "stefanie_xin@163.com";

            /*productSync iproduct = new productSync("mac电脑", 1);
            iproduct.price = 10000;
            bool flag = iproduct.judgeIfProductExist("mac电脑",1);
            Console.WriteLine(flag);
            Console.ReadLine();*/

            /*storeSync istore = new storeSync("mac专营");
            istore.description = "还负责贴膜哦！";*/

            collectionSync icollection = new collectionSync(1, 2);
            icollection.object_type = 1;
            DateTime dt = icollection.time;
            Console.WriteLine(dt);
            Console.ReadLine();
            
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

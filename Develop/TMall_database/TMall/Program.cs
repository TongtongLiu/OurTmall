using System;
using System.Collections;
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
using MyAddress;

namespace TMall_connectionSql
{
    class Program
    {
        static void Main(string[] args)
        {
            /*****************consumerSync操作说明******************/
            //构造函数经过重构，可以通过用户名来创建新的用户，如用户名存在则取出数据，存于类中mydata里
            //consumerSync iuser = new consumerSync("zhaoxinyi");
            //修改，调用其中具体参数，只需要直接：实例名.xxx就可以，例如iuser.email
            //iuser.email = "stefanie_xin@163.com";

            /*****************productSync操作说明******************/
            //构造函数经过重构，可以通过：商品名+商店id来创建新的用户
            //productSync iproduct = new productSync("mac电脑", 1);
            //除id外可以通过：实例名.xxx = xxx来设定，所有属性可以通过：实例名.xxx获取
            //iproduct.price = 10000;
            //Console.WriteLine(iproduct.price);
            //可以调用judgeIfProductExist来判断该商店的该物品是否已经存在，参数为所属商店id+商品名称
            //bool flag = iproduct.judgeIfProductExist("mac电脑",1);
            //Console.WriteLine(flag);

            /*****************productSync操作说明------未完待续******************/
            /*storeSync istore = new storeSync("mac专营");
            istore.description = "还负责贴膜哦！";*/


            /*****************collectionSync操作说明******************/
            //构造函数经过重构，可以通过：consumerid+objecttype+objectid来创建新的收藏，其中type=1为商品，type=2为商店
            //collectionSync icollection = new collectionSync(2, 1, 1);
            //collectionSync icollection2 = new collectionSync(2, 1, 3);
            //collectionSync icollection3 = new collectionSync(2, 1, 5);

            //由于收藏内容不存在修改问题，所有属性不可修改，但可以通过：实例名.xxx获取
            //Console.WriteLine(icollection.id);

            //可以通过getAllCollection函数得到该用户所有该类型的收藏
            //参数类型long iConsumerID, int iObjectType，返回类型为arraylist（需要包含System.Collections），下为实例
            //collectionSync iList = new collectionSync();
            //ArrayList list = iList.getAllCollection(2,1);
            //for (int i = 0; i < list.Count; i++)
            //    Console.WriteLine(list[i]);

            //可以通过deleteCollectionByID或deleteCollectionByDetail函数删除，特别注意参数类型是long,请用convert.toint64转化
            //下为实例
            //collectionSync iList = new collectionSync();
            //ArrayList list = iList.getAllCollection(2,1);
            //for (int i = 0; i < list.Count; i++)
            //    iList.deleteCollectionByID(Convert.ToInt64(list[i]));

            //可以通过deleteCollectionByDetail函数删除，特别注意参数类型如果是long请用convert.toint64转化
            //下为实例
            //collectionSync icollection3 = new collectionSync(2, 1, 5);
            //collectionSync delete = new collectionSync();
            //Console.ReadLine();
            //delete.deleteCollectionByDetail(2, 1, 5);

            /*****************addressSync操作说明******************/
            //构造函数经过重构，可以通过：consumerid来创建新的地址，地址并没有查重.创建后consumerid被赋值,如果之前没有默认地址，则isdefault为1（设为默认），否则为0（不为默认）
            addressSync iaddress1 = new addressSync(1);
            //Console.ReadLine();

            //除id，consumerid外，属性可以通过：实例名.xxx = xxx来设定，所有属性可以通过：实例名.xxx获取
            iaddress1.country = "china";
            iaddress1.city = "北京";
            addressSync iadd2 = new addressSync(1);
            iadd2.country = "china";
            iadd2.city = "天津";

            //Console.ReadLine();

            //可以通过getAllAddress函数得到该用户所有地址id
            //参数类型long iConsumerID，返回类型为arraylist（需要包含System.Collections），下为实例
            addressSync iList = new addressSync();
            ArrayList list = iList.getAllAddress(1);
            //通过getAddressByID可以得到该地址id表中所有的信息，除id，consumerid外，属性可以通过：实例名.xxx = xxx来设定，所有属性可以通过：实例名.xxx获取
            for (int i = 0; i < list.Count; i++)
            {
                addressSync temp = new addressSync();
                temp.getAddressByID(Convert.ToInt64(list[i]));
                Console.WriteLine(temp.country);
            }

            //可以通过deleteAddressByID函数删除，特别注意参数类型是long,请用convert.toint64转化
            //下为实例
            iList.deleteAddressByID(Convert.ToInt64(20));
        }
    }
}

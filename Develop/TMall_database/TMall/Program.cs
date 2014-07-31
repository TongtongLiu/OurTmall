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
using MyCategory;
using MyProductCategory;
using MyStoreCategory;
using MyOrder;
using MyCart;
using MyCartProduct;
using MyComment;

namespace TMall_connectionSql
{
    class Program
    {
        public void runConsumer()
        {
            /*****************consumerSync操作说明******************/
            //构造函数经过重构，可以通过用户名来创建新的用户，如用户名存在则取出数据，存于类中mydata里
            consumerSync iuser = new consumerSync("zhaoxinyi");
            //修改，调用其中具体参数，只需要直接：实例名.xxx就可以，例如iuser.email
            iuser.email = "stefanie_xin@163.com";
        }

        public void runStore()
        {
            /*****************storeSync操作说明------未完待续******************/
            storeSync istore = new storeSync("mac专营");
            istore.description = "还负责贴膜哦！";
        }

        public void runProduct()
        {
            /*****************productSync操作说明******************/
            //构造函数经过重构，可以通过：商品名+商店id来创建新的用户
            /*productSync iproduct = new productSync("mac电脑", 1);
            //除id外可以通过：实例名.xxx = xxx来设定，所有属性可以通过：实例名.xxx获取
            iproduct.price = 10000;
            //Console.WriteLine(iproduct.price);
            //可以调用judgeIfProductExist来判断该商店的该物品是否已经存在，参数为所属商店id+商品名称
            productSync iproduct2 = new productSync();
            bool flag = iproduct2.judgeIfProductExist("mac电脑",1);
            Console.WriteLine(flag);*/

            /*productSync iproduct3 = new productSync("mac电脑", 1);
            iproduct3.price = 9000;
            Console.WriteLine(iproduct3.price);

            //构造函数经过重构，可以通过：商品id来获得用户信息
            productSync iproduct2 = new productSync(5);
            bool flag = iproduct2.judgeIfProductExist(5);
            Console.WriteLine(flag);
            Console.WriteLine(iproduct2.price);

            productSync iproduct4 = new productSync();
            for (int i = 1; i < 5; i++)
                iproduct4.deleteProductByID(Convert.ToInt64(i));*/
            productSync ipro = new productSync();
            ipro.deleteProductByID(16);
        }

        public void runCollection()
        {
            /*****************collectionSync操作说明******************/
            //构造函数经过重构，可以通过：consumerid+objecttype+objectid来创建新的收藏，其中type=1为商品，type=2为商店
            collectionSync icollection = new collectionSync(2, 1, 1);
            collectionSync icollection2 = new collectionSync(2, 1, 3);
            collectionSync icollection3 = new collectionSync(2, 1, 5);

            //由于收藏内容不存在修改问题，所有属性不可修改，但可以通过：实例名.xxx获取
            Console.WriteLine(icollection.id);

            //可以通过getAllCollection函数得到该用户所有该类型的收藏
            //参数类型long iConsumerID, int iObjectType，返回类型为arraylist（需要包含System.Collections），下为实例
            collectionSync iList = new collectionSync();
            ArrayList list = iList.getAllCollection(2,1);
            for (int i = 0; i < list.Count; i++)
                Console.WriteLine(list[i]);

            //可以通过deleteCollectionByID或deleteCollectionByDetail函数删除，特别注意参数类型是long,请用convert.toint64转化
            //下为实例
            collectionSync iList2 = new collectionSync();
            ArrayList list2 = iList.getAllCollection(2,1);
            for (int i = 0; i < list.Count; i++)
                iList.deleteCollectionByID(Convert.ToInt64(list[i]));

            //可以通过deleteCollectionByDetail函数删除，特别注意参数类型如果是long请用convert.toint64转化
            //下为实例
            collectionSync icollection4 = new collectionSync(2, 1, 5);
            collectionSync delete = new collectionSync();
            Console.ReadLine();
            delete.deleteCollectionByDetail(2, 1, 5);
        }

        public void runAddress()
        {
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

        private void runCategory()
        {
            categorySync category = new categorySync();
            ArrayList list = category.getAllCategory();
            for (int i = 0; i < list.Count; i++)
            {
                Console.WriteLine(list[i]);
            }
            //categorySync category = new categorySync("鼠标");
        }

        //每个类别销量最高的itopnum件产品（返回topnum与实际num中较小数的产品信息）
        private DataTable getTopProductByName(long iTopNum, string iCategoryName)
        {
            categorySync category = new categorySync(iCategoryName);
            product_belongto_categorySync belongs = new product_belongto_categorySync();
            ArrayList productIDList = belongs.getProductID(category.id);
            productSync product = new productSync();
            DataTable tb = product.getProductOfTopSales(iTopNum, productIDList);
            return tb;

            //外部调用示例
            //Program run = new Program();
            //DataTable test = new DataTable();
            //test = run.getTopProductByName(5, "超极本");
            //Console.WriteLine(test.Rows[2]["product_name"]);
        }



        private ArrayList getAllCategoryOfStore(long iStoreID)//获得某一商店全部经营类别
        {
            store_sell_categorySync store = new store_sell_categorySync();
            
            ArrayList categoryList = store.getStoreCategoryID(iStoreID);
            ArrayList categoryNameList = new ArrayList();
            for (int i = 0; i < categoryList.Count; i++)
            {
                categorySync category = new categorySync();
                string name = category.getCategoryByID(Convert.ToInt64(categoryList[i]));
                categoryNameList.Add(name);
            }
            return categoryNameList;

            //外部调用示例
            //Program run = new Program();
            //ArrayList list = run.getAllCategoryOfStore(1);
            //for (int i = 0; i < list.Count; i++)
            //    Console.WriteLine(list[i]);
            //Console.ReadLine();
        }

        private DataTable getAllProduct(long iStoreID)//得到某一店铺的全部商品，并按照由高到低返回
        {
            productSync product = new productSync();
            DataTable list = product.getAllProductOfStore(iStoreID);
            for (int i = 0; i < list.Rows.Count; i++)
                Console.WriteLine(list.Rows[i]["product_name"]);
                return list;
        }

        private DataTable getProductOfStoreAndCategory(long iStoreID, string iCategoryName)
        {
            categorySync category = new categorySync(iCategoryName);
            product_belongto_categorySync belongs = new product_belongto_categorySync();
            ArrayList productIDList = belongs.getProductID(category.id);
            productSync product = new productSync();
            DataTable list = product.getProductOfStoreAndCategory(iStoreID, productIDList);
            return list;

            //外部调用示例
            //Program run = new Program();
            //DataTable list = run.getProductOfStoreAndCategory(1, "笔记本");
            //for (int i = 0; i < list.Rows.Count; i++)
            //    Console.WriteLine(list.Rows[i]["product_name"]);
        }

        private void runOrder()
        {
            //构造函数经过重构，可以通过：orderSync创建新订单，创建后默认状态为
            //consumer_id = iConsumerID;
            //product_id = iProductID;
            //discount= 1;
            //state_id = 0;//待付款1，待收货2，待发货3
            //delivery_address_id = 0;
            //buy_number = 1;
            orderSync order = new orderSync(2,1);//2号用户买了1号商品
            Console.WriteLine(order.id);
            //可以通过实例名.xxx来调用所有属性，可以通过实例名.xxx = xxx来修改state_id, address_id和buynumber
            order.buy_number = 2;
            orderSync delete = new orderSync(2,2);
            delete.deleteProductByID(delete.id);
        }

        private void runCart()
        {
            //构造函数经过重构，可以通过：用户id创建新购物车，如果存在，则可以通过实例名.xxx获取，否则创建
            cartSync mycart = new cartSync(2);//2号用户的用户车
            Console.WriteLine(mycart.id);
            //可以通过传入用户id删除该用户的购物车
            cartSync delete = new cartSync(2);
            delete.deleteCartByID(2);
        }

        private void runCartProduct()
        {
            //构造函数经过重构，可以通过：CartID,ProductID新对应关系，如果存在，则可以通过实例名.xxx获取，否则创建
            cart_productSync relationship = new cart_productSync(1, 2);//2号商品属于1号用户车
            //默认quantity为1，可以修改
            relationship.quantity = 3;
            Console.WriteLine(relationship.quantity);
            //可以通过传入用户id删除某购物车的某件商品
            cart_productSync delete = new cart_productSync(1, 2);
            delete.deleteRelationship(1, 2);
        }

        //每个类别销量最高的itopnum商店（返回topnum与实际num中较小数的产品信息）
        private DataTable getTopStoreOfCategory(long iTopNum, string iCategoryName)
        {
            categorySync category = new categorySync(iCategoryName);
            store_sell_categorySync belongs = new store_sell_categorySync();
            ArrayList storeIDList = belongs.getCategoryStoreID(category.id);

            for (int i = 0; i < storeIDList.Count; i++)//求每家商店的sales总和
            {

                DataTable list = getProductOfStoreAndCategory(Convert.ToInt64(storeIDList[i]), iCategoryName);
                int total_sales = 0;
                for (int j = 0; j < list.Rows.Count; j++)
                    total_sales += Convert.ToInt32(list.Rows[0]["sales"]);
                storeSync store = new storeSync(Convert.ToInt64(storeIDList[i]));
                store.total_sales = total_sales;
            }
            storeSync iStore = new storeSync();
            DataTable tb = iStore.getStoreOfTopSales(iTopNum, storeIDList);
            return tb;

            //外部调用示例
            //Program run = new Program();
            //DataTable test = new DataTable();
            //test = run.getTopStoreOfCategory(1, "游戏本");
            //Console.WriteLine(test.Rows[0]["store_name"]);
        }

        //总销量最高的itopnum商店（返回topnum与实际num中较小数的产品信息）
        private DataTable getTopSalesStore(long iTopNum)
        {
            storeSync storeID = new storeSync();
            ArrayList storeIDList = storeID.getAllStore();
            for (int i = 0; i < storeIDList.Count; i++)//求每家商店的sales总和
            {
                productSync productList = new productSync();
                DataTable list = productList.getAllProductOfStore(Convert.ToInt64(storeIDList[i]));
                int total_sales = 0;
                for (int j = 0; j < list.Rows.Count; j++)
                    total_sales += Convert.ToInt32(list.Rows[0]["sales"]);
                storeSync store = new storeSync(Convert.ToInt64(storeIDList[i]));
                store.total_sales = total_sales;
            }
            storeSync iStore = new storeSync();
            DataTable tb = iStore.getStoreOfTopSales(iTopNum, storeIDList);
            return tb;

            //外部调用示例
            //Program run = new Program();
            //DataTable test = new DataTable();
            //test = run.getTopSalesStore(2);
            //Console.WriteLine(test.Rows[0]["store_name"]);
            //Console.WriteLine(test.Rows[1]["store_name"]);
            
        }

        private void runComment()
        {
            //构造函数经过重构，可以通过：用户id和商品id创建新评论，创建时，如果已经存在，则可通过实例名.xxx调用，不存在则创建，可通过实例名.xxx调用
            //创建后默认状态为
            //consumer_id = iConsumerID;
            //product_id = iProductID;
            //score= 5;
            //detail = "无评论";//待付款1，待收货2，待发货3
            //time与id为自动生成
            commentSync comment = new commentSync(2, 1);//2号用户评论1号商品
            Console.WriteLine(comment.id);
            Console.WriteLine(comment.time);
            //可以通过实例名.xxx来调用所有属性，可以通过实例名.xxx = xxx来修改score和detail
            comment.detail = "好好好";
            commentSync delete = new commentSync(2, 1);
            delete.deleteCommentByID(delete.id);
        }
        
        static void Main(string[] args)
        {
            Program run = new Program();
            run.runComment();
        }
    }
}

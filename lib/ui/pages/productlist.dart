import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/logic/Productlistprovider.dart';
import 'package:shopping_cart_app/ui/pages/cartlist.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black,),
        title: Text("Product List",style: TextStyle(color: Colors.black,fontSize: 36),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cartlist(),));
            }, icon: Icon(Icons.shopping_bag_outlined,size: 30,color: Colors.black,)),
          )
        ],
      ),
      body: Consumer<Productlistprovider>(builder: (ctx, provider, child) {
        ctx.read<Productlistprovider>().fetchdata();
        List productlist =  ctx.watch<Productlistprovider>().Productlist();

        return ListView.builder(itemCount: productlist.length, itemBuilder: (context, index) {
        return SizedBox( width: 50, height: 200,
          child: Card(margin: EdgeInsets.only(top: 5), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image(image: NetworkImage('https://i5.walmartimages.com/asr/9ebc1836-9bd3-407f-898f-701f43434d4a.7eb2254059c5f901761dc3d28fb002e8.jpeg'),height: 150,width: 150,),
            Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(productlist[index]['title'].length > 30 ? productlist[index]['title'].substring(0, 30) + '...': productlist[index]['title'],style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
            Text(productlist[index]['body'], overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(color: Colors.black),),
            Text('1000 USDT',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              ctx.read<Productlistprovider>().addtocartlist(productlist[index]);
            }, child: Text("Add to Cart"))
            ],),
          ],),),
        );
      },);
      },),
    );
  }
}
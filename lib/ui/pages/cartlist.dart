import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/logic/Productlistprovider.dart';

class Cartlist extends StatefulWidget {
  const Cartlist({super.key});

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  double? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black,),
        title: Text("Cart List",style: TextStyle(color: Colors.black,fontSize: 36),),
      ),
      body: Consumer(builder: (ctx, provider, _) {
        List cartlist =  ctx.watch<Productlistprovider>().Cartlist();
        return ListView.builder(itemCount: cartlist.length, itemBuilder: (context, index) {
        return ListTile(
          horizontalTitleGap: 30,
          shape: Border.symmetric(horizontal: BorderSide(width: 3)),
          trailing: SizedBox( height: 100, width: 100,
            child: Row(children: [
              IconButton(onPressed: (){
                ctx.read<Productlistprovider>().removecartproduct(cartlist[index]);
              }, icon: Icon(Icons.remove,color: Colors.white)),
              Text("${cartlist[index]['quantity'].toString()}",style: TextStyle(fontSize: 15,color: Colors.white),),
              IconButton(onPressed: (){
                ctx.read<Productlistprovider>().addtocartlist(cartlist[index]);
              }, icon: Icon(Icons.add,color: Colors.white)),
            ],),
          ),
          title: Text(cartlist[index]['title'],style: TextStyle(color: Colors.white),),
          subtitle: Text("${cartlist[index]['body']}\n${cartlist[index]['price']} USD",style: TextStyle(color: Colors.white),),
          leading: Image(image: NetworkImage("https://i5.walmartimages.com/asr/9ebc1836-9bd3-407f-898f-701f43434d4a.7eb2254059c5f901761dc3d28fb002e8.jpeg")),
        );
      },);
      },),
      bottomNavigationBar: Consumer(builder: (ctx, provider, _) {
        List cartlist =  ctx.watch<Productlistprovider>().Cartlist();
        return Container(height: 100,width: double.infinity,color: Colors.white,child: ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.zero)), backgroundColor: Colors.green), onPressed: (){}, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("Total Amount: ${price = ctx.watch<Productlistprovider>().totalamount(cartlist)} USDT",style: TextStyle(color: Colors.white,fontSize: 18),),
        Text("Place Order",style: TextStyle(color: Colors.white,fontSize: 28),)
      ],)),);
      },)
    );
  }
}
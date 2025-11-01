import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/logic/Productlistprovider.dart';
import 'package:shopping_cart_app/ui/pages/productlist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Productlistprovider>(listen: false, context).fetchdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
          Center(child: Text("Welcome to ",style: TextStyle(fontSize: 36,color: Colors.white),)),
          Center(child: Text("Shopping Cart APP.",style: TextStyle(fontSize: 35,color: Colors.white),)),
          ],),
          SizedBox(height: 60, width: 280, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Productlist(),));
          }, child: Text("Get Started",style: TextStyle(fontSize: 28, color: Colors.white),)))
        ],
      ),
    );
  }
}
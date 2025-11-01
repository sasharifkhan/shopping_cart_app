import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Productlistprovider extends ChangeNotifier {

  List<dynamic> _productlist = [];
  List<dynamic> _cartlist = [];



  Cartlist()=> _cartlist;

  Productlist()=> _productlist;
  
  Future <List<dynamic>?> fetchdata() async {

      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200){
        final jsondata = jsonDecode(response.body) as List;
        var random = Random();
        _productlist = jsondata.map((item) {
          item['price'] = (random.nextInt(100)+10);
          return item;
        }).toList();
        }
      return null;

  }

  addtocartlist(productlist){
    _cartlist.add(productlist);
    notifyListeners();
  }

  removecartproduct(cartlist){
    _cartlist.remove(cartlist);
    notifyListeners();
  }
  totalamount(List cartlist){
    cartlist;
    return 100;
  }

}
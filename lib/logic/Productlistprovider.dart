import 'dart:convert';

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

        _productlist =jsondata;

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

}
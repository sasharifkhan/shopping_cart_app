import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_app/logic/Productmodels.dart';

class Productlistprovider extends ChangeNotifier {
  Future <List<Productmodels>?> fetchdata() async {
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200){
        final jsondata = jsonDecode(response.body) as List;
        print(jsondata);
        
        
      
        }
      return null;

  }
}
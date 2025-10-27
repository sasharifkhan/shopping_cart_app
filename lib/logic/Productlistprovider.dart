import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Productlistprovider extends ChangeNotifier {
  Future <Map<String,dynamic>?> fetchdata() async {
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200){
        final jsondata = jsonDecode(response.body) as List;
        print(jsondata);
        
      
        }

  }
}
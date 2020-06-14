import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;

class UploadApiProvider{
  Future uploadImage(String apiKey, Image filename) async{
    final response = await Client().post("http://127.0.0.1:5000/api/upload", 
                                      headers: {
                                        "Authorization": apiKey, 
                                      },
                                      body:{
                                        'name': filename, 
                                      });

    final Map result = json.decode(response.body); 
    if(response.statusCode == 201){
      print("Uploaded Success"); 
    }
  }
}


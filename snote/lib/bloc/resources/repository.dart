import 'dart:async';
import 'dart:io';
import 'user_api.dart';
import 'content_api.dart';
import 'package:snote/models/classes/contents.dart';
import 'package:snote/bloc/resources/upload_api.dart';
import 'package:flutter/material.dart'; 

class Respository{
  final user_apiProvider = UserApiProvider(); 
  final content_apiProvider = ContentApiProvider(); 
  final uploadContent_apiProvider = UploadApiProvider();

  // User 
  Future siginUser(String username, String password, String api_key) => user_apiProvider.signinUser(username, password, api_key);


  // Content
  Future<List<Content>> getContent(String apiKey) => content_apiProvider.getContent(apiKey);

  // Upload
  Future uploadImage(String apiKey, File fileName) => uploadContent_apiProvider.uploadImage(apiKey, fileName);
  
  // Download files 
  Future<File> getImage(String apiKey) => uploadContent_apiProvider.getImage(apiKey);

  
}

import 'dart:convert'; 
import 'dart:async';
import 'package:http/http.dart' show Client; 
import 'package:snote/models/classes/contents.dart';

class ContentApiProvider{
  
  Future<List<Content>> getContent(String apiKey) async {
    List<Content> contents = [];
    final response = await Client().get("http://127.0.0.1:5000/api/content", 
                                      headers: {
                                        "Authorization": apiKey, 
                                      });

    final Map result = json.decode(response.body);
    if(response.statusCode == 200){
      for(Map json_ in result["data"]){
        contents.add(Content.fromJson(json_));
      }
    }
    return contents; 
  }

  
}
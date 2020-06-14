import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client; 
import 'package:shared_preferences/shared_preferences.dart';

class UserApiProvider{

  void saveApiKey(String api_key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    prefs.setString("API_Token", api_key); 
  }

  Future signinUser(String username, String password, String api_key) async {
    final response = await Client().post("http://127.0.0.1:5000/api/signin", 
                                        headers: {
                                          "Authorization": api_key,
                                        },
                                        body: jsonEncode({
                                          "username": username, 
                                          "password": password, 
                                        }));

    final Map result = json.decode(response.body); 
    if(response.statusCode == 201){
      try{
        await saveApiKey(result["Data"]["api_key"]);
      } catch (Exception){}
      
    } else {
      throw Exception("Failed to execute"); 
    }
  }
}
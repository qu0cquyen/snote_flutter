import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:snote/models/classes/users.dart';

Future<User> getUser() async{
  final response = await http.get('http://127.0.0.1:5000/api/signup');
  if(response.statusCode == 200){
    return User.fromJson(json.decode(response.body)); 
  } else {
    throw Exception('Failed to load User'); 
  }
}

Future<User> registerUser(String username, String password, String firstname, String lastname, String email) async{
  final response = await http.post('http://127.0.0.1:5000/api/signup', 
                            body: jsonEncode({
                              'username': username, 
                              'password': password, 
                              'firstname': firstname, 
                              'lastname': lastname, 
                              'email': email
                            }));
  if(response.statusCode == 201){
    return User.fromJson(json.decode(response.body)); 
  } else {
    throw Exception(json.decode(response.body));
  }

}

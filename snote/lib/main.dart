import 'package:flutter/material.dart';
import 'package:snote/ui/content_page.dart'; 
import 'package:snote/ui/login_page.dart';
import 'package:snote/ui/home_page.dart';
import 'package:snote/ui/writing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
        debugShowCheckedModeBanner: false,
        home: HomePage()
    ); 
  }
}
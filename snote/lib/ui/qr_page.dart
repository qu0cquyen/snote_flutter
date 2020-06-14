import 'package:flutter/material.dart';
import 'package:snote/models/global.dart'; 
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget{
  @override
  _QRPageState createState() => _QRPageState(); 
}

class _QRPageState extends State<QRPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios), 
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Center(
                child: QrImage(
                  data: "UserID goes here / API Key", 
                  version: QrVersions.auto, 
                  size: 250.0,
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
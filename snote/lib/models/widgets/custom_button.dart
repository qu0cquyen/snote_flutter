import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:snote/models/global.dart';
import 'package:snote/ui/writing_page.dart';

class CustomButton extends StatelessWidget{
  final String btnContent; 
  final double btnWidth; 
  final double btnHeight; 

  CustomButton({@required this.btnContent, @required this.btnWidth, @required this.btnHeight});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15), 
      height: btnHeight, 
      width: btnWidth,
      child: RaisedButton(
        onPressed: () => {
          if(btnContent == "Manually"){
            Navigator.pop(context), 
            Navigator.push(context, CupertinoPageRoute(
                builder: (context) => WritingPage(), 
              )
            )
          }
        },  
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: btnBackgroundColor,
        child: Text(
          btnContent,  
          style: TextStyle(
            color: Colors.white, 
            letterSpacing: 1.5,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
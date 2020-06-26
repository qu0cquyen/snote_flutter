import 'package:flutter/material.dart'; 

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
        onPressed: () => {},  
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF187CBD),
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
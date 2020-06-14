import 'package:flutter/material.dart';

class CusRecShape extends RoundedRectangleBorder{
  final double padding; 
  
  CusRecShape({@required this.padding, side=BorderSide.none, borderRadius=BorderRadius.zero}):
             super(side: side, borderRadius: borderRadius); 
  
  @override 
  Path getOuterPath(Rect rect, {TextDirection textDirection}){
    Paint paint = Paint(); 
    paint.style = PaintingStyle.fill; 
    paint.color = Colors.teal; 

    // 12 12, 16 - 16
    Path path =  Path(); 
    path.moveTo(rect.width - 16.0, rect.top + 5.0);
    path.lineTo(rect.width - 28.0, rect.top );
    path.lineTo(rect.width - 40.0, rect.top + 5.0);
    path.addRRect(borderRadius.resolve(textDirection)
                 .toRRect(Rect.fromLTWH(rect.left, rect.top + 5.0, rect.width, rect.height - padding))); 

    return path; 
      
  }
}
import 'dart:io';

import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget{
  final String title; 
  final String description; 
  final double rate;
  final File bannerImg; 

  const ContentBox({Key key, this.title, this.description, this.rate, this.bannerImg}) : super(key: key); 

  @override
  Widget build(BuildContext context){
   
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                //height: 180/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20), 
                      topRight: const Radius.circular(20)),
                    image: DecorationImage(
                      image: bannerImg == null ? AssetImage("images/banner.jpg") : FileImage(bannerImg),
                      fit: BoxFit.fill,
                    ),
                  ),  
                  //child: Image.file(bannerImg),            
                ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity, // Match_parent 
                padding: const EdgeInsets.all(10),                                             
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20), 
                    bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child:Text(title, textAlign: TextAlign.left,),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(rate.toString(), textAlign: TextAlign.right,),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(description, textAlign: TextAlign.left,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
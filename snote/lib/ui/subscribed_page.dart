import 'package:flutter/material.dart'; 
import 'package:snote/models/global.dart'; 


class SubScribePage extends StatefulWidget{
  @override
  _SubScribePageState createState() => _SubScribePageState(); 
}

class _SubScribePageState extends State<SubScribePage>{


  ListView _subjectList(){
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Machine Learning"), 
        ),

        ListTile(
          title: Text("OOP"),
        ),
      ],
    );

  }

  ListView _followerList(){
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Followed 1"),
          trailing: Icon(Icons.subscriptions), 
        ),

        ListTile(
          title: Text("Followed 2"), 
          trailing: Icon(Icons.subscriptions),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: <Widget>[
            // Banner / Title Bar 
            Expanded(
              flex: 1, 
              child: Container(
                alignment:Alignment.center,
                child: Text("Subscribed"), 
                
              ),
            ), 

            // Title [Subject - Followed]
            Expanded(
              flex: 1, 
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[400]),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1,
                            color: Colors.grey[400],
                            
                          ),
                        ),
                      ),
                      child: Text("Subject"), 
                    ),

                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 102,
                      
                      child: Text("Following"),
                    ),
                  ],
                
                ),
              ), 
            ), 

            // Main Contents
            Expanded(
              flex: 9, 
              child: Container(
                
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      child: _subjectList(),
                      
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 102,
                      child: _followerList(),
                    ),  
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
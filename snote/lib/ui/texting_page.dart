import 'package:flutter/material.dart'; 
import 'package:snote/models/global.dart';
import 'package:snote/util/cus_rec_shape.dart';

class TextPage extends StatefulWidget{

  @override
  _TextPageState createState() => _TextPageState(); 
}

class _TextPageState extends State<TextPage>{
  final List<String> friendList = new List<String>();

  

  Widget _buildFriendBox(String image, String friendName){
    return Column(
      children: <Widget>[
          ListTile(
            leading: Icon(Icons.person), // Put profile image here 
            title: Text(friendName), 
          ),
          Divider(),
        ]
      );
  }

  List<PopupMenuEntry<Object>> _listItemPopupMenu(){
    var list = List<PopupMenuEntry<Object>>(); 
    list.add(PopupMenuItem(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text("QR Scan", style: TextStyle(color: Colors.white)),                                                            
        leading: Icon(Icons.linear_scale, color: Colors.white), 
      ), 
      value: 0,  
    ));

    list.add(PopupMenuItem(height: 0, child: Divider()));

    list.add(PopupMenuItem(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text("Contacts", style: TextStyle(color: Colors.white)),                                    
        leading: Icon(Icons.contacts, color: Colors.white), 
      ),
      value: 1, 
    ));

    list.add(PopupMenuItem(height: 0, child: Divider()));

                
    return list; 
  }


  Widget _buildPopupMenu(){
    return Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.teal),
            child: PopupMenuButton(
              itemBuilder: (context) => _listItemPopupMenu(), 
              shape: CusRecShape(padding: 10, borderRadius: BorderRadius.circular(10)), 
              icon: Icon(Icons.person_add),
              offset: Offset(0, 40),
            ),
          );
  }

  @override
  Widget build(BuildContext context){ 
    for(int i = 1; i <= 10; i++){
      friendList.add("Friend " + i.toString()); 
    }

    
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    flex: 1, 
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6, 
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: "Search....", 
                                  suffixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1, 
                            child: _buildPopupMenu(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1, 
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Friend's story"),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ), 
                    ),
                  ),
                  Expanded(
                    flex: 8, 
                    child: Container(
                      child: ListView.builder(
                        itemCount: friendList.length, 
                        itemBuilder: (BuildContext context, int index){
                          return _buildFriendBox("Reserved", friendList[index]); 
                        },
                      ), 
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
  
  
}
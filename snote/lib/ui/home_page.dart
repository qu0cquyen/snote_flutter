import 'package:flutter/material.dart';
import '../presentation/bottomNavigationBarIcons.dart';
import 'package:snote/models/global.dart';
import 'package:snote/ui/personal_page.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState(); 

}

class _HomePageState extends State<HomePage>{

  Widget _buildSearchBar(){
    return Container(
      height: 40,
      color: backgroundColor,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => print("Search function activated"),
        child: Container(
          width: 32,
          height: 32, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/search.png"), 
            ),
          ),
        ),
      ),
    );          
  }

  List<Widget> _buildContentBox(){
    List listContentBox = new List<Widget>(); 
    for(int i = 0; i < 10; ++i){
      listContentBox.add(
        Container(
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
                        image: AssetImage("images/banner.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),                                           
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
                            child:Text("Title", textAlign: TextAlign.left,),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text("Rate", textAlign: TextAlign.right,),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text("Description", textAlign: TextAlign.left,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }
    return listContentBox; 
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 5, 
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                TabBarView(
                  children: <Widget>[
                    Container(
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              // Search bar 
                              _buildSearchBar(), 
                              
                              // List View                              
                              Container(
                                height: MediaQuery.of(context).size.height - 100,
                                color: backgroundColor,
                                child: ListView(
                                  children: _buildContentBox(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      color: backgroundColor, 
                    ),
                    // Subscribers
                    Container(
                      color: Colors.greenAccent,
                    ),
                    // Add Content
                     Container(
                      color: Colors.red, 
                    ),
                    // Messenger
                    Container(
                      color: Colors.greenAccent,
                    ),
                    // Personal
                     Container(
                      child: PersonalPage(), 
                    ),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1, 
                  color: Colors.grey[400], 
                ),
              ),           
              child: TabBar(               
                tabs: [
                  Tab(
                    icon: Icon(MyFlutterApp.home_outline),
                  ), 

                  Tab(
                    icon: Icon(MyFlutterApp.star),
                  ),

                  Tab(
                    icon: Icon(MyFlutterApp.add_to_photos), 
                  ),

                  Tab(
                    icon: Icon(MyFlutterApp.comment), 
                  ),

                  Tab(
                    icon: Icon(MyFlutterApp.perm_identity), 
                  ),
                ],
                indicatorColor: Colors.transparent,
                labelColor: Colors.lightBlueAccent,
                unselectedLabelColor: Colors.grey,

              ),
            ),
            backgroundColor: backgroundColor,          
          ),
        ),
      
    );
  }
}
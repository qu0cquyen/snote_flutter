import 'package:flutter/material.dart'; 
import 'package:snote/models/global.dart'; 

class PersonalPage extends StatefulWidget{
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 

  // Open Drawer
  void _openDrawer(){
    _scaffoldKey.currentState.openEndDrawer(); 
  }

  // Close Drawer
  void _closeDrawer(){
    Navigator.of(context).pop();
  }

  // Build Banner
  Widget _buildBanner(){
    return Container(
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/cat_banner.png"),
            fit: BoxFit.fill, 
          ),
        ),
        // Burger Icon
        child: GestureDetector(
          onTap: () => _openDrawer(), 
          child: Container(
            width: 32,
            height: 32, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/ic_burger.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ); 
  }

  Widget _buildPersonalInfo(){
    return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,  // 30% 
              // Profile Picture
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/profile_img.png"), 
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Expanded(
              flex: 7, // 70% 
              child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Name"),
                        Text("DoB"), 
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("School"), 
                      ],
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Follower"),
                              Text("Following"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 12, top: 5, bottom: 5),
                                child: Text("100"),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 12, top: 5, bottom: 5),
                                child: Text("1000"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  List<Widget> _getListFeatures(){
    List<Widget> listFeatures = List(); 

    // My notes 
    listFeatures.add(
      ListTile(
        title: Text("My notes"), 
        trailing: Icon(Icons.navigate_next),
        onTap: () => print("Go to my Notes page"), 
      ),
    );

    // Achievements
    listFeatures.add(
      ListTile(
        title: Text("Achievements"), 
        trailing: Icon(Icons.navigate_next), 
        onTap: () => print("Go to Achievement Page"), 
      ),
    ); 

    return listFeatures; 
  }

  List<Widget> drawerList(){
    List<Widget> listSettings = new List(); 

    // QR Code
    listSettings.add(
      ListTile(
        title: Text("QR Code"),
        onTap: () => print("Open QR Code Page"),
      ),
    );

    // Edit Profile
    listSettings.add(
      ListTile(
        title: Text("Edit Profile"),
        onTap: () => print("Open Edit Profile Page"), 
      ),
    );

    // Account Management
    listSettings.add(
      ListTile(
        title: Text("Account Management"), 
        onTap: () => print("Open Account Management Page"), 
      ),
    );

    return listSettings; 
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        key: _scaffoldKey, 
        backgroundColor: backgroundColor,
        body: Column(
          children: <Widget>[
            // Banner
            Expanded(
              flex: 2, 
              child: _buildBanner(),
            ),
            
            // Personal Info 
            Expanded(
              flex: 2, 
              child: _buildPersonalInfo(),
            ),

            // List of Features
            Expanded(
              flex: 6, 
              child: Container(
                child: ListView(
                  children: _getListFeatures(),
                ),
              ), 
            ),
          ],
        ),
        // Drawer Components -- Drawer automatically enables swipping to open drawer
        endDrawer: Container(
          color: backgroundColor,
          width: MediaQuery.of(context).size.width / 2,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: backgroundColor,
            ),
            child: Drawer(
              child: ListView(
                children: drawerList(),
              ),
            ),
          ),
        ),
      );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snote/bloc/blocs/content_bloc_provider.dart';
import 'package:snote/models/classes/contents.dart';
import 'package:snote/models/widgets/content_box_widget.dart';
import 'package:snote/models/global.dart';
import 'package:snote/ui/content_page.dart';
import 'package:snote/ui/personal_page.dart';
import 'package:snote/ui/login_page.dart';
import 'package:snote/bloc/blocs/user_bloc_provider.dart';
import 'package:snote/ui/subscribed_page.dart';
import 'package:snote/ui/texting_page.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState(); 

}

class _HomePageState extends State<HomePage>{
  String apiKey = ""; 
  int _selectedIndex = 0; 
  bool _showBottomSheet = false; 
  ContentBloc contentBloc; 
 

  PageController _pageController = new PageController(); 

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

  Widget _buildContentBox(BuildContext context, List<Content> contentList){
    return ListView.builder(
      itemCount: contentList.length,
      itemBuilder: (BuildContext context, int index){
        return InkWell(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) => ContentPage(apiKey: apiKey,)));
            }, 
            child: ContentBox(title: contentList[index].title, rate: contentList[index].rate, description: contentList[index].description),
        );
      }
    );
  }

  Widget homeUIRender(){
    contentBloc = ContentBloc(apiKey);
    List<Widget> _widgetOptions = <Widget>[
      SafeArea(
        child: GestureDetector(
          onTap: () => setState((){
            _showBottomSheet = false; 
          }),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Search bar 
                _buildSearchBar(), 
                
                // List View                              
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  color: backgroundColor,
                  child: StreamBuilder(
                    stream: contentBloc.contents,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return _buildContentBox(context, snapshot.data);
                      }
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()
                      );
                    }, 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Subscribers
      Container(
        child: SubScribePage(),
      ),

      // Add Content
      // GestureDetector(
      //   onTap: () {
      //     showModalBottomSheet(
      //       context: context, 
      //       builder: (BuildContext context){
      //         return Container(
      //           color: Colors.grey[900], 
      //           height: 250,
      //         );
      //       }
      //     );
      //   }
      // ),

      // Container(
      //   child: GestureDetector(
      //     onTap: (){
            
      //       showModalBottomSheet(
      //         context: context, 
      //         builder: (BuildContext context){
      //           return Container(
      //             color: Colors.grey[900],
      //             height: 250,
      //           );  
      //         }
      //       );
      //     }
      //   ),
        
      // ),
      // Messenger
      Container(
        child: TextPage(),
      ),
      // Personal
        Container(
        child: PersonalPage(), 
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: backgroundColor,
          body:  Center(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => {
                  setState((){
                    _selectedIndex = index; 
                    
                    
                  }),
                },
                children: _widgetOptions,
              ),
          ),
          
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: backgroundColor), 
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[400]),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home), 
                    title: Text("Home"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star), 
                    title: Text("Subsciber"),
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.add_circle),
                  //   title: Text("Add"),
                    
                  // ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    title: Text("Message"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.perm_identity), 
                    title: Text("Personal"), 
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.lightBlueAccent,
                unselectedItemColor: Colors.black12,
                showUnselectedLabels: true,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      
    );
  }

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index; 
      _pageController.animateToPage(_selectedIndex, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void login(){
    setState((){
      build(context);
    });
  }

  Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userBloc.signinUser("", "", prefs.getString("API_Token"));
    return prefs.getString("API_Token");
  }

  Future signinUser() async {
    return getApiKey();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: signinUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          apiKey = snapshot.data;
        }
        return apiKey.length > 0 ? homeUIRender() : LoginPage(login: login, newUser: false); 
      },
    );
  }
  
}
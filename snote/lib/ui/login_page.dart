import 'package:flutter/material.dart';
import 'package:snote/ui/signup_page.dart';
import 'package:snote/ui/home_page.dart';
import 'package:snote/models/global.dart';
import 'package:snote/models/classes/users.dart';
import 'package:snote/bloc/blocs/user_bloc_provider.dart';
//import 'package:snote/respository/user_repository.dart'; 


class LoginPage extends StatefulWidget{
  final VoidCallback login; 
  final bool newUser; 
  LoginPage({Key key, this.login, this.newUser}) : super(key: key); 

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState  extends State<LoginPage> with TickerProviderStateMixin{
  AnimationController controller; 
  Animation<double> _fadeIn; 
  Animation<double> _translateLeft; 
  Animation<double> _translateRight; 
  Animation<double> _translateY; 

  //Username and Password Text Controller 
  TextEditingController usernameController = new TextEditingController(); 
  TextEditingController passwordController = new TextEditingController(); 

  InputDecoration _usernameDecorator; 
  InputDecoration _passwordDecorator; 

  InputDecoration _usernameInputDecoration = new InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), 
    ),
    hintText: "User name",
    prefixIcon: Icon(Icons.person), 
  );

  InputDecoration _passwordInputDecoration = new InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), 
    ),
    hintText: "Password",
    prefixIcon: Icon(Icons.lock), 
  );

  InputDecoration _errorUsernameInputDecoration = new InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.redAccent, 
      ),
    ),
    hintText: "User name", 
    labelText: "Required",
    labelStyle: TextStyle(color: Colors.redAccent),
    prefixIcon: Icon(Icons.person), 
    suffixIcon: Icon(Icons.error_outline, color: Colors.redAccent), 
  );

  InputDecoration _errorPasswordInputDecoration = new InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.redAccent, 
      ),
    ),
    hintText: "Password", 
    labelText: "Required",
    labelStyle: TextStyle(color: Colors.redAccent),
    prefixIcon: Icon(Icons.lock), 
    suffixIcon: Icon(Icons.error_outline, color: Colors.redAccent), 
  );

  // Animation 
  @override
  void initState(){
    super.initState();
    
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000)); 
    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(controller); 
    _translateLeft = Tween<double>(begin: 130.0, end: 0.0).animate(controller); 
    _translateRight = Tween<double>(begin: -130.0, end: 0.0).animate(controller); 
    _translateY = Tween<double>(begin: 200, end: 0.0).animate(controller); 
   

    controller.addListener(() {
      setState(() {}); 
    });

    controller.forward();

    // Text Box Decoration setup
    _usernameDecorator = _usernameInputDecoration; 
    _passwordDecorator = _passwordInputDecoration; 
  }

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    controller.dispose();
    super.dispose();
  }

  Widget _pageAnimationX(Animation<double> animation, Widget child){
    return Opacity(
      opacity: _fadeIn.value,
      child: Transform.translate(
        offset: Offset(animation.value, 0), 
        child: child, 
      ),
    );
  }

  Widget _pageAnimationY(Animation<double> animation, Widget child){
    return Opacity(
      opacity: _fadeIn.value, 
      child: Transform.translate(
        offset: Offset(0, animation.value), 
        child: child, 
      ),
    );
  }


  Widget _buildUserName(){
    return Container(
      margin: const EdgeInsets.all(15),
      height: 52,
      child: TextFormField(
        controller: usernameController, 
        textAlign: TextAlign.start,
        decoration: _usernameDecorator, 
        // decoration: InputDecoration(
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   prefixIcon: Icon(Icons.person),
        //   hintText: "User name",
        // ),
      ),
    );
  }

  Widget _buildPassword(){
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      height: 52,
      child: TextFormField(
        controller: passwordController,
        textAlign: TextAlign.start, 
        keyboardType: TextInputType.visiblePassword, 
        decoration: _passwordDecorator, 
        // decoration: InputDecoration(
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10), 
        //   ),
        //   prefixIcon: Icon(Icons.lock), 
        //   hintText: "Password",
        // ),
      ),
    ); 
  }

  Widget _buildLoginButton(){
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15), 
      height: 52, 
      width: 180,
      child: RaisedButton(
        onPressed: () => userLogin(usernameController.text, passwordController.text),  // Check User Name and Password here 
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF187CBD),
        child: Text(
          "LOGIN", 
          style: TextStyle(
            color: Colors.white, 
            letterSpacing: 1.5,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Don't have an account?",
            style: labelStyle), 

        GestureDetector(
        onTap:() => navigationSubPage(context, SignUpPage()), // Move to SigUp page
        child: Text("Sign up", 
            style: signUpStyle,           
        ),
      )
      ],
    );
      
  
  }

  void userLogin(String username, String password){
    if(username.length == 0){
      setState((){
        _usernameDecorator = _errorUsernameInputDecoration; 
      });
    } else { 
      setState((){
        _usernameDecorator = _usernameInputDecoration; 
      });
    }

    if(password.length == 0){
      setState((){
        _passwordDecorator = _errorPasswordInputDecoration; 
      });
    } else {
      setState((){
        _passwordDecorator = _passwordInputDecoration;
      });
    }
    
    if(username.length > 0 && password.length > 0){
      userBloc.signinUser(username, password, "").then( (_){
        widget.login(); 
      });
    }
  }

  void navigationSubPage(BuildContext context, Widget child) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));

  }

  @override 
  Widget build(BuildContext context){
    //getUser();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), 
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: backgroundColor,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("images/login_page.png"), 
              //     fit: BoxFit.cover, 
              //   ),
              // ),
            ),

            Center(
                child: Container(
                width: 250,
                height: 300,
                margin: const EdgeInsets.only(top: 60),
                //margin: EdgeInsets.only(top: 230, left: 60 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/light_bub.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    _pageAnimationX(_translateLeft, _buildUserName()),
                    _pageAnimationX(_translateRight, _buildPassword()),
                    _pageAnimationY(_translateY, _buildLoginButton()),
                    _pageAnimationY(_translateY, _buildSignUp()),
                    
                    // Test get API request
                    // FutureBuilder<User>(
                    //   future: futureUser,
                    //   builder: (context, snapshot){
                    //     if(snapshot.hasData){
                    //       print("Data Here?");
                    //       print(snapshot.data.api_key); 
                    //     } else {
                    //       print(snapshot.error);
                    //     }
                    //   }
                    // ),
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
import 'package:flutter/material.dart'; 
import 'package:snote/models/global.dart'; 
import 'package:snote/respository/user_repository.dart'; 
import 'package:snote/models/classes/users.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState(); 
}




class _SignUpState extends State<SignUpPage>{
  TextEditingController usernameController = new TextEditingController(); 
  TextEditingController passwordController = new TextEditingController(); 
  TextEditingController firstnameController = new TextEditingController(); 
  TextEditingController lastnameController = new TextEditingController(); 
  TextEditingController emailController = new TextEditingController(); 

  Future<User> user; 


  Widget _buildUsername(){
    return TextFormField(
      controller: usernameController, 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(Icons.perm_identity), 
        hintText: "User name",
      ),
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      controller: passwordController, 
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        prefixIcon: Icon(Icons.lock), 
        hintText: "Password",
      ),
    );
  }

  Widget _buildEmailAddress(){
    return TextFormField(
      controller: emailController, 
      keyboardType: TextInputType.emailAddress, 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        prefixIcon: Icon(Icons.email), 
        hintText: "Email address"
      ),
    );
  }

  Widget _buildFirstName(){
    return TextFormField(
      controller: firstnameController, 
      keyboardType: TextInputType.text, 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        prefixIcon: Icon(Icons.person), 
        hintText: "First name",
      ),
    );
  }

  Widget _buildLastName(){
    return TextFormField(
      controller: lastnameController, 
      keyboardType: TextInputType.text, 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        prefixIcon: Icon(Icons.person), 
        hintText: "Last name", 
      ),
    );
  }

  Widget _buildSignUpButton(){
    return ButtonTheme(
      minWidth: 150,
      child: RaisedButton(
        onPressed: (){
          //print(usernameController.text);
          setState((){
            user = registerUser(usernameController.text, passwordController.text, 
                      firstnameController.text, lastnameController.text, emailController.text); 
            user.then((result) => {
              print(result.api_key)
            });
          });
          
        },
        elevation: 10,
        color: Color(0xFF187CBD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text("Sign Up", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Container(
            width: 250, 
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome", 
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40.0,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.bold,
                  )),
                SizedBox(height: 5),
                //User name
                _buildUsername(),
                SizedBox(height: 5),
                //Password
                _buildPassword(),
                SizedBox(height: 5),
                // Email Address
                _buildEmailAddress(),
                SizedBox(height: 5), 
                // First name
                _buildFirstName(),
                SizedBox(height: 5), 
                // Last name
                _buildLastName(),
                SizedBox(height: 5), 
                // Sign Up Button
                _buildSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}
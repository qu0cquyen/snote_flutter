class User{
  int id;
  String username;
  String password;
  String firstname; 
  String lastname; 
  String email; 
  String api_key;  

  User({this.id, this.username, this.password, 
        this.firstname, this.lastname, this.email, this.api_key});
  
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id : json['id'],
      username : json['username'], 
      password : json['password'], 
      firstname : json['firstname'], 
      lastname : json['lastname'], 
      email : json['email'], 
      api_key : json['api_key']
    );
  }
}
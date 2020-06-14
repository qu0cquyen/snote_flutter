import 'package:snote/bloc/resources/repository.dart'; 
import 'package:snote/models/classes/users.dart'; 
import 'package:rxdart/rxdart.dart'; 

class UsersBloc{
  final _repository = Respository(); 
  final _usersFetcher = PublishSubject<User>(); 

  Stream<User> get getUser => _usersFetcher.stream;

  signinUser(String username, String password, String api_key) async {
    User user = await _repository.siginUser(username, password, api_key); 
    _usersFetcher.sink.add(user);
  }

  dispose(){
    _usersFetcher.close(); 
  }
}

final userBloc = UsersBloc(); 
import 'package:rxdart/rxdart.dart';
import 'package:snote/bloc/resources/repository.dart';
import 'package:snote/models/classes/contents.dart';


class ContentBloc{
  final _repository = Respository(); 
  final _contentSubject = BehaviorSubject<List<Content>>(); 

  var _contents = <Content>[]; 

  ContentBloc(String apiKey){
    _udpateContents(apiKey).then((_){
      _contentSubject.add(_contents);
    });
  }

  Stream<List<Content>> get contents => _contentSubject.stream; 

  Future<Null> _udpateContents(String apiKey) async {
    _contents = await _repository.getContent(apiKey); 
  }

  Future<List<Content>> initialLoad(String apiKey) async {
    return await _repository.getContent(apiKey);
  }

  void dispose(){
    _contentSubject.close(); 
  }

}
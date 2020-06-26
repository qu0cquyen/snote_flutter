import 'dart:io';
import 'package:rxdart/rxdart.dart'; 
import 'package:snote/bloc/resources/repository.dart'; 


class UploadBloc{
  final _repository = Respository(); 
  final _uploadSubject = PublishSubject<File>(); 

  Stream<File> get upload => _uploadSubject.stream; 

  Future uploadImage(String apiKey, File fileName) async {
    print("Inside Bloc");
    return  _uploadSubject.sink.add(await _repository.uploadImage(apiKey, fileName)); 
  }

  void dispose(){
    _uploadSubject.close(); 
  }
  
}
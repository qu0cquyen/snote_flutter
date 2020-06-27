import 'dart:io';
import 'package:rxdart/rxdart.dart'; 
import 'package:snote/bloc/resources/repository.dart'; 


class UploadBloc{
  final _repository = Respository(); 
  final _uploadSubject = PublishSubject<File>(); 
  final PublishSubject<File> _getImageSubject = PublishSubject<File>(); 

  Stream<File> get upload => _uploadSubject.stream; 

  Stream<File> get download => _getImageSubject.stream; 

  Future uploadImage(String apiKey, File fileName) async {
    return  _uploadSubject.sink.add(await _repository.uploadImage(apiKey, fileName)); 
  }

  Future<File> getImage(String apiKey) async{
    File imgFile; 


    //return await _repository.getImage(apiKey);
    print("Inside Bloc get Image");
    imgFile = await _repository.getImage(apiKey); 
    _getImageSubject.sink.add(imgFile); 
    
    //print(imgFile);
    return imgFile; 

    
  }

  void dispose(){
    _uploadSubject.close(); 
    _getImageSubject.close(); 
  }
  
}
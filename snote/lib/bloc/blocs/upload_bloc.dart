import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart'; 
import 'package:snote/bloc/resources/repository.dart'; 


class UploadBloc{
  final _repository = Respository(); 
  final _uploadSubject = PublishSubject<String>(); 

  Stream<String> get upload => _uploadSubject.stream; 

  Future<Null> uploadImage(String apiKey, Image fileName) async {
    return  _uploadSubject.sink.add(await _repository.uploadImage(apiKey, fileName)); 
  }
  
}
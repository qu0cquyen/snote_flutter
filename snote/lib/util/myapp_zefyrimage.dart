import 'package:zefyr/zefyr.dart'; 
import 'package:flutter/material.dart'; 
import 'package:image_picker/image_picker.dart'; 
import 'dart:io'; 



class MyAppZefyrImageDelegate implements ZefyrImageDelegate<ImageSource>{
  
   @override
  // implement cameraSource
  ImageSource get cameraSource => ImageSource.camera; 

  @override
  // implement gallerySource
  ImageSource get gallerySource => ImageSource.gallery;


  @override
  Future<String> pickImage(ImageSource source) async {
    // implement pickImage
    // ignore: deprecated_member_use
    final file = await ImagePicker.pickImage(source: source);
    if(file == null) return null; 
    return file.uri.toString(); 
  }


  @override
  Widget buildImage(BuildContext context, String key){
    final file = File.fromUri(Uri.parse(key)); 
    /// Create standard [FileImage] provider. If [key] was an HTTP link
    /// we could use [NetworkImage] instead.

    final image = FileImage(file); 
    return Image(image: image); 
    
  }

 

  
  
  

}
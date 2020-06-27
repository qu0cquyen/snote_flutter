import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart'; 

class UploadApiProvider{
  Future uploadImage(String apiKey, File filename) async{
    var uri = "http://127.0.0.1:5000/api/upload"; 
    var request = http.MultipartRequest('POST', Uri.parse(uri));

    Map<String, String> header = {"Authorization": apiKey};
    request.headers.addAll(header);

    request.files.add(
      http.MultipartFile.fromBytes(
        'picture', 
        filename.readAsBytesSync(), 
        filename: filename.path.split("/").last),
    );

    print(request);

    var response = await request.send(); 

    print("We are in the api");
    print(response.reasonPhrase);


    // final response = await http.post("http://127.0.0.1:5000/api/upload", 
    //                                   headers: {
    //                                     "Authorization": apiKey, 
    //                                   },
    //                                   body: {
    //                                     "picture": filename, 
    //                                   });

    // var response = await request.send(); 
    // final Map result = json.decode(response.reasonPhrase); 
    // if(response.statusCode == 201){
    //   print(response.reasonPhrase); 
    // }
  }

  Future<File> getImage(String apiKey) async{
    File imageFile; 
    final response = await http.get("http://127.0.0.1:5000/api/upload", 
                                    headers: {
                                      "Authorization": apiKey, 
                                    }); 

    Directory tempDir = await getTemporaryDirectory(); 
    String tempPath = tempDir.path; 
    imageFile = new File('$tempPath/test.jpg'); 

    return await imageFile.writeAsBytes(response.bodyBytes);

    
    

    
  }
}


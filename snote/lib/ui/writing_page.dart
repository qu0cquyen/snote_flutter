import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snote/models/global.dart';
import 'package:zefyr/zefyr.dart';
import 'package:snote/util/myapp_zefyrimage.dart';
import 'package:snote/models/widgets/custom_button.dart';


class WritingPage extends StatefulWidget{
  @override 
  _WritingPageState createState() => _WritingPageState(); 
}

class _WritingPageState extends State<WritingPage>{
  String imageName = ""; 

  /// Allows to control the editor and the document 
  ZefyrController _controller; 

  /// Zefyr editor like any other input field requires a focus node 
  FocusNode _focusNode; 
  

  @override
  void initState(){
    super.initState(); 

    final document = _loadDocument(); 
    _controller = ZefyrController(document); 
    
    _focusNode = FocusNode(); 
  }

  /// Loads the document to be edited in Zefyr
  NotusDocument _loadDocument(){
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    // final Delta delta = Delta()..insert("Body....\n"); 
    // return NotusDocument.fromDelta(delta); 
    return NotusDocument(); 
  }

  void _browseFile() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery); 
    
    String fileName = pickedFile.path.toString().split('/').last; 
    setState((){
      imageName = fileName; 
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
            onTap: () => Navigator.pop(context),
          ),
          title: Center(
            child: addANewNote,
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: (){},
              child: btnSaveLabel,
              color: btnBackgroundColor, 
              
            ),
          ],
        ),
        body: SafeArea(
          child: ZefyrScaffold(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 0, 
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), 
                      decoration: InputDecoration(
                        hintText: "Title", 
                        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),             
                ),

               
                
                Expanded(
                  flex: 2, 
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 20), 
                        child: Text("Banner Image: "), 
                      ),
                      
                      Container(
                        width: 80, 
                        height: 30,
                        child: RaisedButton(
                          onPressed: _browseFile, 
                          child: btnBrowseLabel, 
                          color: btnBackgroundColor, 
                        ),
                      ),
                      
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(imageName), 
                  ),
                ),

                Expanded(
                  flex: 9,
                  
                  // child: Container(
                  //   margin: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1),
                  //   ),

                    child: ZefyrEditor(
                      padding: const EdgeInsets.all(16),
                      controller: _controller, 
                      focusNode: _focusNode,
                      imageDelegate: MyAppZefyrImageDelegate(),

                    ),
                    


                  //), 
                ),
                
              ],
            ),
        ),
      ),
      
    );  
  }
}
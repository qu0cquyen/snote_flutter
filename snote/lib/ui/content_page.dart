import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snote/bloc/blocs/upload_bloc.dart'; 
import 'package:snote/models/global.dart';

class ContentPage extends StatefulWidget{
  final String apiKey; 
  final String title; 
  final Image bannerImg; 
  
  ContentPage({Key key, this.apiKey, @required this.title, this.bannerImg}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState(); 
}

class _ContentPageState extends State<ContentPage>{
  String txt = """import 'package:flutter/material.dart';
import 'package:tutorial2/bloc/blocs/task_bloc_provider.dart'; 
import '../../models/global.dart'; 
import '../../models/widgets/intray_todo_widget.dart';
import '../../models/classes/task.dart';

class IntrayPage extends StatefulWidget{
  final String apiKey; 
  IntrayPage({this.apiKey});
  @override
  _IntrayPageState createState() => _IntrayPageState(); 
}

class _IntrayPageState extends State<IntrayPage>{
  List<Task> taskList = [];
  TaskBloc taskBloc; 

  @override
  void initState(){
    super.initState(); 
    taskBloc = TaskBloc(widget.apiKey); 
  }
  
  @override  
  Widget build(BuildContext context){
      return Container(
        color: darkGreyColor, 
        child: StreamBuilder(
          stream: taskBloc.tasks, 
          initialData: [], 
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot != null){
              if(snapshot.data.length > 0){
                return _buildReorderableListSimple(context, snapshot.data); 
              } else if(snapshot.data.length == 0){
                return Container();
              }
            } else if(snapshot.hasError){
              return Container();
            }
            return CircularProgressIndicator();
          }
        ),
        // child: FutureBuilder(
        //   future: getList(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot){
        //     if(!snapshot.hasData){
        //       return CircularProgressIndicator();
        //     }
        //     return _buildReorderableListSimple(context, taskList);
        //   }
        // ),
        //child: _buildReorderableListSimple(context),
        // child: ListView(
        //   padding: EdgeInsets.only(top: 250),
        //   children: todoItems,
        //   onReorder: _onReorder,
        // ),
      ); 
  }

  // Future<List<Task>> getList() async {
  //   List<Task> tasks = await taskBloc.getUserTasks(widget.apiKey);
  //   return tasks; 
  // }

  Widget _buildListTile(BuildContext context, Task item){
    return ListTile(
      key: Key(item.taskId.toString()),
      title: IntrayTodo(title: item.title), 
    );
  }

  Widget _buildReorderableListSimple(BuildContext context, List<Task> taskList){
    return Theme( // This helps get rid of background color of reorderable
      data: ThemeData(
        canvasColor: Colors.transparent
      ),

      child: ReorderableListView(
        // handleSide: ReorderableListSimpleSide.Right
        // handleIcon: Icon(Icons.access_alrm)
        padding: const EdgeInsets.only(top: 300.0), 
        children: taskList.map((Task item) => _buildListTile(context, item)).toList(), 
        onReorder: (oldIndex, newIndex){
          setState((){
            Task item = taskList[oldIndex];
            taskList.remove(item);
            taskList.insert(newIndex, item); 
          });
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex){
    setState((){
      if(newIndex > oldIndex){
        newIndex -= 1; 
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

}";""";

  UploadBloc uploadBloc = new UploadBloc(); 
  Image _userImage; 
  File file; 
  void chooseImage() async {
      var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery); 
      

      setState((){
        file = File(pickedFile.path);
        print(file.path);
        _userImage = Image.file(file);  
        print(_userImage);
        
      });
  }


  @override
  Widget build(BuildContext context){
    print(widget.bannerImg);
    return Scaffold(
          backgroundColor: backgroundColor, 
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: Icon(Icons.arrow_back_ios, color: Colors.black), 
            actions: <Widget>[
              
              Icon(Icons.favorite_border, color: Colors.black),
              SizedBox(width: 10,),

            ],
            title: Center(
              child: Container(
                child: Text(widget.title, style: TextStyle(color: Colors.black)),
              ),
            ), 
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Banner Image 
                  Container(
                    child: widget.bannerImg,
                  ),

                  // Main Contents 
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(txt),
                  ),
                ],



              //   children: <Widget>[
              //     Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: <Widget>[
              //     Container(
              //       width: 100, 
              //       height: 100, 
              //       child: _userImage,
              //       ),
                   
              //     RaisedButton(
              //       onPressed: chooseImage,
              //       child: Text("Choose Image"),
              //     ),
              //   ],
              // ),

              //   RaisedButton(
              //     onPressed:() { 
              //       print("Getting here");
              //       //print(file); 
              //       uploadBloc.uploadImage(widget.apiKey, file);
                    
              //     }, 
              //     child: Text("Upload Image"),
              //   ),
              //   ],
              // ), 
                
              
              ),
            ),
          ),
      
    );
  }
}
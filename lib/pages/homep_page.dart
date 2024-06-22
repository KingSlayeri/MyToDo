import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mytodo/data/database.dart';
import 'package:mytodo/utilities/dialog_box.dart';
import 'package:mytodo/utilities/todo_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> { 

  final _myBox = Hive.box('The Box');
  ToDoDatabase db =ToDoDatabase();

  @override
  void initState() {

    if (_myBox.get("TODOLIST") == null) {
      db.createInitData();
      
    }
    else{
      db.loadData();
    }
   
   super.initState();
  }

final _controller = TextEditingController();



   
   checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDOList[index][1] = !db.toDOList[index][1];
    });
    db.updateDataBase();

    
  }

  //Delete task
  void deleteTheTask(int index){

    setState(() {
      db.toDOList.remove(index);
    });
        db.updateDataBase();
  
  }


  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 126, 134),
      
      appBar: AppBar(
        title:  const Text('TO DO'),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask,
        child: const Icon(Icons.add),
        ),
      

        body: ListView.builder(
          itemCount: db.toDOList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
            taskName: db.toDOList[index][0],
            taskStatus: db.toDOList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTheTask,
            );
          },
        ),

    );
  }

  //Save new task
   void saveTask(){

    db.toDOList.add([_controller.text, false]);
    _controller.clear();

        db.updateDataBase();


   }




  //Make a new task
  void createNewTask() {
    showDialog(context: context,
     builder: (context){
      return DialogBox(
      controller: _controller,
      onSaved:  saveTask,
       onCancelled: () => Navigator.of(context).pop(),


      );
     },
     );
         db.updateDataBase();

  }
  }

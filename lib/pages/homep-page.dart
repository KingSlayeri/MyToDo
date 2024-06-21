import 'package:flutter/material.dart';
import 'package:mytodo/utilities/dialog_box.dart';
import 'package:mytodo/utilities/todo_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

final _controller = TextEditingController();

//task list
List toDOList = [

  "LOve of Jesus Christ", false,
  "Add A NEW TASK", false

];


   
   checkBoxChanged(bool? value, int index){
    setState(() {
      toDOList[index][1] = !toDOList[index][1];
    });

    
  }

  //Delete task
  void deleteTheTask(int index){

    setState(() {
      toDOList.remove(index);
    });
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
          itemCount: toDOList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
            taskName: toDOList[index][0],
            taskStatus: toDOList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTheTask,
            );
          },
        ),

    );
  }

  //Save new task
   void saveTask(){

    toDOList.add([_controller.text, false]);
    _controller.clear();

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
  }
  }

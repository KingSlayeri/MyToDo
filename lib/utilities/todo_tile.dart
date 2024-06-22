import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged; 
  Function(BuildContext) deleteTask;


  ToDoTile ({
  super.key,
  required this.taskName,
  required this.taskStatus, 
  required this.onChanged,
  required this.deleteTask
  });


@override 
Widget build (BuildContext context){
return Padding(
  padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
  
  child: Slidable(
    endActionPane: ActionPane(motion: const StretchMotion(),
     children:
      [SlidableAction(onPressed: deleteTask,
      icon: Icons.delete,
      backgroundColor: Colors.black,
      borderRadius: BorderRadius.circular(18.85),
      ),
      ],
      ) ,
  
  child: Container(
    padding: const EdgeInsets.all(24.0),
    decoration:BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(11.27)
    ),
  child: Row(
    children: [
      

      Checkbox(
      value: taskStatus,
      onChanged: onChanged,
      activeColor: Colors.grey,
      ),
      //Name of  the task
      Text(taskName,
      style: TextStyle(
      decoration: taskStatus
       ?TextDecoration.lineThrough
      :TextDecoration.none,
      ),
      
      ),  
    ],
  ),
  ),
  
  ),
);

}
} 
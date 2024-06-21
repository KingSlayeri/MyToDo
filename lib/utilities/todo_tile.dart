import 'package:flutter/material.dart';


class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged; 


  ToDoTile ({
  super.key,
  required this.taskName,
  required this.taskStatus, 
  required this.onChanged,
  });


@override 
Widget build (BuildContext context){
return Padding(
  padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
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
      :TextDecoration.none,),
      ),  
    ],
  ),
  
  ),
);

}
} 
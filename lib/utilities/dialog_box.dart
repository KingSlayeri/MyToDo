import 'package:flutter/material.dart';
import 'package:mytodo/utilities/button.dart';


// ignore: must_be_immutable
class DialogBox extends StatelessWidget {

    // ignore: prefer_typing_uninitialized_variables
    final controller;
    VoidCallback onSaved;
    VoidCallback onCancelled;

   DialogBox ({super.key, required this.controller,required this.onSaved,required this.onCancelled});

  @override
  Widget build(BuildContext context)
  {return AlertDialog(
    backgroundColor: Colors.amber,
    content: SizedBox(
      height: 195,
      child: Column(
        children: [
           
          //GEt task 
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            hintText: "Add a new task"),
          ),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
            MyButton(text: "SAVE", onPressedl: onSaved),


            const SizedBox(width: 7.5,), 

            MyButton(text: "CANCEL", onPressedl: onCancelled)

          ],)


          ],),
    ),
  );}
  
}
import 'package:flutter/material.dart';
import 'package:mytodo/utilities/button.dart';


class DialogBox extends StatelessWidget {

  const DialogBox ({super.key});

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
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            hintText: "Add a new task"),
          ),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
            myButton(text: "SAVE", onPressedl: (){}),


            const SizedBox(width: 7.5,),

            myButton(text: "CANCEL", onPressedl: (){})

          ],)


          ],),
    ),
  );}
  
}
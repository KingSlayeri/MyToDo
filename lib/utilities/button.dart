import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  
  VoidCallback onPressedl;
  MyButton({
    super.key,
    required this.text,
    required this.onPressedl,

  });

  @override
 Widget build(BuildContext context)
  
{
  return MaterialButton(
    onPressed: onPressedl,
    color: Theme.of(context).primaryColor,
    child: Text(text),

  );

}

}
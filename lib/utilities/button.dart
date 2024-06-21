import 'package:flutter/material.dart';


class myButton extends StatelessWidget {
  final String text;
  
  VoidCallback onPressedl;
  myButton({
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
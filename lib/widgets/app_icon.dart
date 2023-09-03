
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // app icon design
    return Text('Digiwall',
      style: (
      TextStyle(
        fontSize: 35,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontFamily: 'Kalam',
      )
      )
    );
  }

}
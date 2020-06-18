import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleBackgroundWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children:<Widget>[
        Image.asset('assets/images/bg.png',
          height: size.height,
          width: size.width,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,

        ),

        Text('Example Page with background image', style: TextStyle(
            color: Colors.white,
          fontSize: 30,
        ),),
      ],
    );
  }
}


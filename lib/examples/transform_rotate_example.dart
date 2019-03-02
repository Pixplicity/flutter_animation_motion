import 'dart:math';

import 'package:flutter/material.dart';

class TransformRotateExample extends StatefulWidget {
  @override
  _TransformRotateExampleState createState() => _TransformRotateExampleState();
}

class _TransformRotateExampleState extends State<TransformRotateExample>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 8), vsync: this);
    animation =
        Tween(begin: 0.0, end: (360.0 * pi / 180) * 2).animate(controller)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.rotate(
            angle: animation.value,
            child: FlutterLogo(size: 300),
          ),
          SizedBox(height: 50),
          Text(
            ((animation.value * 180 / pi) % 360).toString(),
            style: Theme.of(context).textTheme.title,
          )
        ],
      ),
    );
  }
}

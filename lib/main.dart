import 'package:flutter/material.dart';
import 'package:flutter_animations/examples/simple_animation_controller_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.white,
        child: SimpleAnimationControllerExample(),
      ),
    );
  }
}

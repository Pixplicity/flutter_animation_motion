import 'package:flutter/material.dart';
import 'package:flutter_animations/examples/animated_container_example.dart';
import 'package:flutter_animations/examples/animated_default_textstyle_example.dart';
import 'package:flutter_animations/examples/animatedbuilder_rotate_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedBuilderRotationExample(),
    );
  }
}

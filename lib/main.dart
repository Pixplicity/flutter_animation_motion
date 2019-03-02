import 'package:flutter/material.dart';
import 'package:flutter_animations/examples/animatedpositioned_example.dart';
import 'package:flutter_animations/examples/animatedwidget_opacity_example.dart';
import 'package:flutter_animations/examples/decoratedbox_transition_example.dart';
import 'package:flutter_animations/examples/hero_example.dart';
import 'package:flutter_animations/examples/scale_transition_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaleTransitionExample(),
    );
  }
}

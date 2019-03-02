import 'package:flutter/material.dart';

///
/// Change perspective of a Widget using Transform widget
///
class StaticTransformPerspectiveExample extends StatefulWidget {
  @override
  _StaticTransformPerspectiveExampleState createState() =>
      new _StaticTransformPerspectiveExampleState();
}

class _StaticTransformPerspectiveExampleState
    extends State<StaticTransformPerspectiveExample> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.01)
        ..rotateX(-0.2),
      alignment: Alignment.center,
      child: Center(
        child: Icon(
          Icons.adb,
          color: Colors.green,
          size: 300,
        ),
      ),
    );
  }
}

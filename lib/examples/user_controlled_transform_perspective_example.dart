import 'package:flutter/material.dart';

class UserControlledTransformPerspectiveExample extends StatefulWidget {
  @override
  _UserControlledTransformPerspectiveExampleState createState() =>
      new _UserControlledTransformPerspectiveExampleState();
}

class _UserControlledTransformPerspectiveExampleState
    extends State<UserControlledTransformPerspectiveExample> {
  Offset _offset = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) => Transform(
        transform: Matrix4.identity()
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: Alignment.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: Center(
            child: Icon(
              Icons.adb,
              color: Colors.green,
              size: 300,
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_animations/app/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation and motion in Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EasterEggHomePage(),
    );
  }
}

class EasterEggHomePage extends StatefulWidget {
  @override
  _EasterEggHomePageState createState() => _EasterEggHomePageState();
}

class _EasterEggHomePageState extends State<EasterEggHomePage> {
  @override
  Widget build(BuildContext context) {
    return UserControlledTransformPerspectiveExample(
      child: HomePage(),
    );
  }
}

///
/// Easter egg
/// Transform a widget with a perspective, controlled by user's gestures
///
class UserControlledTransformPerspectiveExample extends StatefulWidget {
  final Widget child;

  UserControlledTransformPerspectiveExample({@required this.child});

  @override
  _UserControlledTransformPerspectiveExampleState createState() =>
      new _UserControlledTransformPerspectiveExampleState();
}

class _UserControlledTransformPerspectiveExampleState
    extends State<UserControlledTransformPerspectiveExample> {
  Offset _offset = Offset.zero;
  var _enabled = false;

  @override
  Widget build(BuildContext context) {
    if (_enabled) {
      return Transform(
        transform: Matrix4.identity()
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: Alignment.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          onLongPress: () => setState(() => _enabled = !_enabled),
          child: widget.child,
        ),
      );
    } else {
      return GestureDetector(
        onLongPress: () => setState(() {
              _enabled = !_enabled;
              _offset = Offset.zero;
            }),
        child: widget.child,
      );
    }
  }
}

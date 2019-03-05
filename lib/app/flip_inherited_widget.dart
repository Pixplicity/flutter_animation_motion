import 'package:flutter/material.dart';

class FlipInherited extends StatefulWidget {
  final Widget child;

  FlipInherited({Key key, this.child}) : super(key: key);

  @override
  FlipInheritedState createState() => new FlipInheritedState();

  static FlipInheritedState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_FlipInherited)
            as _FlipInherited)
        .data;
  }
}

class FlipInheritedState extends State<FlipInherited> {
  bool _isFlipped = false;
  bool get isFlipped => _isFlipped;

  void flip(bool newValue) {
    setState(() => _isFlipped = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return new _FlipInherited(
      data: this,
      child: widget.child,
    );
  }
}

class _FlipInherited extends InheritedWidget {
  final FlipInheritedState data;

  _FlipInherited({Key key, this.data, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_FlipInherited old) {
    return true;
  }
}

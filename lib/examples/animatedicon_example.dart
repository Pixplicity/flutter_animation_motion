import 'package:flutter/material.dart';

///
/// Animating an Icon using AnimatedIcon
///
class AnimatedIconExample extends StatefulWidget {
  @override
  _AnimatedIconExampleState createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _playForwardOrReverse,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animation,
              size: 100.0,
              color: Colors.pink[400],
            ),
            AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
              size: 100.0,
              color: Colors.pink[400],
            ),
          ],
        ),
      ),
    );
  }

  void _playForwardOrReverse() {
    if (_animation.status == AnimationStatus.completed) {
      _animation.reverse();
    } else {
      _animation.forward();
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class ScaleTransitionExample extends StatefulWidget {
  @override
  _ScaleTransitionExampleState createState() => _ScaleTransitionExampleState();
}

class _ScaleTransitionExampleState extends State<ScaleTransitionExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    var _tween = Tween(begin: 5.0, end: 10.0);
    _animation = _tween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn))
      ..addStatusListener(_playForwardOrReverse);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Icon(
        Icons.favorite,
        color: Colors.pink[400],
      ),
    );
  }

  void _playForwardOrReverse(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

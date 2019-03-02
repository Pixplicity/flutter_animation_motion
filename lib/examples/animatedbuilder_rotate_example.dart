import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderRotationExample extends StatefulWidget {
  @override
  _AnimatedBuilderRotationExampleState createState() =>
      _AnimatedBuilderRotationExampleState();
}

class _AnimatedBuilderRotationExampleState
    extends State<AnimatedBuilderRotationExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = Tween(begin: 0.0, end: (360.0 * pi / 180) * 2).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) => Transform.rotate(
                  angle: _animation.value,
                  child: child,
                ),
            child: FlutterLogo(size: 300),
          ),
          SizedBox(height: 50),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) => Text(
                  ((_animation.value * 180 / pi) % 360).toString(),
                  style: Theme.of(context).textTheme.title,
                ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

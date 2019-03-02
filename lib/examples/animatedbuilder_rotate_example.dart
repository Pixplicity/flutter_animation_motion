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
  AnimationController controller;
  Animation animation;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: (360.0 * pi / 180) * 2).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) => Transform.rotate(
                  angle: animation.value,
                  child: child,
                ),
            child: FlutterLogo(size: 300),
          ),
          SizedBox(height: 50),
          AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) => Text(
                  ((animation.value * 180 / pi) % 360).toString(),
                  style: Theme.of(context).textTheme.title,
                ),
          ),
        ],
      ),
    );
  }
}

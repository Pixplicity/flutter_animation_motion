import 'package:flutter/material.dart';

class AnimatedFlutterLogoExample extends StatefulWidget {
  @override
  _AnimatedFlutterLogoExampleState createState() =>
      _AnimatedFlutterLogoExampleState();
}

class _AnimatedFlutterLogoExampleState extends State<AnimatedFlutterLogoExample>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFlutterLogo(animation: controller);
  }
}

class AnimatedFlutterLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);

  AnimatedFlutterLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) => Opacity(
        opacity: _opacityTween.evaluate(listenable),
        child: Center(
          child: FlutterLogo(size: 300),
        ),
      );
}

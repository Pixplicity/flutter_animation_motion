import 'package:flutter/material.dart';

///
/// Animating the opacity of a Widget using AnimatedWidget
///
class AnimatedFlutterLogoOpacityExample extends StatefulWidget {
  @override
  _AnimatedFlutterLogoOpacityExampleState createState() =>
      _AnimatedFlutterLogoOpacityExampleState();
}

class _AnimatedFlutterLogoOpacityExampleState
    extends State<AnimatedFlutterLogoOpacityExample>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFlutterLogo(animation: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

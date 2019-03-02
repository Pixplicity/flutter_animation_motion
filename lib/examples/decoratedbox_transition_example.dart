import 'package:flutter/material.dart';

class DecoratedBoxTransitionExample extends StatefulWidget {
  @override
  _DecoratedBoxTransitionExampleState createState() =>
      _DecoratedBoxTransitionExampleState();
}

class _DecoratedBoxTransitionExampleState
    extends State<DecoratedBoxTransitionExample>
    with SingleTickerProviderStateMixin {
  DecorationTween _tween;
  AnimationController _animationController;
  Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _tween = DecorationTween(
      begin: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.pink,
            Colors.white,
          ],
        ),
      ),
      end: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Colors.white,
          Colors.deepOrangeAccent,
        ],
      )),
    );

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _animation = _tween.animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _playForwardOrReverse,
      child: DecoratedBoxTransition(
        decoration: _animation,
        child: const SizedBox.expand(),
      ),
    );
  }

  void _playForwardOrReverse() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

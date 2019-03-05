import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final Animation animation;

  ProfileInfo({Key key, this.animation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedName(
            animation: animation,
            name: "Stefan Mitev",
          ),
          AnimatedTitle(
            animation: animation,
            title: "Animation and motion in Flutter (2019)",
          ),
          AnimatedDivider(animation: animation),
        ],
      ),
    );
  }
}

class AnimatedName extends AnimatedWidget {
  final AnimationController animation;
  final String name;

  AnimatedName({Key key, this.name, this.animation})
      : super(
            key: key,
            listenable: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.350,
                  0.450,
                  curve: Curves.easeIn,
                ),
              ),
            ));

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white.withOpacity((listenable as Animation).value),
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
  }
}

class AnimatedTitle extends AnimatedWidget {
  final AnimationController animation;
  final String title;

  AnimatedTitle({Key key, this.title, this.animation})
      : super(
            key: key,
            listenable: Tween(begin: 0.0, end: 0.85).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.500,
                  0.600,
                  curve: Curves.easeIn,
                ),
              ),
            ));

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withOpacity((listenable as Animation).value),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class AnimatedDivider extends AnimatedWidget {
  final AnimationController animation;

  AnimatedDivider({Key key, this.animation})
      : super(
            key: key,
            listenable: Tween(begin: 0.0, end: 325.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.500,
                  0.600,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
            ));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.85),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      width: (listenable as Animation).value,
      height: 1.0,
    );
  }
}

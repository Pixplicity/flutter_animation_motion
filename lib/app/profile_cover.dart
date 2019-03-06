import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileCover extends StatelessWidget {
  final Animation animation;

  const ProfileCover({Key key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/profile_cover.jpeg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 105.0,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Avatar(animation: animation),
          )
        ],
      ),
    );
  }
}

class Avatar extends AnimatedWidget {
  final Animation<double> animation;

  Avatar({Key key, this.animation})
      : super(
            key: key,
            listenable: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.100,
                  0.600,
                  curve: Curves.elasticOut,
                ),
              ),
            ));

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.diagonal3Values(
        (listenable as Animation).value,
        (listenable as Animation).value,
        1.0,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 110.0,
        height: 110.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30),
        ),
        margin: const EdgeInsets.only(top: 32.0, left: 16.0),
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
          child: Image.asset("assets/images/profile_picture.jpeg"),
        ),
      ),
    );
  }
}

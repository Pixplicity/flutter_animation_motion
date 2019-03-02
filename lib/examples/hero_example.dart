import 'package:flutter/material.dart';

///
/// Hero transition example using a Hero widget
///
class HeroExampleMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.bottomRight,
        child: Hero(
          tag: "demo",
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext ctx) => HeroExampleDetails())),
            child: Icon(
              Icons.favorite,
              size: 40,
              color: Colors.pink[400],
            ),
          ),
        ),
      ),
    );
  }
}

class HeroExampleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: "demo",
          child: Icon(
            Icons.favorite,
            size: 300,
            color: Colors.pink[400],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animations/app/model/slide_example_viewmodel.dart';
import 'package:flutter_animations/examples/animated_container_example.dart';
import 'package:flutter_animations/examples/animated_default_textstyle_example.dart';
import 'package:flutter_animations/examples/animatedbuilder_rotate_example.dart';
import 'package:flutter_animations/examples/animatedicon_example.dart';
import 'package:flutter_animations/examples/animatedpositioned_example.dart';
import 'package:flutter_animations/examples/animatedwidget_opacity_example.dart';
import 'package:flutter_animations/examples/decoratedbox_transition_example.dart';
import 'package:flutter_animations/examples/hero_example.dart';
import 'package:flutter_animations/examples/scale_transition_example.dart';
import 'package:flutter_animations/examples/simple_animation_controller_example.dart';
import 'package:flutter_animations/examples/simple_color_tween_example.dart';
import 'package:flutter_animations/examples/static_transform_perspective_example.dart';
import 'package:flutter_animations/examples/user_controlled_transform_perspective_example.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _mainController;
  AnimationController _flipCardController;

  Animation<Decoration> _backgroundDecoration;
  Animation<double> _avatarSize;
  Animation<double> _nameOpacity;
  Animation<double> _occupationOpacity;
  Animation<double> _dividerWidth;
  Animation<double> _listItemHeightFactor;
  Animation<double> _flipButtonWidth;
  Animation<double> _frontCardTransformation;
  Animation<double> _backCardTransformation;

  List<ExampleViewModel> viewModels;

  var _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _flipCardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _backgroundDecoration = DecorationTween(
      begin: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      end: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Colors.deepPurple[900],
          Colors.lightBlueAccent,
          Colors.white,
        ],
      )),
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.000,
          0.500,
          curve: Curves.ease,
        ),
      ),
    );

    _avatarSize = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.100,
          0.600,
          curve: Curves.elasticOut,
        ),
      ),
    );

    _nameOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.350,
          0.450,
          curve: Curves.easeIn,
        ),
      ),
    );

    _occupationOpacity = Tween(begin: 0.0, end: 0.85).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.500,
          0.600,
          curve: Curves.easeIn,
        ),
      ),
    );

    _dividerWidth = Tween(begin: 0.0, end: 325.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.500,
          0.600,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _listItemHeightFactor = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.550,
          0.650,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _flipButtonWidth = Tween(begin: 150.0, end: 170.0).animate(
        CurvedAnimation(parent: _flipCardController, curve: Curves.easeIn));

    _frontCardTransformation = Tween(begin: 0.0, end: pi / 2).animate(
        // (pi / 2) * 4
        CurvedAnimation(
            parent: _flipCardController,
            curve: Interval(0.0, 0.5, curve: Curves.easeOut)));

    _backCardTransformation = Tween(begin: 3.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _flipCardController,
            curve: Interval(0.3, 1.0, curve: Curves.easeOut)));

    _mainController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModels = [
      ExampleViewModel(
        "Displaying controller's animated value",
        "Slide 6-9",
        () => _navigateTo(SimpleAnimationControllerExample()),
      ),
      ExampleViewModel(
        "Tweening from one color to another",
        "Slide 11-12",
        () => _navigateTo(SimpleColorTweenExample()),
      ),
      ExampleViewModel(
        "Animating Container's properties",
        "Slide 19",
        () => _navigateTo(AnimatedContainerExample()),
      ),
      ExampleViewModel(
        "Animating the position of a Widget",
        "Slide 20",
        () => _navigateTo(AnimatedPositionedExample()),
      ),
      ExampleViewModel(
        "Animating an Icon using AnimatedIcon",
        "Slide 21",
        () => _navigateTo(AnimatedIconExample()),
      ),
      ExampleViewModel(
        "Animating a gradient background",
        "Slide 22-23",
        () => _navigateTo(DecoratedBoxTransitionExample()),
      ),
      ExampleViewModel(
        "Animating a widget's scale",
        "Slide 24-25",
        () => _navigateTo(ScaleTransitionExample()),
      ),
      ExampleViewModel(
        "Animating changes in TextStyle",
        "Slide 26",
        () => _navigateTo(AnimatedDefaultTextStyleExample()),
      ),
      ExampleViewModel(
        "Shared element transition using Hero widget",
        "Slide 27-28",
        () => _navigateTo(HeroExampleMain()),
      ),
      ExampleViewModel(
        "Animated rotation of a widget",
        "Slide 29-33",
        () => _navigateTo(AnimatedBuilderRotationExample()),
      ),
      ExampleViewModel(
        "Animating the opacity of a Widget",
        "Slide 34",
        () => _navigateTo(AnimatedFlutterLogoOpacityExample()),
      ),
      ExampleViewModel(
        "Change perspective of a Widget",
        "Slide 35",
        () => _navigateTo(StaticTransformPerspectiveExample()),
      ),
      ExampleViewModel(
        "Change of Widget's perspective with gestures",
        "(not in the presentation)",
        () => _navigateTo(UserControlledTransformPerspectiveExample()),
      ),
    ];
  }

  @override
  void dispose() {
    _mainController.dispose();
    _flipCardController.dispose();
    super.dispose();
  }

  void _navigateTo(Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
              backgroundColor: Colors.white,
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      body: AnimatedBuilder(
        animation: _mainController,
        builder: (BuildContext context, Widget child) => Container(
              decoration: _backgroundDecoration.value,
              child: _buildContent(),
            ),
      ),
    );
  }

  AnimatedBuilder _buildFloatingActionButton() => AnimatedBuilder(
        animation: _flipButtonWidth,
        builder: (BuildContext context, Widget child) => Container(
              width: _flipButtonWidth.value,
              child: child,
            ),
        child: FloatingActionButton.extended(
            onPressed: () => setState(() {
                  _isFlipped = !_isFlipped;
                  if (_isFlipped) {
                    _flipCardController.forward();
                  } else {
                    _flipCardController.reverse();
                  }
                }),
            icon: Icon(Icons.repeat),
            label: Text(_isFlipped ? "Example titles" : "Slide titles")),
      );

  Widget _buildContent() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildProfileCover(),
          _buildProfileInfo(),
          _buildList(),
        ],
      );

  Widget _buildProfileCover() => SizedBox(
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
              child: _buildAvatar(),
            )
          ],
        ),
      );

  Widget _buildAvatar() => Transform(
        transform: Matrix4.diagonal3Values(
          _avatarSize.value,
          _avatarSize.value,
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

  Widget _buildProfileInfo() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Stefan Mitev",
              style: TextStyle(
                color: Colors.white.withOpacity(_nameOpacity.value),
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Text(
              "Animation and motion in Flutter (2019)",
              style: TextStyle(
                color: Colors.white.withOpacity(_occupationOpacity.value),
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.85),
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              width: _dividerWidth.value,
              height: 1.0,
            ),
          ],
        ),
      );

  Widget _buildList() => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 16.0),
          itemCount: viewModels.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildListTile(index),
        ),
      );

  ClipRect _buildListTile(int index) => ClipRect(
        child: Align(
          alignment: Alignment.topLeft,
          heightFactor: max(_listItemHeightFactor.value, 0.0),
          widthFactor: 1.0,
          child: GestureDetector(
            onTap: viewModels[index].onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: <Widget>[
                  _buildBackCard(index),
                  _buildFrontCard(index),
                ],
              ),
            ),
          ),
        ),
      );

  AnimatedBuilder _buildFrontCard(int index) => AnimatedBuilder(
        animation: _frontCardTransformation,
        builder: (BuildContext context, Widget child) {
          return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_isFlipped
                    ? -_frontCardTransformation.value
                    : _frontCardTransformation.value),
              child: child);
        },
        child: Card(
          elevation: _isFlipped ? 0.0 : 2.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Text(viewModels[index].title),
          ),
        ),
      );

  AnimatedBuilder _buildBackCard(int index) => AnimatedBuilder(
        animation: _backCardTransformation,
        builder: (BuildContext context, Widget child) {
          return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_isFlipped
                    ? _backCardTransformation.value
                    : -_backCardTransformation.value),
              child: child);
        },
        child: Card(
          elevation: !_isFlipped ? 0.0 : 2.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Text(viewModels[index].backTitle),
          ),
        ),
      );
}

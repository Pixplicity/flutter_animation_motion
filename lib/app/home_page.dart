import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animations/app/examples_list.dart';
import 'package:flutter_animations/app/flip_inherited_widget.dart';
import 'package:flutter_animations/app/model/slide_example_viewmodel.dart';
import 'package:flutter_animations/app/profile_cover.dart';
import 'package:flutter_animations/app/profile_info.dart';
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

  List<ExampleViewModel> viewModels;

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
        "Slide 21",
        () => _navigateTo(AnimatedContainerExample()),
      ),
      ExampleViewModel(
        "Animating the position of a Widget",
        "Slide 22",
        () => _navigateTo(AnimatedPositionedExample()),
      ),
      ExampleViewModel(
        "Animating an Icon using AnimatedIcon",
        "Slide 23",
        () => _navigateTo(AnimatedIconExample()),
      ),
      ExampleViewModel(
        "Animating a gradient background",
        "Slide 24-25",
        () => _navigateTo(DecoratedBoxTransitionExample()),
      ),
      ExampleViewModel(
        "Animating a widget's scale",
        "Slide 26-27",
        () => _navigateTo(ScaleTransitionExample()),
      ),
      ExampleViewModel(
        "Animating changes in TextStyle",
        "Slide 28",
        () => _navigateTo(AnimatedDefaultTextStyleExample()),
      ),
      ExampleViewModel(
        "Shared element transition using Hero widget",
        "Slide 29-30",
        () => _navigateTo(HeroExampleMain()),
      ),
      ExampleViewModel(
        "Change perspective of a Widget",
        "Slide 31",
        () => _navigateTo(StaticTransformPerspectiveExample()),
      ),
      ExampleViewModel(
        "Animated rotation of a widget",
        "Slide 32-33",
        () => _navigateTo(AnimatedBuilderRotationExample()),
      ),
      ExampleViewModel(
        "Animating the opacity of a Widget",
        "Slide 37",
        () => _navigateTo(AnimatedFlutterLogoOpacityExample()),
      ),
      ExampleViewModel(
        "Change of Widget's perspective with gestures",
        "Slide 38 (hidden)",
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
    return FlipInherited(
      child: Scaffold(
        floatingActionButton: Builder(
            builder: (BuildContext ctx) => MyFloatingActionButton(
                animation: _flipCardController, onTap: () => _flipList(ctx))),
        body: AnimatedBuilder(
          animation: _mainController,
          builder: (BuildContext context, Widget child) => Container(
                decoration: _backgroundDecoration.value,
                child: child,
              ),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfileCover(animation: _mainController),
          ProfileInfo(animation: _mainController),
          ExamplesList(
            viewModels: viewModels,
            itemAnimation: _mainController,
            flipAnimation: _flipCardController,
          ),
        ],
      );

  void _flipList(BuildContext context) {
    final flipInherited = FlipInherited.of(context);
    final willBeFlipped = !flipInherited.isFlipped;
    flipInherited.flip(willBeFlipped);
    if (willBeFlipped) {
      _flipCardController.forward();
    } else {
      _flipCardController.reverse();
    }
  }
}

class MyFloatingActionButton extends StatefulWidget {
  final Animation animation;
  final VoidCallback onTap;

  const MyFloatingActionButton({Key key, this.animation, this.onTap})
      : super(key: key);

  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  Animation<double> _flipButtonWidth;

  @override
  void initState() {
    super.initState();
    _flipButtonWidth = Tween(begin: 150.0, end: 170.0).animate(
        CurvedAnimation(parent: widget.animation, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    final flipInherited = FlipInherited.of(context);

    return AnimatedBuilder(
      animation: _flipButtonWidth,
      builder: (BuildContext context, Widget child) => Container(
            width: _flipButtonWidth.value,
            child: child,
          ),
      child: FloatingActionButton.extended(
          onPressed: () => setState(() {
                flipInherited.flip(flipInherited.isFlipped);
                widget.onTap();
              }),
          icon: Icon(Icons.repeat),
          label: Text(
              flipInherited.isFlipped ? "Example titles" : "Slide titles")),
    );
  }
}

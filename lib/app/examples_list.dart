import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/app/flip_inherited_widget.dart';
import 'package:flutter_animations/app/model/slide_example_viewmodel.dart';

class ExamplesList extends StatelessWidget {
  final List<ExampleViewModel> viewModels;
  final Animation itemAnimation;
  final Animation flipAnimation;

  ExamplesList(
      {Key key, this.viewModels, this.itemAnimation, this.flipAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 16.0),
        itemCount: viewModels.length,
        itemBuilder: (BuildContext context, int index) => ExampleListTile(
              viewModel: viewModels[index],
              itemAnimation: itemAnimation,
              flipAnimation: flipAnimation,
            ),
      ),
    );
  }
}

class ExampleListTile extends StatefulWidget {
  final ExampleViewModel viewModel;
  final Animation itemAnimation;
  final Animation flipAnimation;

  ExampleListTile({
    Key key,
    this.viewModel,
    this.itemAnimation,
    this.flipAnimation,
  }) : super(key: key);

  @override
  _ExampleListTileState createState() => _ExampleListTileState();
}

class _ExampleListTileState extends State<ExampleListTile> {
  Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _heightFactor = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.itemAnimation,
        curve: Interval(
          0.550,
          0.650,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heightFactor,
      builder: (BuildContext context, Widget child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.topLeft,
            heightFactor: max(_heightFactor.value, 0.0),
            widthFactor: 1.0,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: widget.viewModel.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: <Widget>[
              _BackCard(
                animation: widget.flipAnimation,
                viewModel: widget.viewModel,
              ),
              _FrontCard(
                animation: widget.flipAnimation,
                viewModel: widget.viewModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackCard extends StatelessWidget {
  final ExampleViewModel viewModel;
  final Animation<double> cardTransformation;

  _BackCard({Key key, animation, this.viewModel})
      : cardTransformation = Tween(begin: 3.0, end: 0.0).animate(
            CurvedAnimation(
                parent: animation,
                curve: Interval(0.3, 1.0, curve: Curves.easeOut))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final flipInherited = FlipInherited.of(context);

    return AnimatedBuilder(
      animation: cardTransformation,
      builder: (BuildContext context, Widget child) {
        return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(flipInherited.isFlipped
                  ? cardTransformation.value
                  : -cardTransformation.value),
            child: child);
      },
      child: Card(
        elevation: !flipInherited.isFlipped ? 0.0 : 2.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Text(viewModel.backTitle),
        ),
      ),
    );
  }
}

class _FrontCard extends StatelessWidget {
  final Animation cardTransformation;

  final ExampleViewModel viewModel;

  _FrontCard({Key key, animation, this.viewModel})
      : cardTransformation = Tween(begin: 0.0, end: pi / 2).animate(
            CurvedAnimation(
                parent: animation,
                curve: Interval(0.0, 0.5, curve: Curves.easeOut))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final flipInherited = FlipInherited.of(context);

    return AnimatedBuilder(
      animation: cardTransformation,
      builder: (BuildContext context, Widget child) {
        return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(flipInherited.isFlipped
                  ? -cardTransformation.value
                  : cardTransformation.value),
            child: child);
      },
      child: Card(
        elevation: flipInherited.isFlipped ? 0.0 : 2.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Text(viewModel.title),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

///
/// Animating changes in Text's TextStyle using AnimatedDefaultTextStyle
///
class AnimatedDefaultTextStyleExample extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleExampleState createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool _flag = false;
  TextStyle _textStyle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textStyle = Theme.of(context).textTheme.display2.apply(color: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
            _flag = !_flag;
            _textStyle = (_flag)
                ? Theme.of(context)
                    .textTheme
                    .display4
                    .apply(color: Colors.green)
                    .copyWith(fontWeight: FontWeight.bold)
                : Theme.of(context)
                    .textTheme
                    .display2
                    .apply(color: Colors.blue);
          }),
      child: Center(
        child: AnimatedDefaultTextStyle(
          curve: Curves.elasticOut,
          style: _textStyle,
          duration: Duration(milliseconds: 500),
          child: Text("Hello"),
        ),
      ),
    );
  }
}

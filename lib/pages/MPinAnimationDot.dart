import 'package:flutter/material.dart';


class MPinAnimationController {
  late void Function(String) animate;
}

class MPinAnimation extends StatefulWidget {
  final MPinAnimationController mPinAnimationController;

  MPinAnimation({required this.mPinAnimationController});

  @override
  _MPinAnimationState createState() =>
      _MPinAnimationState(mPinAnimationController);
}

class _MPinAnimationState extends State<MPinAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;
  String pin = '';

  void animate(String pin) {
    setState(() {
      this.pin = pin;
    });
    _animationController.forward();
  }

  _MPinAnimationState(MPinAnimationController controller) {
    controller.animate = animate;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animationController.addListener(() {
      setState(() {});
      if (_animationController.isCompleted) _animationController.reverse();
    });
    _sizeAnimation =
        Tween<double>(begin: 20, end: 50).animate(_animationController);
    _opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: Container(
          margin: EdgeInsets.all(5),
          height: _sizeAnimation.value,
          width: _sizeAnimation.value,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(_sizeAnimation.value)),
          alignment: Alignment.center,
          child: Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: (_sizeAnimation.value / 40),
                child: Text(
                  pin,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ))),
    );
  }
}

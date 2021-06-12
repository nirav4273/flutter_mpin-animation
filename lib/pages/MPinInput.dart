import 'package:flutter/material.dart';

import 'MPinAnimationDot.dart';

class MPinInputController {
  late void Function(String) addInput;
  late void Function() delete;
}

class MPinInputWidget extends StatefulWidget {
  final int pinLength;
  final MPinInputController mPinInputController;

  MPinInputWidget({required this.pinLength, required this.mPinInputController});

  @override
  _MPinInputWidgetState createState() =>
      _MPinInputWidgetState(mPinInputController);
}

class _MPinInputWidgetState extends State<MPinInputWidget> {
  List<MPinAnimationController> mPinControllers = [];
  List<MPinAnimation> mPinWidgets = [];
  String pin = '';

  void addInput(String input) {
    if (pin.length < widget.pinLength) pin += input;
    mPinControllers[pin.length - 1].animate(input);
  }

  void delete() {
    if (pin.length > 0) {
      pin = pin.substring(0, pin.length - 1);
      mPinControllers[pin.length].animate('');
    }
  }

  _MPinInputWidgetState(MPinInputController controller) {
    controller.addInput = addInput;
    controller.delete = delete;
  }

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < widget.pinLength; i++) {
      MPinAnimationController controller = MPinAnimationController();
      mPinControllers.add(controller);
      mPinWidgets.add(MPinAnimation(
        mPinAnimationController: controller,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...mPinWidgets],
    );
  }
}

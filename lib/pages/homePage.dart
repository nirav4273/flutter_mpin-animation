import 'package:flutter/material.dart';

import 'MPinAnimationDot.dart';
import 'MPinInput.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MPinInputController mPinInputController;
  int pinLength = 4;

  @override
  void initState() {
    // TODO: implement initState
    mPinInputController = MPinInputController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MPinInputWidget(
            pinLength: 4,
            mPinInputController: mPinInputController,
          ),
          Container(
            child: Wrap(
              children: [
                ...List.generate(10, (index) {
                  return InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: Text(index.toString(), style: TextStyle(fontSize: 18),),
                    ),
                    onTap: (){
                      mPinInputController.addInput(index.toString());
                    },
                  );
                })
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          mPinInputController.delete();
        },
      ),
    );
  }
}

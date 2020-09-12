import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String text;
  BottomButton(this.onPress, this.text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Color(0xffeb1555),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(
          top: 10,
        ),
      ),
    );
  }
}

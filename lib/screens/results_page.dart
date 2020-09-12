import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable.dart';
import 'package:bmi_calculator/components/bottomButton.dart';

class ResultPage extends StatelessWidget {
  final String category;
  final String calcWeight;
  final String calcDesc;
  ResultPage(this.calcWeight, this.category, this.calcDesc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your RESULTS',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      category,
                      style: kResultTextStyle,
                    ),
                    Text(
                      calcWeight,
                      style: kBMITextStyle,
                    ),
                    Text(
                      calcDesc,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
                () {},
              )),
          BottomButton(() {
            Navigator.pop(context);
          }, 'RE-CALCULATE'),
        ],
      ),
    );
  }
}

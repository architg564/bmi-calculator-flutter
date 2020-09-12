import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable.dart';
import '../constants.dart';
import '../components/rounde_icon_button.dart';
import '../components/bottomButton.dart';
import '../screens/results_page.dart';
import 'package:bmi_calculator/bmibrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;
  int height = 180;
  int weight = 80;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      maleColor, CardChildClass(FontAwesomeIcons.mars, 'MALE'),
                      () {
                    setState(() {
                      maleColor = kActiveCardColor;
                      femaleColor = kInactiveCardColor;
                    });
                  }),
                ),
                Expanded(
                  child: ReusableCard(femaleColor,
                      CardChildClass(FontAwesomeIcons.venus, 'FEMALE'), () {
                    setState(() {
                      maleColor = kInactiveCardColor;
                      femaleColor = kActiveCardColor;
                    });
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x1feb1555),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: Color(0xff8d8e98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
                () {}),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Floating(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              Floating(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: ReusableCard(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Floating(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              Floating(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
              ],
            ),
          ),
          BottomButton(() {
            BMIBrain calc = BMIBrain(height, weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(
                  calc.bmiValue(), calc.bmiResult(), calc.bmiDescribe());
            }));
          }, 'CALCULATE'),
        ],
      ),
    );
  }
}

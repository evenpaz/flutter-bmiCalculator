import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/cardColumn.dart';
import '../components/reusableCard.dart';
import '../constants.dart';
import "../components/roundIconBtn.dart";
import "package:bmi_calculator/components/bottom_btn.dart";
import "package:bmi_calculator/calculator_brain.dart";

enum Gender { male, female, other }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.other;
  int height = 170;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        tappedCard: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        cardChild: CardColumn(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                        color: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor),
                  ),
                  Expanded(
                    child: ReusableCard(
                      tappedCard: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardColumn(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBoldTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: kThumbColor,
                          overlayColor: kOverlayColor,
                          activeTrackColor: kThumbColor,
                          inactiveTrackColor: kInactiveColorSlide),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kBoldTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconBtn(
                                  icon: FontAwesomeIcons.minus,
                                  tapBtn: () {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconBtn(
                                  icon: FontAwesomeIcons.plus,
                                  tapBtn: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kBoldTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconBtn(
                                  icon: FontAwesomeIcons.minus,
                                  tapBtn: () {
                                    setState(() {
                                      age -= 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconBtn(
                                  icon: FontAwesomeIcons.plus,
                                  tapBtn: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            BottomBtn(
              tap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Results_page(
                      bmiResult: calc.calculatorBMI(),
                      calcResult: calc.getResult(),
                      interpetation: calc.getInterpetation());
                }));
              },
              title: "CALCULATE",
            )
          ],
        ));
  }
}

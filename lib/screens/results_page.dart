import "package:bmi_calculator/components/bottom_btn.dart";
import "package:bmi_calculator/components/reusableCard.dart";
import "package:bmi_calculator/constants.dart";
import "package:flutter/material.dart";

class Results_page extends StatelessWidget {
  @override
  Results_page(
      {required this.calcResult,
      required this.bmiResult,
      required this.interpetation});

  final String calcResult;
  final String bmiResult;
  final String interpetation;

  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      calcResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpetation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              )),
          Expanded(
              child: BottomBtn(
                  tap: () {
                    Navigator.pop(context);
                  },
                  title: "RE-CALCULATE"))
        ],
      ),
    ));
  }
}

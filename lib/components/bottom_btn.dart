import "package:flutter/material.dart";
import "package:bmi_calculator/constants.dart";

class BottomBtn extends StatelessWidget {
  @override
  BottomBtn({required this.tap, required this.title});

  final VoidCallback tap;
  final String title;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: kBottomBtnColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}

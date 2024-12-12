import 'package:flutter/material.dart';

class RoundIconBtn extends StatelessWidget {
  RoundIconBtn({required this.icon, required this.tapBtn});
  final IconData icon;
  final VoidCallback tapBtn;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
      ),
      onPressed: tapBtn,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}

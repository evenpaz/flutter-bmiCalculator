import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild, this.tappedCard, required this.color});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? tappedCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tappedCard
      // print('reusableCard');
      ,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

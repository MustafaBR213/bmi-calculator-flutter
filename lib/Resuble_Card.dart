import 'package:flutter/material.dart';

class ResubleCard extends StatelessWidget {
  ResubleCard({@required this.colour, this.cardChild,this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, //NOTE: The Color must be in the BoxDecoration
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

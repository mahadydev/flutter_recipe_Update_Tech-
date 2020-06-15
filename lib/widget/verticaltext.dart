import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  final String text;
  VerticalText(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 10),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          text ?? '',
          style: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

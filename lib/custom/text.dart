import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final String fontFamily;
  final double height;
  final double fontSize;
  final double wordSpacing;
  const TextCustom({
    super.key,
    this.color = Colors.white,
    this.text = 'Text',
    this.fontWeight = FontWeight.normal,
    this.fontSize = 34,
    this.height = 0,
    this.wordSpacing = 0.37,
    this.fontFamily = 'SFProDisplay',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontSize: fontSize,
        height: height,
        wordSpacing: wordSpacing,
      ),
    );
  }
}

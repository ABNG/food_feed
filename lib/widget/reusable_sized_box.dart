import 'package:flutter/material.dart';

class ReusableSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const ReusableSizedBox({this.height = 0.0, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}

import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final double borderRadius;
  final double width;
  final Function() onPressed;
  final String text;

  ReusableButton(
      {this.borderRadius = 12.0,
      required this.width,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlueAccent,
            padding: EdgeInsets.symmetric(vertical: 15),
            minimumSize: Size(width, 40),
          ),
          onPressed: onPressed,
          child: Text(
            "$text",
            style: theme.bodyText1?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReusableRating extends StatelessWidget {
  final double initialRating;
  final double itemSize;
  final Function(double) onRatingUpdate;

  ReusableRating(this.initialRating, this.itemSize, this.onRatingUpdate);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      ignoreGestures: true,
      minRating: 1,
      itemSize: itemSize,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.grey[200],
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}

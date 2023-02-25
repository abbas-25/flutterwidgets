
import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/core/typography.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SearchPageHeading extends StatelessWidget {
  const SearchPageHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
        "Open Source collection of FLUTTER UIs\nto accelerate development",
        colors: [
          Colors.deepPurple,
          Colors.deepOrange,
          Colors.pink
        ],
        textAlign: TextAlign.center,
        style: AppTypography.poppins(
          size: 24,
          weight: FontWeight.bold,
        ));
  }
}

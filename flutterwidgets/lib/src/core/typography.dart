import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle poppins({
    double? size,
    FontStyle? style,
    Color? color,
    FontWeight? weight, 
    TextDecoration? decoration, 
  }) {
    return GoogleFonts.poppins(
        fontSize: size ?? 18,
        fontStyle: style ?? FontStyle.normal,
        color: color ?? Colors.white, 
        fontWeight: weight ?? FontWeight.normal,
        decoration: decoration,  
        );
  }
}

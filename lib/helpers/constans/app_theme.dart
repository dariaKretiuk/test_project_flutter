import 'package:flutter/material.dart';
import 'package:test_project_flutter/helpers/constans/app_colors.dart';

class UIThemes {
  final Color blue;
  final Color lightBlue;
  final Color pink;
  final Color lightPink;
  final Color black;
  final Color white;
  final Color red;
  final Color lightRed;
  final Color green;
  final Color lightGreen;

  final TextStyle h1;
  final TextStyle p1;
  final TextStyle p2;

  UIThemes({
    required this.blue,
    required this.lightBlue,
    required this.pink,
    required this.lightPink,
    required this.black,
    required this.white,
    required this.red,
    required this.lightRed,
    required this.green,
    required this.lightGreen,
    required this.h1,
    required this.p1,
    required this.p2,
  });

  factory UIThemes.lightThemeData() {
    return UIThemes(
      blue: ModeColors.blue,
      lightBlue: ModeColors.lightBlue,
      pink: ModeColors.pink,
      lightPink: ModeColors.lightPink,
      black: ModeColors.black,
      white: ModeColors.white,
      red: ModeColors.red,
      lightRed: ModeColors.lightRed,
      green: ModeColors.green,
      lightGreen: ModeColors.lightGreen,
      h1: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      p1: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      p2: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

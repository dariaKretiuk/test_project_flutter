import 'package:flutter/material.dart';
import 'package:test_project_flutter/helpers/constans/app_colors.dart';

class UIThemes {
  final Color blue;
  final Color lightBlue;
  final Color pink;
  final Color lightPink;
  final Color black;
  final Color red;
  final Color lightRed;
  final Color green;
  final Color lightGreen;

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;
  final TextStyle h7;
  final TextStyle p1;
  final TextStyle p2;
  final TextStyle p3;
  final TextStyle p4;
  final TextStyle p5;
  final TextStyle b1;
  final TextStyle b2;
  final TextStyle m1;

  UIThemes({
    required this.blue,
    required this.lightBlue,
    required this.pink,
    required this.lightPink,
    required this.black,
    required this.red,
    required this.lightRed,
    required this.green,
    required this.lightGreen,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.h7,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
    required this.p5,
    required this.b1,
    required this.b2,
    required this.m1,
  });

  factory UIThemes.lightThemeData() {
    return UIThemes(
      blue: ModeColors.blue,
      lightBlue: ModeColors.lightBlue,
      pink: ModeColors.pink,
      lightPink: ModeColors.lightPink,
      black: ModeColors.black,
      red: ModeColors.red,
      lightRed: ModeColors.lightRed,
      green: ModeColors.green,
      lightGreen: ModeColors.lightGreen,
      h1: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      h2: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      h3: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      h4: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      h5: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      h6: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      h7: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      p1: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      p2: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      p3: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      p4: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      p5: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      b1: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      b2: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      m1: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

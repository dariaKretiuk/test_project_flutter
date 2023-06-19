import 'package:flutter/material.dart';
import 'package:test_project_flutter/helpers/constans/app_colors.dart';

class UIThemes {
  final Color darkPurple;
  final Color purple;
  final Color lightPurple;
  final Color extraLightPurple;
  final Color black;
  final Color darkGrey;
  final Color grey;
  final Color lightGrey;
  final Color extraLightGrey;
  final Color white;
  final Color red;
  final Color lightRed;
  final Color green;
  final Color lightGreen;
  final Color yellow;
  final Color lightYellow;

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
    required this.darkPurple,
    required this.purple,
    required this.lightPurple,
    required this.extraLightPurple,
    required this.black,
    required this.darkGrey,
    required this.grey,
    required this.lightGrey,
    required this.extraLightGrey,
    required this.white,
    required this.red,
    required this.lightRed,
    required this.green,
    required this.lightGreen,
    required this.yellow,
    required this.lightYellow,
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
      darkPurple: ModeColors.darkPurple,
      purple: ModeColors.purple,
      lightPurple: ModeColors.lightPurple,
      extraLightPurple: ModeColors.extraLightPurple,
      black: ModeColors.black,
      darkGrey: ModeColors.darkGrey,
      grey: ModeColors.grey,
      lightGrey: ModeColors.lightGrey,
      extraLightGrey: ModeColors.extraLightGrey,
      white: ModeColors.white,
      red: ModeColors.red,
      lightRed: ModeColors.lightRed,
      green: ModeColors.green,
      lightGreen: ModeColors.lightGreen,
      yellow: ModeColors.yellow,
      lightYellow: ModeColors.lightYellow,
      h1: const TextStyle(
        fontSize: 32,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      h2: const TextStyle(
        fontSize: 28,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      h3: const TextStyle(
        fontSize: 20,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      h4: const TextStyle(
        fontSize: 18,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      h5: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      h6: const TextStyle(
        fontSize: 14,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      h7: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.w600,
      ),
      p1: const TextStyle(
        fontSize: 20,
        fontFamily: 'Inter-Regular',
        fontWeight: FontWeight.w400,
      ),
      p2: const TextStyle(
        fontSize: 18,
        fontFamily: 'Inter-Regular',
        fontWeight: FontWeight.w400,
      ),
      p3: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter-Regular',
        fontWeight: FontWeight.w400,
      ),
      p4: const TextStyle(
        fontSize: 14,
        fontFamily: 'Inter-Regular',
        fontWeight: FontWeight.w400,
      ),
      p5: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter-Regular',
        fontWeight: FontWeight.w400,
      ),
      b1: const TextStyle(
        fontSize: 18,
        fontFamily: 'Inter-Medium',
        fontWeight: FontWeight.w500,
      ),
      b2: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter-Medium',
        fontWeight: FontWeight.w500,
      ),
      m1: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter-Medium',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

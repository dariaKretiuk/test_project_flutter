import 'package:flutter/material.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';

class DefaultButtonsWidget extends StatefulWidget {
  const DefaultButtonsWidget({
    super.key,
    required this.title,
    this.backgroundColor,
    this.colorText,
    required this.onPressed,
    required this.width,
    this.height = 30,
  });

  final String title;
  final Color? backgroundColor;
  final Color? colorText;
  final Function onPressed;
  final double width;
  final double height;

  @override
  State<DefaultButtonsWidget> createState() => _DefaultButtonsWidgetState();
}

class _DefaultButtonsWidgetState extends State<DefaultButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return InkWell(
      onTap: () {
        widget.onPressed.call();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? theme.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: theme.h1.copyWith(color: widget.colorText ?? theme.white),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';

class ErrorToast extends StatefulWidget {
  final String errorMessage;

  const ErrorToast({
    super.key,
    required this.errorMessage,
  });

  @override
  State<ErrorToast> createState() => _ErrorToastState();
}

class _ErrorToastState extends State<ErrorToast> {
  bool showToast = true;
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return showToast
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: theme.red.withOpacity(0.3)),
              color: theme.lightRed,
            ),
            child: _errorToast(
              widget.errorMessage,
              theme,
            ),
          )
        : Container();
  }

  Widget _errorToast(String errorMessage, UIThemes theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, boldText: false),
            child: Text(
              errorMessage,
              style: theme.p1.copyWith(color: theme.red),
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              showToast = false;
            });
          },
          child: SvgPicture.asset(
            'assets/icons/cancel.svg',
            color: theme.red,
            width: 24,
            height: 24,
          ),
        )
      ],
    );
  }
}

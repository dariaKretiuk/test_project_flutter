import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.onChange,
  });

  final TextEditingController controller;
  final String placeholder;
  final Function onChange;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return Row(children: [
      SvgPicture.asset(
        'assets/icons/search.svg',
        width: 25,
        height: 25,
        color: theme.lightBlue,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: TextField(
          controller: widget.controller,
          cursorColor: theme.blue,
          style: theme.p2,
          onChanged: (value) {
            setState(() {});
            widget.onChange.call(value);
          },
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: theme.blue),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: theme.blue),
            ),
          ),
        ),
      ),
    ]);
  }
}

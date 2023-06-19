import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_project_flutter/data/models/user_model.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    super.key,
    required this.phone,
  });

  final PhonesModel phone;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/mobile.svg',
                  width: 30,
                  height: 30,
                  color: theme.blue,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      convertPhoneNumber(phone.phoneNumber),
                      style: theme.h1,
                    ),
                    Text(
                      phone.sity,
                      style: theme.p1,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _initials(theme, 's'),
                const SizedBox(
                  width: 10,
                ),
                _initials(theme, 'v'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _initials(UIThemes theme, String text) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: theme.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text[0],
          style: theme.h1.copyWith(color: theme.white),
        ),
      ),
    );
  }

  String convertPhoneNumber(String phone) {
    const mask = '+9(999)999-99-99';
    var maskFormatter = MaskTextInputFormatter(mask: mask, filter: {"9": RegExp(r'[0-9]')});
    return maskFormatter.maskText(phone);
  }
}

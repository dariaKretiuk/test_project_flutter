import 'package:flutter/material.dart';
import 'package:test_project_flutter/data/models/user_model.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/widgets/main_page_widgets/phone_widget.dart';

class CountryWidget extends StatefulWidget {
  const CountryWidget({
    super.key,
    required this.country,
    required this.pathImage,
  });

  final CountryPhonesModel country;
  final String pathImage;

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    widget.pathImage,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.country.nameCountry,
                  style: theme.h1,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.pink),
                boxShadow: [
                  BoxShadow(
                    color: theme.pink,
                    blurRadius: 20,
                    offset: const Offset(0, 9),
                  ),
                ],
              ),
              height: widget.country.groupPhoneNumber.length * 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListView.builder(
                  shrinkWrap: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.country.groupPhoneNumber.length,
                  itemBuilder: (context, index) {
                    return PhoneWidget(
                      phone: widget.country.groupPhoneNumber[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

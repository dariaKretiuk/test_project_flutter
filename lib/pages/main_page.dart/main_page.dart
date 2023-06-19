import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project_flutter/global/cubits/user_cubit.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/pages/main_page.dart/components/filters_phone.dart';
import 'package:test_project_flutter/widgets/main_page_widgets/country_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: MainPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/main_page';
}

class _MainPageState extends State<MainPage> {
  String typePhones = 'Choose variant';

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    final userState = UserCubit.watchState(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.lightPink,
        appBar: AppBar(
          backgroundColor: theme.lightPink,
          elevation: 0,
          title: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: theme.pink,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          actions: [
            SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 20,
              height: 20,
              color: theme.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              'assets/icons/message.svg',
              width: 20,
              height: 20,
              color: theme.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              'assets/icons/bell.svg',
              width: 20,
              height: 20,
              color: theme.blue,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const FiltersPhonesWidget(),
                Column(
                    children: userState.user.groupCountryPhones.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CountryWidget(
                      country: item,
                      pathImage: _resultPathImage(item.nameCountry),
                    ),
                  );
                }).toList()),
              ],
            )),
      ),
    );
  }

  String _resultPathImage(String nameCountry) {
    if (nameCountry == 'United States') {
      return 'assets/images/usa_flag.png';
    } else {
      return 'assets/images/uk_flag.png';
    }
  }
}

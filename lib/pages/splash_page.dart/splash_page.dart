import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_flutter/global/cubits/auth_cubit.dart';
import 'package:test_project_flutter/global/cubits/user_cubit.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/navigation/page_manager.dart';
import 'package:test_project_flutter/pages/app_page/app_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: SplashPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/splash_page';
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return BlocListener<AuthCubit, AuthState>(
      bloc: AuthCubit.read(context)..checkAuthorisation(),
      listener: (context, state) {
        if (state.status is AuthorisedStatus) {
          UserCubit.read(context).fetchUser();
          PageManager.read(context).clearStackAndPushPage(AppPage.page(), rootNavigator: true);
        }
      },
      child: Scaffold(
        backgroundColor: theme.lightPink,
        body: Center(
          child: Text(
            'Splash Page',
            style: theme.p3.copyWith(color: theme.black),
          ),
        ),
      ),
    );
  }
}

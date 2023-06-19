import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_flutter/global/cubits/app_message_cubit.dart';
import 'package:test_project_flutter/global/cubits/auth_cubit.dart';
import 'package:test_project_flutter/global/cubits/user_cubit.dart';
import 'package:test_project_flutter/navigation/navigation_delegate.dart';
import 'package:test_project_flutter/navigation/page_manager.dart';
import 'package:test_project_flutter/services/service_locator.dart';

import 'pages/app_message_manager_widget/app_message_manager_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  await sl.allReady();
  GetIt.I.isReady<SharedPreferences>().then((_) {
    runApp(const AppSetup());
  });
}

class AppSetup extends StatefulWidget {
  const AppSetup({super.key});

  @override
  State<AppSetup> createState() => _AppSetupState();
}

class _AppSetupState extends State<AppSetup> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => PageManager(),
        ),
        BlocProvider(
          create: (_) => AppMessageCubit(
            errorHandler: sl(),
          ),
        ),
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => UserCubit(
            userRepository: sl(),
            appMessageCubit: AppMessageCubit.read(_),
          ),
        ),
      ],
      child: const TestProject(),
    );
  }
}

class TestProject extends StatefulWidget {
  const TestProject({super.key});

  @override
  State<TestProject> createState() => _TestProjectState();
}

class _TestProjectState extends State<TestProject> {
  late RouterDelegate rootNavigatorDelegate;

  @override
  void initState() {
    rootNavigatorDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigatorDelegate>(create: (_) => rootNavigatorDelegate as NavigatorDelegate),
      ],
      builder: (context, child) {
        return MaterialApp(
          home: AppMessageManagerWidget(
            child: Router(
              routerDelegate: rootNavigatorDelegate,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          ),
        );
      },
    );
  }
}

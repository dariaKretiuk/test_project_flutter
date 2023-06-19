import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/navigation/navigation_delegate.dart';
import 'package:test_project_flutter/navigation/page_manager.dart';
import 'package:test_project_flutter/pages/bottom_bar/bottom_tab_bar.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: AppPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/root_app_page';

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late RouterDelegate mainNavigationDelegate;
  late RouterDelegate statisticsNavigationDelegate;
  late RouterDelegate dialogsNavigationDelegate;
  late RouterDelegate subscribersNavigationDelegate;
  late RouterDelegate profileNavigationDelegate;

  @override
  initState() {
    mainNavigationDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
      navigationTab: TabsList.main,
    );
    statisticsNavigationDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
      navigationTab: TabsList.calls,
    );
    dialogsNavigationDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
      navigationTab: TabsList.messages,
    );
    subscribersNavigationDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
      navigationTab: TabsList.contacts,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeTab = context.select((PageManager pageManager) => pageManager.state.activeTab);

    context.select((PageManager pageManager) {
      switch (activeTab) {
        case TabsList.main:
          return pageManager.state.mainPages.last;
        case TabsList.calls:
          return pageManager.state.callsPages.last;
        case TabsList.messages:
          return pageManager.state.messagesPages.last;
        case TabsList.contacts:
          return pageManager.state.contactsPages.last;
      }
    });

    return Scaffold(
      backgroundColor: UIThemes.lightThemeData().lightPink,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                TabView(
                  active: activeTab == TabsList.main,
                  navigatorDelegate: mainNavigationDelegate,
                ),
                TabView(
                  active: activeTab == TabsList.calls,
                  navigatorDelegate: statisticsNavigationDelegate,
                ),
                TabView(
                  active: activeTab == TabsList.messages,
                  navigatorDelegate: dialogsNavigationDelegate,
                ),
                TabView(
                  active: activeTab == TabsList.contacts,
                  navigatorDelegate: subscribersNavigationDelegate,
                ),
              ],
            ),
          ),
          BottomTabBar(
            activeTab: activeTab,
          ),
        ],
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
    required this.active,
    required this.navigatorDelegate,
  }) : super(key: key);
  final bool active;
  final RouterDelegate navigatorDelegate;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !active,
      child: TickerMode(
        enabled: active,
        child: Router(
          routerDelegate: navigatorDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}

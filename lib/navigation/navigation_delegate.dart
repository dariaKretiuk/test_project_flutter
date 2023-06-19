import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_flutter/navigation/page_manager.dart';

class NavigatorDelegate extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  NavigatorDelegate({required this.navigatorCubit, this.navigationTab});

  final PageManager navigatorCubit;
  final TabsList? navigationTab;
  bool _preventPop = false;

  void allowPop() {
    _preventPop = false;
  }

  void preventPop() {
    _preventPop = true;
  }

  @override
  Future<bool> popRoute() async {
    switch (navigationTab) {
      case null:
        if (navigatorCubit.state.rootPages.length > 1) {
          if (!_preventPop) {
            navigatorCubit.pop(rootNavigator: true);
          } else {
            notifyListeners();
          }
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
      case TabsList.main:
        if (navigatorCubit.state.mainPages.length > 1) {
          navigatorCubit.pop();
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
      case TabsList.calls:
        if (navigatorCubit.state.callsPages.length > 1) {
          navigatorCubit.pop();
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
      case TabsList.messages:
        if (navigatorCubit.state.messagesPages.length > 1) {
          navigatorCubit.pop();
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
      case TabsList.contacts:
        if (navigatorCubit.state.contactsPages.length > 1) {
          navigatorCubit.pop();
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
    }
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    return SynchronousFuture<void>(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey {
    switch (navigationTab) {
      case null:
        return navigatorCubit.rootNavigatorKey;
      case TabsList.main:
        return navigatorCubit.mainNavigationKey;
      case TabsList.calls:
        return navigatorCubit.callsNavigationKey;
      case TabsList.messages:
        return navigatorCubit.messagesNavigationKey;
      case TabsList.contacts:
        return navigatorCubit.contactsNavigationKey;
    }
  }

  List<Page<dynamic>> definePages(BuildContext context) {
    switch (navigationTab) {
      case null:
        return context.watch<PageManager>().state.rootPages;
      case TabsList.main:
        return context.watch<PageManager>().state.mainPages;
      case TabsList.calls:
        return context.watch<PageManager>().state.callsPages;
      case TabsList.messages:
        return context.watch<PageManager>().state.messagesPages;
      case TabsList.contacts:
        return context.watch<PageManager>().state.contactsPages;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: definePages(context),
      onPopPage: (Route<dynamic> route, dynamic result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }
        PageManager.read(context).pop(rootNavigator: true);
        return true;
      },
    );
  }
}

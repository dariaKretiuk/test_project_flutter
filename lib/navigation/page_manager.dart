import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_project_flutter/pages/calls_page/calls_page.dart';
import 'package:test_project_flutter/pages/contacts_page/contacts_page.dart';
import 'package:test_project_flutter/pages/main_page.dart/main_page.dart';
import 'package:test_project_flutter/pages/messages_page/messages_page.dart';
import 'package:test_project_flutter/pages/splash_page.dart/splash_page.dart';

enum TabsList { main, calls, messages, contacts }

class PageManager extends Cubit<PageManagerState> {
  PageManager() : super(PageManagerState.initial());

  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> mainNavigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> callsNavigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> messagesNavigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> contactsNavigationKey = GlobalKey<NavigatorState>();

  static PageManager read(BuildContext context) => context.read<PageManager>();
  static PageManager watch(BuildContext context) => context.watch<PageManager>();

  Page<dynamic> whatIsTheLastPage({bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      return pages.last;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];
        return pages.last;
      case TabsList.calls:
        pages = [...state.callsPages];
        return pages.last;
      case TabsList.messages:
        pages = [...state.messagesPages];
        return pages.last;
      case TabsList.contacts:
        pages = [...state.contactsPages];
        return pages.last;
    }
  }

  bool canPop({bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      return pages.length > 1;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];
        return pages.length > 1;
      case TabsList.calls:
        pages = [...state.callsPages];
        return pages.length > 1;
      case TabsList.messages:
        pages = [...state.messagesPages];
        return pages.length > 1;
      case TabsList.contacts:
        pages = [...state.contactsPages];
        return pages.length > 1;
    }
  }

  push(Page page, {bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      if (pages.last != page) {
        pages.add(
          page,
        );
        emit(state.copyWith(rootPages: pages));
      }
    } else {
      switch (state.activeTab) {
        case TabsList.main:
          pages = [...state.mainPages];
          if (pages.last != page) {
            pages.add(
              page,
            );
            emit(state.copyWith(mainPages: pages));
          }

          break;
        case TabsList.calls:
          pages = [...state.callsPages];
          if (pages.last != page) {
            pages.add(
              page,
            );
            emit(state.copyWith(statisticsPages: pages));
          }
          break;
        case TabsList.messages:
          pages = [...state.messagesPages];
          if (pages.last != page) {
            pages.add(
              page,
            );
            emit(state.copyWith(dialogsPages: pages));
          }

          break;
        case TabsList.contacts:
          pages = [...state.contactsPages];
          if (pages.last != page) {
            pages.add(
              page,
            );
            emit(state.copyWith(subscribersPages: pages));
          }

          break;
      }
    }
  }

  popToFirstPage({bool? result, bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      do {
        pages.removeLast();
      } while (pages.length > 1);
      emit(state.copyWith(rootPages: pages));
      return;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];

        do {
          pages.removeLast();
        } while (pages.length > 1);
        if (pages.isEmpty) return;
        emit(state.copyWith(mainPages: pages));
        return;
      case TabsList.calls:
        pages = [...state.callsPages];
        do {
          pages.removeLast();
        } while (pages.length > 1);
        if (pages.isEmpty) return;
        emit(state.copyWith(statisticsPages: pages));
        return;
      case TabsList.messages:
        pages = [...state.messagesPages];
        do {
          pages.removeLast();
        } while (pages.length > 1);
        if (pages.isEmpty) return;
        emit(state.copyWith(dialogsPages: pages));
        return;
      case TabsList.contacts:
        pages = [...state.contactsPages];
        do {
          pages.removeLast();
        } while (pages.length > 1);
        if (pages.isEmpty) return;
        emit(state.copyWith(subscribersPages: pages));
        return;
    }
  }

  pop({dynamic result, bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      pages.removeLast();
      emit(state.copyWith(rootPages: pages));

      return result;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];
        pages.removeLast();
        if (pages.isEmpty) return;
        emit(state.copyWith(mainPages: pages));
        return;
      case TabsList.calls:
        pages = [...state.callsPages];
        pages.removeLast();
        if (pages.isEmpty) return;
        emit(state.copyWith(statisticsPages: pages));
        return;
      case TabsList.messages:
        pages = [...state.messagesPages];
        pages.removeLast();
        if (pages.isEmpty) return;
        emit(state.copyWith(dialogsPages: pages));
        return;
      case TabsList.contacts:
        pages = [...state.contactsPages];
        pages.removeLast();
        if (pages.isEmpty) return;
        emit(state.copyWith(subscribersPages: pages));
        return;
    }
  }

  clearStackAndPushPage(Page page, {bool? rootNavigator}) {
    if (rootNavigator == true) {
      emit(state.copyWith(rootPages: [page]));
      return;
    }

    switch (state.activeTab) {
      case TabsList.main:
        emit(state.copyWith(mainPages: [page]));
        return;
      case TabsList.calls:
        emit(state.copyWith(statisticsPages: [page]));
        return;
      case TabsList.messages:
        emit(state.copyWith(dialogsPages: [page]));
        return;
      case TabsList.contacts:
        emit(state.copyWith(subscribersPages: [page]));
        return;
    }
  }

  changeTab(TabsList tab) {
    if (tab == state.activeTab && canPop()) {
      pop();
      return;
    }
    emit(state.copyWith(activeTab: tab));
  }

  hideTabBar() {
    emit(state.copyWith(hideTab: true));
  }

  showTabBar() {
    emit(state.copyWith(hideTab: false));
  }
}

class PageManagerState {
  final List<Page<dynamic>> _rootPages;
  final List<Page<dynamic>> _mainPages;
  final List<Page<dynamic>> _callsPages;
  final List<Page<dynamic>> _messagesPages;
  final List<Page<dynamic>> _contactsPages;

  final TabsList activeTab;
  bool hideTab;
  bool get canPopRoot => _rootPages.length > 1;
  List<Page<dynamic>> get rootPages => List.unmodifiable(_rootPages);
  List<Page<dynamic>> get mainPages => List.unmodifiable(_mainPages);
  List<Page<dynamic>> get callsPages => List.unmodifiable(_callsPages);
  List<Page<dynamic>> get messagesPages => List.unmodifiable(_messagesPages);
  List<Page<dynamic>> get contactsPages => List.unmodifiable(_contactsPages);
  PageManagerState({
    required List<Page<dynamic>> rootPages,
    required List<Page<dynamic>> mainPages,
    required List<Page<dynamic>> callsPages,
    required List<Page<dynamic>> messagesPages,
    required List<Page<dynamic>> contactsPages,
    this.activeTab = TabsList.main,
    this.hideTab = false,
  })  : _rootPages = rootPages,
        _mainPages = mainPages,
        _messagesPages = messagesPages,
        _contactsPages = contactsPages,
        _callsPages = callsPages;

  factory PageManagerState.initial() {
    return PageManagerState(
        rootPages: [SplashPage.page()],
        mainPages: [MainPage.page()],
        callsPages: [CallsPage.page()],
        messagesPages: [MessagesPage.page()],
        contactsPages: [ContactsPage.page()]);
  }

  PageManagerState copyWith({
    List<Page<dynamic>>? rootPages,
    List<Page<dynamic>>? mainPages,
    List<Page<dynamic>>? statisticsPages,
    List<Page<dynamic>>? dialogsPages,
    List<Page<dynamic>>? subscribersPages,
    List<Page<dynamic>>? profilePages,
    TabsList? activeTab,
    bool? hideTab,
  }) {
    return PageManagerState(
      rootPages: rootPages ?? _rootPages,
      mainPages: mainPages ?? _mainPages,
      callsPages: statisticsPages ?? _callsPages,
      messagesPages: dialogsPages ?? _messagesPages,
      contactsPages: subscribersPages ?? _contactsPages,
      activeTab: activeTab ?? this.activeTab,
      hideTab: hideTab ?? this.hideTab,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/navigation/page_manager.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    Key? key,
    required this.activeTab,
  }) : super(key: key);

  final TabsList activeTab;

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final theme = UIThemes.lightThemeData();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.lightPink,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 64 + bottomPadding,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TabButton(
                    label: 'Home',
                    onTap: () {
                      context.read<PageManager>().changeTab(TabsList.main);
                    },
                    active: widget.activeTab == TabsList.main,
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: 28,
                      height: 28,
                      color: widget.activeTab == TabsList.main ? theme.black : theme.lightBlue,
                    ),
                  ),
                  _TabButton(
                    label: 'Calls',
                    onTap: () {
                      context.read<PageManager>().changeTab(TabsList.calls);
                    },
                    active: widget.activeTab == TabsList.calls,
                    icon: SvgPicture.asset(
                      'assets/icons/call.svg',
                      width: 28,
                      height: 28,
                      color: widget.activeTab == TabsList.calls ? theme.black : theme.lightBlue,
                    ),
                  ),
                  _TabButton(
                    label: 'Messages',
                    onTap: () {
                      context.read<PageManager>().changeTab(TabsList.messages);
                    },
                    active: widget.activeTab == TabsList.messages,
                    icon: SvgPicture.asset(
                      'assets/icons/message.svg',
                      width: 28,
                      height: 28,
                      color: widget.activeTab == TabsList.messages ? theme.black : theme.lightBlue,
                    ),
                  ),
                  _TabButton(
                    label: 'Contacts',
                    onTap: () {
                      context.read<PageManager>().changeTab(TabsList.contacts);
                    },
                    active: widget.activeTab == TabsList.contacts,
                    icon: SvgPicture.asset(
                      'assets/icons/contact.svg',
                      width: 28,
                      height: 28,
                      color: widget.activeTab == TabsList.contacts ? theme.black : theme.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({Key? key, required this.active, required this.icon, required this.onTap, required this.label}) : super(key: key);

  final Widget icon;
  final VoidCallback onTap;
  final bool active;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 2,
            ),
            icon,
            const SizedBox(
              height: 4,
            ),
            Text(label, style: active ? theme.p5.copyWith(color: theme.blue) : theme.p5.copyWith(color: theme.lightBlue)),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}

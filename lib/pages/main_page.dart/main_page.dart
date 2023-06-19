import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

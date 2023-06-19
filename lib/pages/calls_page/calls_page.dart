import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: CallsPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/calls_page';
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

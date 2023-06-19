import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: MessagesPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/messages_page';
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

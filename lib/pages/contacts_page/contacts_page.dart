import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: ContactsPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/contacts_page';
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

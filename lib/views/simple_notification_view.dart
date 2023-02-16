import 'package:flutter/material.dart';

class SimpleNotificationView extends StatefulWidget {
  const SimpleNotificationView({super.key});

  @override
  State<SimpleNotificationView> createState() => _SimpleNotificationViewState();
}

class _SimpleNotificationViewState extends State<SimpleNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleNotificationView"),
      ),
    );
  }
}

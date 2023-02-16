import 'package:flutter/material.dart';

class SimpleTitleNotificationView extends StatefulWidget {
  const SimpleTitleNotificationView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SimpleTitleNotificationView> createState() =>
      _SimpleTitleNotificationViewState();
}

class _SimpleTitleNotificationViewState
    extends State<SimpleTitleNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}

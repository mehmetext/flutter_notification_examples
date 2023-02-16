import 'package:flutter/material.dart';
import 'package:local_notification_denemeler/services/notification_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    NotificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeView"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ElevatedButton(
            onPressed: () {
              NotificationService.showSimpleNotification();
            },
            child: Text("Simple Notification"),
          ),
        ],
      ),
    );
  }
}

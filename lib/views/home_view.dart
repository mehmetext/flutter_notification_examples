import 'package:flutter/material.dart';
import 'package:local_notification_denemeler/services/notification_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController.addListener(() {
      setState(() {});
    });
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
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: titleController.text.isNotEmpty
                ? () {
                    NotificationService.showSimpleTitleNotification(
                      titleController.text,
                    );
                  }
                : null,
            child: Text("Simple Title Notification"),
          ),
        ],
      ),
    );
  }
}

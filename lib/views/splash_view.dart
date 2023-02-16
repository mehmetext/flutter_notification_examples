import 'package:flutter/material.dart';
import 'package:local_notification_denemeler/views/home_view.dart';

import '../services/notification_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      Future.delayed(Duration(seconds: 2)),
      NotificationService.init(),
    ]).then((value) async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
      NotificationService.checkNotificationClicked();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SplashView"),
      ),
    );
  }
}

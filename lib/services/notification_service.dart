import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:local_notification_denemeler/utils/clg.dart';
import 'package:local_notification_denemeler/views/simple_notification_view.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  clg("notificationTapBackground()");

  NotificationService.onNotificationTapped(notificationResponse);
}

class NotificationService {
  static FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    clg("NotificationService.init()");

    localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    localNotifications.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings("app_icon"),
      ),
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: onNotificationTapped,
    );
  }

  static Future<void> checkNotificationClicked() async {
    clg("NotificationService.checkNotificationClicked()");
    NotificationAppLaunchDetails? details =
        await localNotifications.getNotificationAppLaunchDetails();

    if (details != null &&
        details.didNotificationLaunchApp &&
        details.notificationResponse != null) {
      onNotificationTapped(details.notificationResponse!);
    }
  }

  static Future<void> showSimpleNotification() async {
    clg("NotificationService.showSimpleNotification()");

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "simple-notification",
      "Simple Notification",
      importance: Importance.max,
      priority: Priority.max,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    Map<String, dynamic> payload = {
      "type": "simple-notification",
    };

    await localNotifications.show(
      0,
      "Başlık",
      "İçerik",
      notificationDetails,
      payload: jsonEncode(payload),
    );
  }

  static Future<void> onNotificationTapped(
    NotificationResponse notificationResponse,
  ) async {
    clg("NotificationService.onNotificationTapped(${notificationResponse.id})");

    if (notificationResponse.payload != null) {
      Map<String, dynamic> payload = jsonDecode(notificationResponse.payload!);

      clg("NotificationService.onNotificationTapped(${notificationResponse.id}) => payload = $payload");

      _selector(
        type: payload["type"],
        simpleNotification: () {
          Get.to(() => SimpleNotificationView());
        },
      );
    }
  }

  static Future<void> _selector({
    required String type,
    void Function()? simpleNotification,
  }) async {
    switch (type) {
      case "simple-notification":
        if (simpleNotification != null) simpleNotification();
        break;
      default:
    }
  }
}

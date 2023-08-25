// background
// foreground
// app opened from terminated state

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tp_instagram_app/configs/routes/app_routes.dart';
import 'package:tp_instagram_app/configs/routes/navigator_service.dart';

class FirebaseNotificationHelper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  StreamSubscription? subscription;

  init() async {
    await _requestPermission();
    await _initLocalNotifications();
    subscription =
        FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        await showNotification(message);
      }
    });

    //HAndling terminated state
    var initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      //HAndle the notification.
      log("Initial message: ${initialMessage.data}");
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //handle the notification
      log("Message opened app: ${event.data}");
    });
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> _initLocalNotifications() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    _localNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (message) async {
      if (message.payload != null) {
        _handleOnClickNotification(jsonDecode(message.payload!));
      }
    });
  }

  void _handleOnClickNotification(Map<String, dynamic> notificationData) {
    NavigatorService()
        .navigator
        .pushNamed(AppRoutes.home, arguments: notificationData['email']);
  }

  Future<void> showNotification(RemoteMessage message) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      message.notification?.android?.channelId ?? "my_notification_channel_id",
      "notification_channel_name",
      channelDescription: "This is description",
      priority: Priority.high,
      importance: Importance.max,
    );

    DarwinNotificationDetails iosNotificationSettings =
        const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationSettings,
    );
    await _localNotifications.show(
      // DateTime.now().millisecondsSinceEpoch ~/ 1000,
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  Future<void> dispose() async {
    await subscription?.cancel();
  }
}

// background
// foreground
// app opened from terminated state

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationHelper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  StreamSubscription? subscription;

  Future<void> init() async {
    await _requestPermission();
    subscription = FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    //HAndling terminated state
    var initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      //HAndle the notification.
      print("Initial message: ${initialMessage.data}");
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //handle the notification
      print("Message opened app: ${event.data}");
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

  Future<void> dispose() async {
    await subscription?.cancel();
  }
}

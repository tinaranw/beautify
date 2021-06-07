import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
import 'package:rxdart/subjects.dart';

class LocalNotifyManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initSetting;
  BehaviorSubject<ReceiveNotification> get DidReceiveLocalNotificationSubject =>
      BehaviorSubject<ReceiveNotification>();

  LocalNotifyManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializePlatform();
  }

  initializePlatform() {
    var initSettingAndroid = AndroidInitializationSettings('notif_icon');

    initSetting = InitializationSettings(android: initSettingAndroid);
  }

  setOnNotificationReceive(Function onNotificationReceive) {
    DidReceiveLocalNotificationSubject.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  setOnNotificationClick(Function OnNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (String payload) async {
      OnNotificationClick(payload);
    });
  }

  Future<void> showNotification() async {
    var androidChannel = AndroidNotificationDetails(
        'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION',
        importance: Importance.max, priority: Priority.high, playSound: true);
    var platformChannel = NotificationDetails(android: androidChannel);
    await flutterLocalNotificationsPlugin.show(
        0, 'Test Title', 'Test Body', platformChannel,
        payload: 'New Payload');
  }
}

LocalNotifyManager localNotifyManager = LocalNotifyManager.init();

class ReceiveNotification {
  final int id;
  final String title;
  final String body;
  final String payload;
  ReceiveNotification(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.payload});
}

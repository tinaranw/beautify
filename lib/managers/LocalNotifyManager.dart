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

  Future<void> showNotification(String products) async {
    var androidChannel = AndroidNotificationDetails(
        'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION',
        importance: Importance.max, priority: Priority.high, playSound: true, icon: 'notif_icon', enableLights: true);
    var platformChannel = NotificationDetails(android: androidChannel);
    await flutterLocalNotificationsPlugin.show(
        0, 'bea(u)tify Alert!', '$products', platformChannel,
        payload: 'New Payload');
  }

  // Future<void> showDailyAtTime() async {
  //   var time = Time(2, 14, 0);
  //   var androidChannel = AndroidNotificationDetails(
  //       'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION',
  //       importance: Importance.max, priority: Priority.high, playSound: true, icon: 'notif_icon', timeoutAfter: 5000, enableLights: true);
  //   var platformChannel = NotificationDetails(android: androidChannel);
  //   await flutterLocalNotificationsPlugin.showDailyAtTime(
  //       0, 'Daily Test Title ${time.hour} - ${time.minute} - ${time.second}', 'Daily Test Body', time, platformChannel,
  //       payload: 'New Payload');
  // }

 
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

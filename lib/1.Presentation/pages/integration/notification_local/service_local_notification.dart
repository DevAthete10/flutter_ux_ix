import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotifications {


   Future<void> requestPermissionLocalNotifications() async {
      final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
  }    


   static Future<void> initializeLocalNotifications() async {
    final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    //TODO ios configuration

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // TODO ios configuration settings
    );



    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
          selectNotificationStream.add(notificationResponse.payload);
    }
    );

  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
      
    const androidDetails = AndroidNotificationDetails(
      'channelId', 
      'channelName',
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          "id", 
          "ffffffkdvdkl",
          showsUserInterface: true,
          inputs: <AndroidNotificationActionInput> [
            AndroidNotificationActionInput(label: "Respuesta",choices: ["Tula Chica","Tula de gato"])
          ]
          )

      ],
      
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      //TODO IOS
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: data );
  }
}


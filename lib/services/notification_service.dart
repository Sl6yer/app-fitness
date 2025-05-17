import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> scheduleDailyNotification(
    DateTime notificationTime,
  ) async {
    final scheduledDate = _getNextInstanceOfTime(notificationTime);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Time to Drink Water',
      'It\'s time to drink water!',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_water_reminder',
          'Water Reminder Notifications',
          channelDescription: 'Reminder to drink water every day.',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),

      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );

    print('Notification scheduled for: $scheduledDate');
  }

  static tz.TZDateTime _getNextInstanceOfTime(DateTime time) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    print('Scheduled Date: $scheduledDate');
    return scheduledDate;
  }
}

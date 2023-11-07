import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesomenotificationsdemo/services/notification_service.dart';
import 'package:flutter/material.dart';

showBasicNotification(String title, String body) async {
  await NotificationService.showNotification(
    title: title,
    body: body,
  );
}

showNotificationWithSummmary(String title, String body, String summary) async {
  await NotificationService.showNotification(
    title: title,
    body: body,
    summary: summary,
  );
}

showProgressBarNotification(String title, String body, int seconds) async {
  await NotificationService.showNotification(
    title: title,
    body: body,
    notificationLayout: NotificationLayout.ProgressBar,
  );

  // Delay the cancellation of the notification by 5 seconds
  Future.delayed(Duration(seconds: seconds), () async {
    // Cancel the notification after 5 seconds
    await AwesomeNotifications().cancel(0);
  });
}

showMessagingNotification(String title, String body, String summary) async {
  await NotificationService.showNotification(
    title: title,
    body: body,
    summary: summary,
    notificationLayout: NotificationLayout.Messaging,
  );
}

showActionNotificaion(String title, String body, String key, String label,
    Color color, String navigatekey) async {
  await NotificationService.showNotification(
      title: title,
      body: body,
      payload: {
        'navigate': "true",
        "navigatekey": navigatekey,
      },
      actionButtons: [
        NotificationActionButton(
          key: key,
          label: label,
          actionType: ActionType.SilentAction,
          color: color,
        )
      ]);
}

showBigPictureNotification(
  String title,
  String body,
  String summary,
  String bigPictureLink,
) async {
  await NotificationService.showNotification(
    title: title,
    body: body,
    summary: summary,
    notificationLayout: NotificationLayout.BigPicture,
    bigPicture: bigPictureLink,
  );
}

showBigPictureNotificationWithNavigation(
  String title,
  String body,
  String summary,
  String bigPictureLink,
  String key,
  String label,
  Color color,
  String navigatekey,
) async {
  await NotificationService.showNotification(
      title: title,
      body: body,
      summary: summary,
      notificationLayout: NotificationLayout.BigPicture,
      bigPicture: bigPictureLink,
      payload: {
        'navigate': "true",
        "navigatekey": navigatekey,
      },
      actionButtons: [
        NotificationActionButton(
          key: key,
          label: label,
          actionType: ActionType.SilentAction,
          color: color,
        )
      ]);
}

showScheduleNotification(String title, String body, int secondsDuration) async {
  await NotificationService.showNotification(
    title: "Scheduled Notification",
    body: "Notification was fired after 5 seconds",
    scheduled: true,
    interval: secondsDuration,
  );
}

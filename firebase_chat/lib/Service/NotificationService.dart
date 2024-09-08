import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> requrestNotificationPermission() async {
    NotificationSettings setting = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted Permission');
    } else if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      print('User grant Provisional Permission');
    } else {
      print('User Denied Permission');
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();

    return token!;
  }

  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('Refresh');
    });
  }
}

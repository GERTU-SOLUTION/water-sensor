import 'dart:html' as html;

class WebNotificationService {
  Future<void> requestPermission() async {
    if (!html.Notification.supported) {
      print('❌ Browser notification supported биш байна');
      return;
    }

    print('🔔 Одоо байгаа permission: ${html.Notification.permission}');
    // "default", "granted", "denied"

    if (html.Notification.permission == 'default') {
      final permission = await html.Notification.requestPermission();
      print('🔔 requestPermission дараах permission: $permission');
    }
  }

  void show(String title, String body) {
    if (!html.Notification.supported) {
      print('❌ Notification.supported = false');
      return;
    }

    print('🔔 show() called, permission=${html.Notification.permission}');

    if (html.Notification.permission == 'granted') {
      html.Notification(title, body: body);
    } else {
      print('⚠️ Notification permission granted биш байна');
    }
  }
}

final webNotification = WebNotificationService();

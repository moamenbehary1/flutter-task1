

abstract class NotificationService {
  void sendNotification( String message);
}

class EmailNotification extends NotificationService {
  final String email;

  EmailNotification(this.email);

  @override
  void sendNotification(String message) {
    print('Sending Email to $email: $message');
  }
}

class SmsNotification extends NotificationService {
  final String phoneNumber;

  SmsNotification(this.phoneNumber);

  @override
  void sendNotification(String message) {
    print('Sending SMS to $phoneNumber: $message');
  }
}

class PushNotification extends NotificationService {
  final String deviceToken;

  PushNotification(this.deviceToken);

  @override
  void sendNotification(String message) {
    print('Sending Push Notification to device [$deviceToken]: $message');
  }
}

// To get instance of  firebase messaging
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void getToken() {
  _firebaseMessaging.getToken().then((token) {
    print("FCM Token: $token");
  });
}

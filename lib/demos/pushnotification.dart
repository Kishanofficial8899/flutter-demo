import "dart:async";
import "dart:io";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudMessage extends StatefulWidget {
  @override
  _FirebaseCloudMessageState createState() => _FirebaseCloudMessageState();
}

class _FirebaseCloudMessageState extends State<FirebaseCloudMessage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  // ignore: cancel_subscriptions
  StreamSubscription iosSubscription;
  bool notification = false;
  bool error = false;
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        print(data);
        // Function which Save Token in Firestore
        _saveDeviceToken();
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Ok"),
                color: Colors.pink,
              )
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("messgae:$message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("messgae:$message");
      },
    );
  }
  // void  getNotificatin(){

  // }
  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    // Save it to Firestore
    if (fcmToken != null) {
      return _db
          .collection('users')
          .add({
            'token': fcmToken,
            'createdAt': FieldValue.serverTimestamp(), // optional
            'platform': Platform.operatingSystem // optional
          })
          .then((value) => {
                if (value != null)
                  {
                    setState(() {
                      notification = true;
                    })
                  }
              })
          .catchError((error) => {
                if (error != null && !notification)
                  {
                    setState(() {
                      error = true;
                    })
                  }
              });
    }

    //Configuring The Firebase

    //  OPTIONAL

    // _subscribeToTopic() async {
    //   // Subscribe the user to a topic
    //   _fcm.subscribeToTopic('puppies');
    // }

    // @override
    // void dispose() {
    //   if (iosSubscription != null) iosSubscription.cancel();
    //   super.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('FCM Push Notifications'),
      ),
      body: Center(
        child: error
            ? Text(
                "OOPS!!! Something Get Wrong",
                style: TextStyle(color: Colors.red),
              )
            : notification
                ? Text(
                    "You can Now Get All the Notification From us ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                : Text("Please Press That Button To Get Notifications"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveDeviceToken(),
        child: notification
            ? Icon(Icons.notifications_off)
            : Icon(Icons.notifications),
      ),
    );
  }
}

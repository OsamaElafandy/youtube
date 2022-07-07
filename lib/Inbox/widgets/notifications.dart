import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youtube/models/notification_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('notification').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: LoadingAnimationWidget.beat(
                color: const Color.fromARGB(255, 184, 45, 45),
                size: 35,
              ));
            case ConnectionState.none:
              return const Center(child: Text('No Connection'));

            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<NotificationModel> notificationData =
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                  return NotificationModel.fromJson(documentSnapshot.data());
                }).toList();

                return ListView.builder(
                    itemCount: notificationData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(notificationData[index].avatarUrl),
                          radius: 16.0,
                        ),
                        title: notificationData[index].messageType == "comment"
                            ? Text(
                                "${notificationData[index].name} commented: \"${notificationData[index].message}\"")
                            : Text(
                                "New subscriber ${notificationData[index].name}"),
                        subtitle: Text(notificationData[index].timeStamp),
                        trailing: IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {}),
                      );
                    });
              }
              return const SizedBox();
          }
        });
  }
}

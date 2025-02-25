import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/therapist/therapist_message/domain/entity/message.dart';

class MessageBox extends StatelessWidget {
  final List<Message> messageList;
  const MessageBox({super.key, required this.messageList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: InkWell(
          child: ListView.builder(
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              final message = messageList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pushNamed(
                    RouteName.messageDetailPage,
                    arguments: {
                      'message': message.message,
                      'time': message.timestamp,
                    },
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          CupertinoIcons.chat_bubble_2_fill,
                          size: 40.r,
                        ),
                        title: Text(
                          message.message,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                        ),
                        subtitle: Text(
                          formatTimestamp(message.timestamp),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return " ${dateTime.day}/${dateTime.month}/${dateTime.year}";
}

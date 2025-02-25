import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/resources/widgets/common_appbar.dart';

class MessageDetailPage extends StatelessWidget {
  final String message;
  final Timestamp time;

  const MessageDetailPage({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Message"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w,),
        child: Center(
          child: Card(
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h).copyWith(bottom: 5.h),
              child: Column(
                spacing: 15.h,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message,
                  style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      formatTimestamp(time),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return "${dateTime.hour}: ${dateTime.minute} ${dateTime.day}/${dateTime.month}/${dateTime.year}";
}

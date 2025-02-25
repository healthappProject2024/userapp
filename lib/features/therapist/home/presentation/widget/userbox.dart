import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class Userbox extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String uid;

  const Userbox({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.w,
                children: [
                  Container(
                    height: 87.h,
                    width: 87.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Text(uid),
                      Text('AGE'),
                    ],
                  ),
                  CircleAvatar(
                    radius: 8.r,
                    backgroundColor: Colors.green,
                  ),
                  CircleAvatar(
                    radius: 8.r,
                    backgroundColor: Colors.yellow,
                  ),
                  CircleAvatar(
                    radius: 8.r,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                height: 50.h,
                width: 135.w,
                decoration: BoxDecoration(
                    color: MyColors.gradientEndColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: Text(
                    "view more",
                    style: TextStyle(
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

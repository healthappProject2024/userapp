import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/features/user/home/presentation/widgets/home_card.dart';
import 'package:userapp/utils/resources/widgets/home_top_section.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  double width = 0;
  bool myAnimation = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      setState(() {
        myAnimation = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
      child: Column(
        children: [
          HomeTopSection(
            isUser: true,
            iconButton: IconButton(onPressed: (){}, icon: Icon(Icons.bluetooth)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return HomeCard(
                  animation: myAnimation,
                  width: width,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

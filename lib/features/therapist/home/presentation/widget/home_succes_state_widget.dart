import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/features/therapist/home/domain/entity/users.dart';
import 'package:userapp/features/therapist/home/presentation/widget/userbox.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';
import 'package:userapp/utils/resources/widgets/home_top_section.dart';

class HomeSuccesStateWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function() onPressed;
  final ValueChanged<String>? onChanged;
  final List<Users> list;
  final String name;
  const HomeSuccesStateWidget({
    super.key,
    required this.searchController,
    this.onChanged,
    required this.name,
    required this.list,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h).copyWith(
            bottom: 0.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopSection(
                name: name,
                iconButton: IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.add),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonTextfield(
                hintText: 'Search',
                controller: searchController,
                prefixIcon: Icon(Icons.search),
                onChanged: onChanged,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final user = list[index];
                    return Userbox(
                      imageUrl: user.profileurl,
                      name: "Name : ${formatString(user.name)}",
                      uid: "ID : ${formatString(user.uid)}",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String formatString(String input) {
  if (input.length <= 4) {
    return input;
  }
  return '${input.substring(0, 4)}..';
}

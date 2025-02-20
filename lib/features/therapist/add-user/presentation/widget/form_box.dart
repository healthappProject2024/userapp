import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';

class FormBox extends StatelessWidget {
  final TextEditingController nameConytroller;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() onPressed;

  const FormBox({
    super.key,
    required this.nameConytroller,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.w,
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              CommonTextfield(
                hintText: "Name",
                controller: nameConytroller,
                prefixIcon: Icon(
                  Icons.abc,
                ),
              ),
              Text("Email"),
              CommonTextfield(
                hintText: "Email",
                controller: emailController,
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
              Text("Password"),
              CommonTextfield(
                hintText: "Password",
                controller: passwordController,
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton(
                  height: 48.h,
                  width: 200.w,
                  buttonText: "Add user",
                  onPressed: onPressed,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





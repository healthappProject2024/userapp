import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/features/therapist/add-user/presentation/bloc/add_user_bloc.dart';
import 'package:userapp/features/therapist/add-user/presentation/cubit/pickimag_cubit.dart';
import 'package:userapp/features/therapist/add-user/presentation/widget/form_box.dart';
import 'package:userapp/features/therapist/add-user/presentation/widget/photo_box.dart';
import 'package:userapp/utils/resources/widgets/commone_dialouge_box.dart';

class AddUser extends StatefulWidget {
  final String therapisName;
  const AddUser({super.key, required this.therapisName});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: BlocBuilder<AddUserBloc, AddUserState>(
        builder: (context, state) {
          if (state is AdduserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AdduserSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAlertDialog(
                context: context,
                title: "Error",
                content: "User added",
              );
            });
          }
          if (state is AddUserFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAlertDialog(
                context: context,
                title: "Error",
                content: state.message,
              );
            });
          }
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                child: Form(
                  key: _formKey, // Wrap with Form widget
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<PickimagCubit, PickimagState>(
                        builder: (context, state) {
                          if (state is ImagePicked) {
                            return PhotoBox(
                              onTap: () =>
                                  context.read<PickimagCubit>().pickImage(),
                              isImagePicked: true,
                              child: Image.file(
                                state.imagePath,
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                          if (state is ImageNotPickedState) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PhotoBox(
                                  onTap: () =>
                                      context.read<PickimagCubit>().pickImage(),
                                ),
                                Text(
                                  state.message,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            );
                          }
                          return PhotoBox(
                            onTap: () =>
                                context.read<PickimagCubit>().pickImage(),
                          );
                        },
                      ),
                      SizedBox(height: 50.h),
                      FormBox(
                        nameConytroller: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final state = context.read<PickimagCubit>().state;
                            if (state is ImagePicked) {
                              if (state.imagePath != null) {
                                context.read<AddUserBloc>().add(
                                  AdduserTapped(
                                    name: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    imagePath: state.imagePath,
                                    therapisName: widget.therapisName,
                                  ),
                                );
                              } else {
                                showAlertDialog(
                                  context: context,
                                  title: "Error",
                                  content: "Please select an image.",
                                );
                              }
                            } else {
                              showAlertDialog(
                                context: context,
                                title: "Error",
                                content: "No image selected.",
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/therapist/therapist_profile_page/presentation/bloc/profile_bloc.dart';
import 'package:userapp/features/therapist/therapist_profile_page/presentation/widget/profile_base.dart';
import 'package:userapp/utils/resources/widgets/common_appbar.dart';
import 'package:userapp/utils/resources/widgets/common_confirm_dialouge.dart';
import 'package:userapp/utils/resources/widgets/commone_dialouge_box.dart';

class TherapistProfilePage extends StatelessWidget {
  const TherapistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(FetchProfileData());
    final defaultString = "Not found";
    return Scaffold(
      appBar: CommonAppbar(title: "Profile"),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LogOutFailedError) {
            return showAlertDialog(
              context: context,
              title: "Logut Error",
              content: state.message,
            );
          } else if (state is LogOutSuccess) {
            showConfirmDialog(
              context: context,
              heading: "LogOut",
              content: "Are you sure you want to log out?",
              purpose: "LogOut",
              okPressed: () {},
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileFetched) {
            final profileData = state.profile;
            return ProfileBase(
              imageUrl: profileData.profileurl,
              name: profileData.name,
              email: profileData.email,
              uid: profileData.uid,
              onPressed: () => context.read<ProfileBloc>().add(LogOut()),
            );
          } else if (state is ProfileFetchError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return ProfileBase(
            imageUrl: "",
            name: defaultString,
            email: defaultString,
            uid: defaultString,
            onPressed: () {},
          );
        },
      ),
    );
  }
}

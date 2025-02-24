import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/features/therapist/home/presentation/bloc/therapist_home_bloc.dart';
import 'package:userapp/features/therapist/home/presentation/widget/userbox.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';
import 'package:userapp/utils/resources/widgets/home_top_section.dart';

class TherapistHome extends StatefulWidget {
  const TherapistHome({super.key});

  @override
  State<TherapistHome> createState() => _TherapistHomeState();
}

class _TherapistHomeState extends State<TherapistHome> {
  @override
  void initState() {
    context.read<TherapistHomeBloc>().add(LoadUsersEvent());
    super.initState();
  }

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h)
              .copyWith(bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              HomeTopSection(
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ),
              CommonTextfield(
                hintText: 'Search',
                controller: _searchController,
                prefixIcon: Icon(Icons.search),
                onChanged: (query) {
                  context.read<TherapistHomeBloc>().add(SearchUserEvent(query));
                },
              ),
              Expanded(
                child: BlocConsumer<TherapistHomeBloc, TherapistHomeState>(
                  listener: (context, state) {
                    if (state is TherapistHomeError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failure.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UsersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UsersLoaded) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user = state.users[index];
                          return Userbox(
                            name: "Name : ${formatString(user.name)}",
                            imageUrl: user.profileurl,
                            uid: "ID :${formatString(user.uid)}",
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No users found.'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

String formatString(String input) {
  if (input.length <= 4) {
    return input;
  }
  return '${input.substring(0, 4)}..';
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/therapist/home/presentation/bloc/therapist_home_bloc.dart';
import 'package:userapp/features/therapist/home/presentation/widget/home_error_state_widget.dart';
import 'package:userapp/features/therapist/home/presentation/widget/home_succes_state_widget.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class TherapistHome extends StatefulWidget {
  const TherapistHome({super.key});

  @override
  State<TherapistHome> createState() => _TherapistHomeState();
}

class _TherapistHomeState extends State<TherapistHome> {
  @override
  void initState() {
    super.initState();
    context.read<TherapistHomeBloc>().add(LoadHome());
  }

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TherapistHomeBloc, TherapistHomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            if(state.users.isEmpty){
              return HomeErrorStateWidget(
              isNotError: true,
              name: state.therapistName,
              reTryFn: () => context.read<TherapistHomeBloc>().add(LoadHome()),
              adduserBtn: () {
                Navigator.pushNamed(
                  context,
                  RouteName.adduser,
                );
              },
            );
            }
            return HomeSuccesStateWidget(
              searchController: _searchController,
              name: state.therapistName,
              onChanged: (value) {
                context.read<TherapistHomeBloc>().add(SearchUserEvent(value));
              },
              list: state.users,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteName.adduser,
                );
              },
            );
          } else if (state is TherapistHomeError) {
            return HomeErrorStateWidget(
              reTryFn: () => context.read<TherapistHomeBloc>().add(LoadHome()),
              adduserBtn: () {
                Navigator.pushNamed(
                  context,
                  RouteName.adduser,
                );
              },
            );
          }
          return Center(
            child: Text(
              "Home error",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: MyColors.errorColor,
                  ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

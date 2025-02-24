import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/home/domain/entity/users.dart';
import 'package:userapp/features/therapist/home/domain/usecases/load_users_usecase.dart';
import 'package:userapp/utils/resources/error/failures.dart';

part 'therapist_home_event.dart';
part 'therapist_home_state.dart';

class TherapistHomeBloc extends Bloc<TherapistHomeEvent, TherapistHomeState> {
  final GetTherapistNameUseCase getTherapistNameUseCase;
  final LoadUsersUseCase loadUsersUseCase;

  List<Users> allUsers = []; 

  TherapistHomeBloc({
    required this.getTherapistNameUseCase,
    required this.loadUsersUseCase,
  }) : super(TherapistHomeInitial()) {
    
    on<GetTherapistNameEvent>((event, emit) async {
      final therapistName = await getTherapistNameUseCase();
      emit(TherapistNameLoaded(therapistName));
    });

    on<LoadUsersEvent>((event, emit) async {
      emit(UsersLoading());

      await emit.forEach(
        loadUsersUseCase(),
        onData: (Either<Failures, List<Users>> result) {
          return result.fold(
            (failure) => TherapistHomeError(failure),
            (users) {
              allUsers = users; 
              return UsersLoaded(users);
            },
          );
        },
        onError: (error, stackTrace) =>
            TherapistHomeError(Failures(message: error.toString())),
      );
    });

    on<SearchUserEvent>((event, emit) {
      if (state is UsersLoaded) {
        final filteredUsers = allUsers.where((user) {
          return user.name.toLowerCase().contains(event.query.toLowerCase());
        }).toList();

        emit(UsersLoaded(filteredUsers));
      }
    });
  }
}


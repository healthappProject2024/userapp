import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/features/auth/therapist/data/remote_data_source/therapist_remote_data_source.dart';
import 'package:userapp/features/auth/therapist/data/repository/therapist_login_repository_impl.dart';
import 'package:userapp/features/auth/therapist/domain/usecase/threapist_login.dart';
import 'package:userapp/features/auth/therapist/presentation/bloc/therapist_login_bloc.dart';
import 'package:userapp/features/onboarding/data/local_data_source/local_data_source.dart';
import 'package:userapp/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:userapp/features/onboarding/domain/usecase/onboarding_usecase.dart';
import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:userapp/features/therapist/add-user/data/remote_data_source/add_user_remote_data_source.dart';
import 'package:userapp/features/therapist/add-user/data/repository/add_user_repo_impl.dart';
import 'package:userapp/features/therapist/add-user/domain/usecase/add_user_usecase.dart';
import 'package:userapp/features/therapist/add-user/presentation/bloc/add_user_bloc.dart';
import 'package:userapp/features/therapist/add-user/presentation/cubit/pickimag_cubit.dart';
import 'package:userapp/firebase_options.dart';
import 'package:userapp/userapp.dart';
import 'package:userapp/utils/resources/cubit/show_password_cubit.dart';
import 'package:userapp/utils/service/local_data_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => OnboardingCubit(
            onboardingUseCase: OnboardingUseCase(
              onboardingRepository: OnboardingRepositoryImpl(
                localDataSource: LocalDataSourceImpl(
                  localDataService: LocalDataService(prefs: pref),
                ),
              ),
            ),
          )..checkOnboardingStatus(),
        ),
        BlocProvider(
          create: (ctx) => ShowPasswordCubit(),
        ),
        BlocProvider(
          create: (ctx) => TherapistLoginBloc(
            therapistLoginUseCase: TherapistLoginUseCase(
              repository: TherapistLoginRepositoryImpl(
                remoteDataSource: TherapistRemoteDataSourceImpl(
                  auth,
                  db,
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (ctx) => PickimagCubit(),
        ),
        BlocProvider(
          create: (ctx) => AddUserBloc(
            addUserUseCase: AddUserUseCase(
              repository: AddUserRepoImpl(
                addUserRemoteDataSource: AddUserRemoteDataSourceImpl(
                  auth: auth,
                  db: db,
                  storage: storage,
                ),
              ),
            ),
          ),
        )
      ],
      child: const Userapp(),
    ),
  );
  FlutterNativeSplash.remove();
}

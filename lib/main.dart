import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/features/auth/shared/login_status/data/local_data_source/login_status_local_data_source.dart';
import 'package:userapp/features/auth/shared/login_status/data/repository/is_loggedin_repository_impl.dart';
import 'package:userapp/features/auth/shared/login_status/domain/usecases/check_login_status.dart';
import 'package:userapp/features/auth/shared/login_status/domain/usecases/save_login_status.dart';
import 'package:userapp/features/auth/shared/login_status/presentation/cubit/login_status_cubit.dart';
import 'package:userapp/features/auth/therapist/data/data_sources/local/therapist_local_data_source.dart';
import 'package:userapp/features/auth/therapist/data/data_sources/remote/therapist_remote_data_source.dart';
import 'package:userapp/features/auth/therapist/data/repository/therapist_login_repository_impl.dart';
import 'package:userapp/features/auth/therapist/domain/usecase/save_therapist_data.dart';
import 'package:userapp/features/auth/therapist/domain/usecase/threapist_login.dart';
import 'package:userapp/features/auth/therapist/presentation/bloc/therapist_login_bloc.dart';
import 'package:userapp/features/auth/user/data/data_source/local/user_local_data_source.dart';
import 'package:userapp/features/auth/user/data/data_source/remote/user_login_remote_data_source.dart';
import 'package:userapp/features/auth/user/data/repository/user_login_repository_impl.dart';
import 'package:userapp/features/auth/user/domain/usecase/save_user_data.dart';
import 'package:userapp/features/auth/user/domain/usecase/user_login.dart';
import 'package:userapp/features/auth/user/presentation/bloc/user_login_bloc.dart';
import 'package:userapp/features/onboarding/data/local_data_source/local_data_source.dart';
import 'package:userapp/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:userapp/features/onboarding/domain/usecase/onboarding_usecase.dart';
import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:userapp/features/therapist/add-user/data/remote_data_source/add_user_remote_data_source.dart';
import 'package:userapp/features/therapist/add-user/data/repository/add_user_repo_impl.dart';
import 'package:userapp/features/therapist/add-user/domain/usecase/add_user_usecase.dart';
import 'package:userapp/features/therapist/add-user/presentation/bloc/add_user_bloc.dart';
import 'package:userapp/features/therapist/add-user/presentation/cubit/pickimag_cubit.dart';
import 'package:userapp/features/therapist/home/data/data_source/local/get_therapist_name_local_data_source.dart';
import 'package:userapp/features/therapist/home/data/data_source/remote/find_users_remote_data_source.dart';
import 'package:userapp/features/therapist/home/data/repository/therapist_home_repository_impl.dart';
import 'package:userapp/features/therapist/home/domain/usecases/load_users_usecase.dart';
import 'package:userapp/features/therapist/home/presentation/bloc/therapist_home_bloc.dart';
import 'package:userapp/features/therapist/therapist_bottom_navigation/cubit/therapist_bottom_navigation_cubit.dart';
import 'package:userapp/features/therapist/therapist_message/data/remote_data_source/meaage_remote_data_source.dart';
import 'package:userapp/features/therapist/therapist_message/data/repository/message_repository_impl.dart';
import 'package:userapp/features/therapist/therapist_message/domain/usecase/fetch_message_usecase.dart';
import 'package:userapp/features/therapist/therapist_message/presentation/bloc/fetch_message_dart_bloc.dart';
import 'package:userapp/features/therapist/therapist_profile_page/data/data_source/local/profile_local_data_source.dart';
import 'package:userapp/features/therapist/therapist_profile_page/data/data_source/remote/profile_remote_data_source.dart';
import 'package:userapp/features/therapist/therapist_profile_page/data/repository/profile_repository_impl.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/usecase/fetch_profile_usecase.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/usecase/logout_usecase.dart';
import 'package:userapp/features/therapist/therapist_profile_page/presentation/bloc/profile_bloc.dart';
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
                  localDataService: LocalDataService(prefs: pref)
                ),
              ),
            ),
          )..checkOnboardingStatus(),
        ),
        BlocProvider(create: (ctx) => TherapistBottomNavigationCubit()),
        BlocProvider(
          create: (context) => TherapistHomeBloc(
            getTherapistNameUseCase: GetTherapistNameUseCase(
              TherapistHomeRepositoryImpl(
                findUsersRemoteDataSource: FindUsersRemoteDataSourceImpl(db),
                getTherapistNameLocalDataSource:
                    GetTherapistNameLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
              ),
            ),
            loadUsersUseCase: LoadUsersUseCase(
              TherapistHomeRepositoryImpl(
                findUsersRemoteDataSource: FindUsersRemoteDataSourceImpl(db)
                getTherapistNameLocalDataSource:
                    GetTherapistNameLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => LoginStatusCubit(
            checkLoginStatus: CheckLoginStatus(
              IsLoggedinRepositoryImpl(
                LoginStatusLocalDataSourceImpl(
                  LocalDataService(prefs: pref)
                ),
              ),
            ),
            saveLoginStatus: SaveLoginStatus(
              IsLoggedinRepositoryImpl(
                LoginStatusLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
              ),
            ),
          )..loadLoginStatus(),
        ),
        BlocProvider(
          create: (ctx) => ShowPasswordCubit(),
        ),
        BlocProvider(
          create: (ctx) => UserLoginBloc(
            userLoginUsecase: UserLoginUsecase(
              UserLoginRepositoryImpl(
                UserLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
                UserLoginRemoteDataSourceImpl(auth, db),
              ),
            ),
            saveUserDataUsecase: SaveUserDataUsecase(
              UserLoginRepositoryImpl(
                UserLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
                UserLoginRemoteDataSourceImpl(auth, db),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (ctx) => TherapistLoginBloc(
            therapistLoginUseCase: TherapistLoginUseCase(
              repository: TherapistLoginRepositoryImpl(
                remoteDataSource: TherapistRemoteDataSourceImpl(
                  auth,
                  db,
                ),
                therapistLocalDataSource: TherapistLocalDataSourceImpl(
                  LocalDataService(
                    prefs: pref,
                  ),
                ),
              ),
            ),
            saveTherapistDataUsecase: SaveTherapistDataUsecase(
              repository: TherapistLoginRepositoryImpl(
                remoteDataSource: TherapistRemoteDataSourceImpl(
                  auth,
                  db,
                ),
                therapistLocalDataSource: TherapistLocalDataSourceImpl(
                  LocalDataService(
                    prefs: pref,
                  ),
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
        ),
        BlocProvider(
          create: (ctx) => FetchMessageDartBloc(
            fetchMessageUsecase: FetchMessageUsecase(
              MessageRepositoryImpl(
                MessageRemoteDataSourceImpl(db),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (ctx) => ProfileBloc(
            profileUsecase: FetchProfileUsecase(
              ProfileRepositoryImpl(
                ProfileLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
                ProfileRemoteDataSourceImpl(
                  firebaseAuth: auth,
                ),
              ),
            ),
            logoutUsecase: LogoutUsecase(
              ProfileRepositoryImpl(
                ProfileLocalDataSourceImpl(
                  LocalDataService(prefs: pref),
                ),
                ProfileRemoteDataSourceImpl(
                  firebaseAuth: auth,
                ),
              ),
            ),
          ),
        ),
      ],
      child: const Userapp(),
    ),
  );
  FlutterNativeSplash.remove();
}

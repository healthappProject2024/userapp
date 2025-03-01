import 'package:userapp/features/auth/user/domain/repository/user_login_repository.dart';

class SaveUserDataUsecase {
  final UserLoginRepository userLoginRepository;
  SaveUserDataUsecase(this.userLoginRepository);
  Future<void> call({required String data})async{
    await userLoginRepository.saveUser(data);
  }
}
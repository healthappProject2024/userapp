import 'package:flutter_bloc/flutter_bloc.dart';

class TherapistBottomNavigationCubit extends Cubit<int> {
  TherapistBottomNavigationCubit() : super(0);

  changeIndex(int index) => emit(index);
}

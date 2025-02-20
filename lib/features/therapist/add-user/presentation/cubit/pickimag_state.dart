part of 'pickimag_cubit.dart';

@immutable
sealed class PickimagState {}

final class PickimagInitial extends PickimagState {}

final class ImagePicked extends PickimagState{
  final File imagePath;

  ImagePicked({required this.imagePath});
}

final class ImageNotPickedState extends PickimagState{
  final String message;

  ImageNotPickedState({required this.message});
}

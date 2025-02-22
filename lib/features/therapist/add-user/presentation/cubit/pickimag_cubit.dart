import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'pickimag_state.dart';

class PickimagCubit extends Cubit<PickimagState> {
  PickimagCubit() : super(PickimagInitial());

  final ImagePicker _imagePicker = ImagePicker();

Future<void> pickImage() async {
  try {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final file = File(pickedImage.path);
      emit(ImagePicked(imagePath: file));
    } else {
      emit(ImageNotPickedState(message: "No image selected"));
    }
  } catch (e) {
    emit(ImageNotPickedState(message: e.toString()));
  }
}
}

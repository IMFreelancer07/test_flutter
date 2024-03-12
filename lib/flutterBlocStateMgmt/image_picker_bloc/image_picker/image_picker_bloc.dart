import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/flutterBlocStateMgmt/image_picker_bloc/image_picker/image_picker_events.dart';
import 'package:test_flutter/flutterBlocStateMgmt/image_picker_bloc/image_picker/image_picker_states.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils utils;

  ImagePickerBloc(this.utils):super(const ImagePickerState()){
    on<CameraCapture>(_cameraCapture);
    on<CameraCapture>(_galleryImagePick);
  }

  void _cameraCapture (CameraCapture event, Emitter<ImagePickerState> emit) async {

    XFile? file = await utils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryImagePick (CameraCapture event, Emitter<ImagePickerState> emit) async {

    XFile? file = await utils.galleryPicker();
    emit(state.copyWith(file: file));
  }

}
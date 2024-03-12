import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/flutterBlocStateMgmt/image_picker_bloc/image_picker/image_picker_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/image_picker_bloc/image_picker/image_picker_events.dart';
import 'dart:io';
import '../image_picker/image_picker_states.dart';

class BlocImagePickerScreen extends StatefulWidget {
  const BlocImagePickerScreen({super.key});

  @override
  State<BlocImagePickerScreen> createState() => _BlocImagePickerScreenState();
}

class _BlocImagePickerScreenState extends State<BlocImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Image Picker"),
      ),

      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state){

          if(state.file == null){
            return InkWell(
              onTap: (){
                context.read<ImagePickerBloc>().add(CameraCapture());
              },
                child: const CircleAvatar(
                  child: Center(child: Icon(Icons.camera)),
                )
            );
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        },
      ),
    );
  }
}

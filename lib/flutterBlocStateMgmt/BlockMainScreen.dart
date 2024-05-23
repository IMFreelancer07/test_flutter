import 'package:flutter/material.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/ui/BlocPostScreen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/ui/counter_screen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/ui/bloc_fav_app_screen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/ui/todlist_screen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/flutter_freeze/FreezeHomeScreen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/image_picker_bloc/ui/bloc_image_picker_screen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/ui/switch_screen.dart';

import '../mvvm/res/components/round_button.dart';

class BlockMainScreen extends StatefulWidget {
  const BlockMainScreen({super.key});

  @override
  State<BlockMainScreen> createState() => _BlockMainScreenState();
}

class _BlockMainScreenState extends State<BlockMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundButton(title: "Bloc Posts", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocPostScreen()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Bloc Favourites App", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocFavAppScreen()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Bloc Todo List", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocTodolistScreen()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Bloc Image Picker", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocImagePickerScreen()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Bloc Switch", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocSwitchScreen()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Bloc Counter", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocCounterScreen()));
                  }),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

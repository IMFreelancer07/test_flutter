import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/BlockMainScreen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/ui/BlocPostScreen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/favourite_app/fav_app_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/repository/favourite_repository.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/ui/bloc_fav_app_screen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/todolist/todolist_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/flutter_freeze/FreezeHomeScreen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/image_picker_bloc/image_picker/image_picker_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/utils/image_picker_utils.dart';
import 'bloc_counter_app/counter/bloc_counter_bloc.dart';

class BlocMain extends StatefulWidget {
  const BlocMain({super.key});

  @override
  State<BlocMain> createState() => _BlocMainState();
}

class _BlocMainState extends State<BlocMain> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BlocCounterBloc(),

        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),

        ),
        BlocProvider(
          create: (context) => FavAppBloc(FavouriteRepository()),
        ),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark
        ),
        home: const BlockMainScreen(),
      ),
    );
  }
}

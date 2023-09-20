import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providerStateMngmnt/Provider/ThemeChangeProvider.dart';
import 'package:test_flutter/providerStateMngmnt/Provider/favourite_Provider.dart';
import 'package:test_flutter/providerStateMngmnt/Provider/multiP_provider.dart';
import 'package:test_flutter/providerStateMngmnt/providerScreens/Dark_Screen.dart';
import 'providerStateMngmnt/Provider/count_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const String id = "Main_Screen";

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => multiP_Provider(),),
        ChangeNotifierProvider(create: (_) => Favourite_Provider(),),
        ChangeNotifierProvider(create: (_) => ThemeChangeProvider(),),
      ],
      child: Builder(
        builder: (BuildContext context){
          final themeChange = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          themeMode: themeChange.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blueGrey,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blueGrey,
            )
          ),
          home: DarkThemeScreen(),
        );
      },)
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!

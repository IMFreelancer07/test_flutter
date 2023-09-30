import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mvvm/viewModal/auth_view_modal.dart';
import 'package:test_flutter/mvvm/viewModal/user_view_modal.dart';

import 'mvvm/utils/routes/routes.dart';
import 'mvvm/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
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
          ChangeNotifierProvider(
              create: (_)=>AuthViewModel()
          ),
          ChangeNotifierProvider(
              create: (_)=>UserViewModal()
          ),
        ],
      child: MaterialApp(
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!

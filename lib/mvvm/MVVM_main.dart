import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/routes/routes.dart';
import 'package:test_flutter/mvvm/viewModal/auth_view_modal.dart';
import 'package:test_flutter/mvvm/viewModal/user_view_modal.dart';


class MVVM_main extends StatefulWidget {
  static const String id = "Main_Screen";
  const MVVM_main({super.key});

  @override
  State<MVVM_main> createState() => _MVVM_mainState();
}

class _MVVM_mainState extends State<MVVM_main> {
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
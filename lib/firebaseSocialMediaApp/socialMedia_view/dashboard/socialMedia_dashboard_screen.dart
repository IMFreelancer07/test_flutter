import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';
import 'package:toast/toast.dart';

class socialMedia_DashboardScreen extends StatefulWidget {
  const socialMedia_DashboardScreen({super.key});

  @override
  State<socialMedia_DashboardScreen> createState() => _socialMedia_DashboardScreenState();
}

class _socialMedia_DashboardScreenState extends State<socialMedia_DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Wellcome to Dashboard"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  socialMedia_sessionManager().userId = null;
                  socialMedia_utils.toastMessage_socialMedia("Logged Out successfully", true);
                  Navigator.pushNamed(
                      context,
                      socialMedia_RouteName.loginView);
                }).onError((error, stackTrace) {
                  socialMedia_utils.toastMessage_socialMedia(
                      "Error Occured \n" + error.toString(), false);
                });
              },
              icon: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

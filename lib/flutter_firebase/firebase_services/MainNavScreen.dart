import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/postsFirebase/postsScreenFirebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';

import '../ui/Firestore/firestore_list_screen.dart';
import '../ui/auth/login_screen_firebase.dart';
import '../utils/utils_firebase.dart';

class MainNavScreenFirebase extends StatefulWidget {
  const MainNavScreenFirebase({super.key});

  @override
  State<MainNavScreenFirebase> createState() => _MainNavScreenFirebaseState();
}

class _MainNavScreenFirebaseState extends State<MainNavScreenFirebase> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wellcome to Firebase"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  UtilsFirebase()
                      .toastMessageFirebase("Logged Out successfully", true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreenFirebase()));
                }).onError((error, stackTrace) {
                  UtilsFirebase().toastMessageFirebase(
                      "Error Occured \n" + error.toString(), false);
                });
              },
              icon: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            RoundButtonFirebase(title: "Firebase Realtime Database", onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreenFirebase()));
            }),
            SizedBox(height: 50,),
            RoundButtonFirebase(title: "Firestore Database", onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => fireStoreScreen()));
            }),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}

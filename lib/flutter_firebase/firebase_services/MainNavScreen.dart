import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/postsFirebase/postsScreenFirebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';

import '../ui/Firestore/firestore_list_screen.dart';

class MainNavScreenFirebase extends StatefulWidget {
  const MainNavScreenFirebase({super.key});

  @override
  State<MainNavScreenFirebase> createState() => _MainNavScreenFirebaseState();
}

class _MainNavScreenFirebaseState extends State<MainNavScreenFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wellcome to Firebase"),
        centerTitle: true,
      ),
      body: Column(
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
    );
  }
}

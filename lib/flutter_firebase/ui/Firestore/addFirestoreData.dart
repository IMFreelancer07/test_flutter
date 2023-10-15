import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';

class addFireStoreData extends StatefulWidget {
  const addFireStoreData({super.key});

  @override
  State<addFireStoreData> createState() => _addFireStoreDataState();
}

class _addFireStoreDataState extends State<addFireStoreData> {

  final postController = TextEditingController();
  bool loading = false;
  final firebaseCollectionRef = FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Firestore Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: "Whats up! Just blurt out :D",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30,),
            RoundButtonFirebase(
                title: "Add",
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true;
                  });

                  String id = DateTime.now().millisecondsSinceEpoch.toString();

                  firebaseCollectionRef.doc(id).set({

                    'id' : id,
                    'title' : postController.text.toString()
                  }).then((value){
                    UtilsFirebase().toastMessageFirebase("Insertion Successful!", true);
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace){
                    UtilsFirebase().toastMessageFirebase("Error $error", false);
                    setState(() {
                      loading = false;
                    });
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}

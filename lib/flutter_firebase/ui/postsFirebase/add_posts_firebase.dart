import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';

class AddPostsFirebase extends StatefulWidget {
  const AddPostsFirebase({super.key});

  @override
  State<AddPostsFirebase> createState() => _AddPostsFirebaseState();
}

class _AddPostsFirebaseState extends State<AddPostsFirebase> {

  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
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

                  databaseRef.child(id).set({
                    'id' : id,
                    'description' : postController.text.toString()
                  }).then((value){
                    setState(() {
                      loading = false;
                    });
                    UtilsFirebase().toastMessageFirebase("Post Added Successfully!", true);
                  }).onError((error, stackTrace){
                    setState(() {
                      loading = false;
                    });
                    UtilsFirebase().toastMessageFirebase(error.toString(), false);
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}

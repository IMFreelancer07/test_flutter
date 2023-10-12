import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';

class AddPostsFirebase extends StatefulWidget {
  const AddPostsFirebase({super.key});

  @override
  State<AddPostsFirebase> createState() => _AddPostsFirebaseState();
}

class _AddPostsFirebaseState extends State<AddPostsFirebase> {
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
              decoration: InputDecoration(
                hintText: "Whats up! Just blurt out :D",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30,),
            RoundButtonFirebase(
                title: "Add",
                onTap: (){

                }
            )
          ],
        ),
      ),
    );
  }
}

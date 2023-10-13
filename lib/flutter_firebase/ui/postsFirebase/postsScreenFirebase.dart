import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/login_screen_firebase.dart';
import 'package:test_flutter/flutter_firebase/ui/postsFirebase/add_posts_firebase.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:toast/toast.dart';

class PostScreenFirebase extends StatefulWidget {
  const PostScreenFirebase({super.key});

  @override
  State<PostScreenFirebase> createState() => _PostScreenFirebaseState();
}

class _PostScreenFirebaseState extends State<PostScreenFirebase> {

  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [

          IconButton(onPressed: (){
            _auth.signOut().then((value){

              UtilsFirebase().toastMessageFirebase("Logged Out successfully", true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreenFirebase()));

            }).onError((error, stackTrace) {

              UtilsFirebase().toastMessageFirebase("Error Occured \n"+error.toString(), false);
            });
          }, icon: Icon(Icons.logout)),
          SizedBox(width: 10,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPostsFirebase()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text("Loading..."),
                itemBuilder: (context, snapshot, animation, index){
                  return ListTile(
                    title: Text("Post#$index"),
                    subtitle: Text(snapshot.child('description').value.toString()),
                    enabled: true,
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

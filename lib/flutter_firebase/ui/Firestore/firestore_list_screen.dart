import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/Firestore/addFirestoreData.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/login_screen_firebase.dart';
import 'package:test_flutter/flutter_firebase/ui/postsFirebase/add_posts_firebase.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:toast/toast.dart';

class fireStoreScreen extends StatefulWidget {
  const fireStoreScreen({super.key});

  @override
  State<fireStoreScreen> createState() => _fireStoreScreenState();
}

class _fireStoreScreenState extends State<fireStoreScreen> {
  final _auth = FirebaseAuth.instance;
  final searchFilter = TextEditingController();
  final editController = TextEditingController();
  final firebaseColSnapshotRef = FirebaseFirestore.instance.collection("Users").snapshots();
  final firebaseCollectionRef = FirebaseFirestore.instance.collection("Users");

  // @override
  // void initState() {
  //   super.initState();
  //   ref.onValue.listen((event) { });
  // }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => addFireStoreData()));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),

            StreamBuilder<QuerySnapshot>(
                stream: firebaseColSnapshotRef,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){


                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError){
                    UtilsFirebase().toastMessageFirebase("Error", false);
                  }
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            String id = snapshot.data!.docs[index]['id'].toString();
                            String title = snapshot.data!.docs[index]['title'].toString();
                            return ListTile(
                              title: Text(id),
                              subtitle: Text(title),
                              trailing: PopupMenuButton(
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text("Edit"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        showMyDialog(title, id);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text("Delete"),
                                      onTap: () {
                                        firebaseCollectionRef.doc(id).delete();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                }
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(String desc, String id) async {
    editController.text = desc;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update"),
            content: Container(
              child: TextField(
                controller: editController,
                decoration: InputDecoration(hintText: "Edit"),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    firebaseCollectionRef.doc(id).update({
                      "title": editController.text.toString()
                    }).then((value) {
                      UtilsFirebase().toastMessageFirebase(
                          "Data updated successfully!", true);
                    }).onError((error, stackTrace) {
                      UtilsFirebase().toastMessageFirebase(
                          "Error updating data $error", false);
                    });
                  },
                  child: Text("Update")),
            ],
          );
        });
  }
}

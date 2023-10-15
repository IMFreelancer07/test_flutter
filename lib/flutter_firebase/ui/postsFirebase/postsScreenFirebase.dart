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
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (String value){
                setState(() {

                });
              },
            ),
            Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  defaultChild: Center(child: Text("Loading...")),
                  itemBuilder: (context, snapshot, animation, index){

                    final desc = snapshot.child('description').value.toString();
                    final id = snapshot.child('id').value.toString();

                    if(searchFilter.text.isEmpty){
                      return ListTile(
                        title: Text("Id # $id"),
                        subtitle: Text(snapshot.child('description').value.toString()),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context)=>[
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text("Edit"),
                                onTap: (){
                                  Navigator.pop(context);
                                  showMyDialog(desc, id);
                                },
                            ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text("Delete"),
                                onTap: (){
                                  ref.child(id).remove();
                                  Navigator.pop(context);
                                },
                              ),),
                          ],
                        ),
                      );
                    } else if(desc.toLowerCase().contains(searchFilter.text.toLowerCase().toString())){
                      return ListTile(
                        title: Text("Id # $id"),
                        subtitle: Text(snapshot.child('description').value.toString()),
                      );
                    } else {
                      return Container();
                    }
                  }
              ),
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
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Update"),
            content: Container(
              child: TextField(
                controller: editController,
                decoration: InputDecoration(
                  hintText: "Edit"
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    ref.child(id).update({
                      "description" : editController.text.toString()
                    }).then((value) {
                      UtilsFirebase().toastMessageFirebase("Data updated successfully!", true);
                    }).onError((error, stackTrace) {
                      UtilsFirebase().toastMessageFirebase("Error updating data $error", false);
                    });
                  },
                  child: Text("Update")),

            ],
          );
        }
    );
  }
}

//
// Expanded(
// child: StreamBuilder(
// stream: ref.onValue,
// builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
//
// if(!snapshot.hasData){
// return CircularProgressIndicator();
// } else {
//
// Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
// List<dynamic> list = [];
// list.clear();
// list = map.values.toList();
//
// return ListView.builder(
// itemCount: snapshot.data!.snapshot.children.length,
// itemBuilder: (context, index){
// return ListTile(
// title: Text(list[index]["id"]),
// subtitle: Text(list[index]["description"]),
// );
// }
// );
// }
// },
// ),
// ),
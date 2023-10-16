import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:toast/toast.dart';

class uploadImageFirebase extends StatefulWidget {
  const uploadImageFirebase({super.key});

  @override
  State<uploadImageFirebase> createState() => _uploadImageFirebaseState();
}

class _uploadImageFirebaseState extends State<uploadImageFirebase> {

  File? img;
  final _picker = ImagePicker();
  bool showSpinner = false;

  firebaseStorage.FirebaseStorage firebase_storage =  firebaseStorage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref("Post");

  Future getGalleryImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {

    });

    if(pickedFile != null){
      img = File(pickedFile.path);
    }else{
      UtilsFirebase().toastMessageFirebase("Failure: No image picked", false);
    }
  }

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: (){
                  getGalleryImage();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: img != null? Image.file(img!.absolute): Center(child: Icon(Icons.image)),
                ),
              ),
            ),
            SizedBox(height: 30,),
            RoundButtonFirebase(
                title: "Upload",
                loading: showSpinner,
                onTap: () async{

                  setState(() {
                    showSpinner = true;
                  });

                  String imgId = DateTime.now().millisecondsSinceEpoch.toString();
                  firebaseStorage.Reference ref = firebaseStorage.FirebaseStorage.instance.ref("/dummyImages/"+"$imgId");
                  firebaseStorage.UploadTask uploadTask = ref.putFile(img!.absolute);

                  Future.value(uploadTask).then((value) async{
                    UtilsFirebase().toastMessageFirebase("Upload initiated!", true);

                    var newUrl = await ref.getDownloadURL();

                    databaseRef.child("dummyImages").set({
                      "id" : imgId,
                      "imgUrl" : newUrl.toString()
                    }).then((value) {
                      setState(() {
                        showSpinner = false;
                      });
                      UtilsFirebase().toastMessageFirebase("Image Uploaded Successfully!", true);
                    }).onError((error, stackTrace) {
                      setState(() {
                        showSpinner = false;
                      });
                      UtilsFirebase().toastMessageFirebase("Failed to upload Image! $error", false);

                    });

                  }).onError((error, stackTrace){
                    setState(() {
                      showSpinner = false;
                    });
                    UtilsFirebase().toastMessageFirebase("Error: $error", false);
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}

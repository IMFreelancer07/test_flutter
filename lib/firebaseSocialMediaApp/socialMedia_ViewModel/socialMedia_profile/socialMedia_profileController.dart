import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';

class socialMedia_profileController with ChangeNotifier{

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  firebaseStorage.FirebaseStorage storage = firebaseStorage.FirebaseStorage.instance;

  final picker = ImagePicker();
  XFile? _image;
  XFile? get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  setLoading (bool value){
    _loading = value;
    notifyListeners();
  }

  Future pickGalleryImage (BuildContext context)async{
    final pickedImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if(pickedImage != null){
      _image = XFile(pickedImage.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  Future captureCameraImage (BuildContext context)async{
    final pickedImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if(pickedImage != null){
      _image = XFile(pickedImage.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  void pickImage (context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Container(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      captureCameraImage(context);
                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.camera_alt_rounded, color: AppColors.primaryIconColor,),
                    title: Text("Camera"),
                  ),
                  ListTile(
                    onTap: (){
                      pickGalleryImage(context);
                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.image, color: AppColors.primaryIconColor,),
                    title: Text("Gallery"),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void uploadImage (context) async{

    setLoading(true);
    firebaseStorage.Reference storageRef = firebaseStorage.FirebaseStorage.instance.ref('/profileImage'+socialMedia_sessionManager().userId.toString());

    firebaseStorage.UploadTask uploadTask = storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    ref.child(socialMedia_sessionManager().userId.toString()).update({
      'profile' : newUrl.toString()
    }).then((value){
      setLoading(false);
      socialMedia_utils.toastMessage_socialMedia("Imaged uploaded successfully!", true);
      _image = null;

    }).onError((error, stackTrace) {
      setLoading(false);
      socialMedia_utils.toastMessage_socialMedia(error.toString(), false);
    });
  }
}
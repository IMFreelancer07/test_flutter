import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_input_text_field.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';

class socialMedia_profileController with ChangeNotifier{

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  firebaseStorage.FirebaseStorage storage = firebaseStorage.FirebaseStorage.instance;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

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
    firebaseStorage.Reference storageRef = firebaseStorage.FirebaseStorage.instance.ref('/profileImages/'+socialMedia_sessionManager().userId.toString());

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

  Future<void> showUserNameDialogAlert(BuildContext context, String name){

    nameController.text = name;

    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text("Update Username")),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  socialMedia_inputFormField(
                      myController: nameController,
                      focusNode: nameFocusNode,
                      onFieldSubmittedValue: (value){},
                      onValidator: (value){},
                      keyBoardType: TextInputType.text,
                      hint: "Update name",
                      obscureText: false
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.alertColor),)
              ),
              TextButton(
                  onPressed: (){
                    
                    ref.child(socialMedia_sessionManager().userId.toString()).update({
                      'userName' : nameController.text.toString()
                    }).then((value){
                      nameController.clear();
                      socialMedia_utils.toastMessage_socialMedia("Name Updated", true);
                    }).onError((error, stackTrace){
                      socialMedia_utils.toastMessage_socialMedia(error.toString(), false);
                    });
                    
                    Navigator.pop(context);
                  },
                  child: Text("Ok", style: Theme.of(context).textTheme.subtitle2,)
              ),
            ],
          );
        }
    );
  }

  Future<void> showPhoneDialogAlert(BuildContext context, String phone){

    phoneController.text = phone;

    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text("Update Username")),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  socialMedia_inputFormField(
                      myController: phoneController,
                      focusNode: phoneFocusNode,
                      onFieldSubmittedValue: (value){},
                      onValidator: (value){},
                      keyBoardType: TextInputType.phone,
                      hint: "Update phone",
                      obscureText: false
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.alertColor),)
              ),
              TextButton(
                  onPressed: (){

                    ref.child(socialMedia_sessionManager().userId.toString()).update({
                      'phone' : phoneController.text.toString()
                    }).then((value){
                      phoneController.clear();
                      socialMedia_utils.toastMessage_socialMedia("Phone Updated", true);
                    }).onError((error, stackTrace){
                      socialMedia_utils.toastMessage_socialMedia(error.toString(), false);
                    });

                    Navigator.pop(context);
                  },
                  child: Text("Ok", style: Theme.of(context).textTheme.subtitle2,)
              ),
            ],
          );
        }
    );
  }
}
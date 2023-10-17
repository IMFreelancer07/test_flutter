import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:toast/toast.dart';

class uploadFile_PostApi extends StatefulWidget {
  const uploadFile_PostApi({super.key});

  @override
  State<uploadFile_PostApi> createState() => _uploadFile_PostApiState();
}

class _uploadFile_PostApiState extends State<uploadFile_PostApi> {

  File? img;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImg () async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if(pickedFile != null) {
      img = File(pickedFile.path);
      setState(() {

      });
    } else {
      print("Error, can't pick!");
    }
  }


  Future<void> uploadImg () async {

    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(img!.openRead());
    stream.cast();

    var length = await img!.length();
    var uri = Uri.parse("https://fakestoreapi.com/products");

    var request = new http.MultipartRequest("POST", uri);

    request.fields["title"] = "API Title";

    var multipart = new http.MultipartFile(
        "image",
        stream,
        length);
    
    request.files.add(multipart);

    var response = await request.send();

    if (response.statusCode == 200){
      print("Image uploaded successfully!");
      UtilsFirebase().toastMessageFirebase("Upload successful!", true);
      setState(() {
        showSpinner = false;
      });
    }else{
      print("Error! failed to upload image to server!");
      UtilsFirebase().toastMessageFirebase("Error! failed to upload!", false);
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Upload File"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                getImg();
              },
              child: Container(
                child: img == null ? Center(child: Text("Pick Image"),) :
                    Container(
                      child: Center(
                        child: Image.file(
                          File(img!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              ),
            ),

            SizedBox(height: 150,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                  uploadImg();
                },
                child: Container(
                  height: 50,
                  color: Colors.blueGrey,
                  child: Center(child: Text("Upload",style: TextStyle(color: Colors.white),),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/verify_phone_firebase.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';

import '../../../mvvm/res/components/round_button.dart';

class PhoneLoginFirebase extends StatefulWidget {
  const PhoneLoginFirebase({super.key});

  @override
  State<PhoneLoginFirebase> createState() => _PhoneLoginFirebaseState();
}

class _PhoneLoginFirebaseState extends State<PhoneLoginFirebase> {

  bool _loading = false;
  final phoneNumberController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "+0 000 0000 000"
              ),
            ),
            SizedBox(height: 50,),
            RoundButton(title: "Verify", isLoading: _loading, onPress: (){

              setState(() {
                _loading = true;
              });
              _auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                    setState(() {
                      _loading = false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      _loading = false;
                    });
                    UtilsFirebase().toastMessageFirebase(e.toString());
                  },
                  codeSent: (String verificationId, int? tokenMsg){
                    setState(() {
                      _loading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> VerifyPhoneFirebase(
                              verificationId: verificationId,)
                        ),
                    );
                  },
                  codeAutoRetrievalTimeout: (e){
                    UtilsFirebase().toastMessageFirebase(e.toString());
                  }
              );
            }),
          ],
        ),
      ),
    );
  }
}

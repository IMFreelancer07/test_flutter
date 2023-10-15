import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/firebase_services/MainNavScreen.dart';
import 'package:test_flutter/flutter_firebase/ui/postsFirebase/postsScreenFirebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';
import '../../utils/utils_firebase.dart';

class VerifyPhoneFirebase extends StatefulWidget {

  final String verificationId;

  VerifyPhoneFirebase({super.key, required this.verificationId});

  @override
  State<VerifyPhoneFirebase> createState() => _VerifyPhoneFirebaseState();
}

class _VerifyPhoneFirebaseState extends State<VerifyPhoneFirebase> {


  bool _loading = false;
  final verificationCodeController = TextEditingController();
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
              controller: verificationCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "6 digit code"
              ),
            ),
            SizedBox(height: 50,),
            RoundButtonFirebase(title: "Login", loading: _loading, onTap: () async{

              setState(() {
                _loading = true;
              });

              final credentials =
              PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verificationCodeController.text.toString(),
              );

              try{
                await _auth.signInWithCredential(credentials);

                setState(() {
                  _loading = false;
                });

                Navigator.push(context, MaterialPageRoute(builder: (context)=> MainNavScreenFirebase()));
              }catch(e){

                setState(() {
                  _loading = false;
                });

                UtilsFirebase().toastMessageFirebase(e.toString(), false);
              }

            }),
          ],
        ),
      ),
    );
  }
}

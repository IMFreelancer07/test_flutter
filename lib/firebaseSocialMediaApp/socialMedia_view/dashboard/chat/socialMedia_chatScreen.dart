import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';
import 'package:toast/toast.dart';

class socialMedia_chatScreen extends StatefulWidget {

  final String image, name, email, receiverId;
  socialMedia_chatScreen(
      {
        super.key,
        required this.image,
        required this.name,
        required this.email,
        required this.receiverId
      }
      );

  @override
  State<socialMedia_chatScreen> createState() => _socialMedia_chatScreenState();
}
class _socialMedia_chatScreenState extends State<socialMedia_chatScreen> {

  final messageController = TextEditingController();
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("Chat");

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index){
                      return Text(index.toString());
                    }
                )
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        controller: messageController,
                        cursorColor: AppColors.primaryTextTextColor,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 0, fontSize: 19),
                        decoration: InputDecoration(
                          hintText: "Enter Message",
                          suffixIcon: InkWell(
                            onTap: (){
                              sendMessage();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: AppColors.primaryIconColor,
                                child: Icon(Icons.send, color: Colors.white,),
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(height: 0, color: AppColors.primaryTextTextColor.withOpacity(0.8)),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.alertColor),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(){
    if(messageController.text.isEmpty){
      socialMedia_utils.toastMessage_socialMedia("Enter text to send.", false);
    }else{

      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

      ref.child(timeStamp).set({
        'isSeen' : false,
        'message': messageController.text.toString(),
        'sender' : socialMedia_sessionManager().userId.toString(),
        'receiver': widget.receiverId,
        'type'    : 'text',
        'time'    : timeStamp.toString()
      }).then((value) {
        messageController.clear();
      }).onError((error, stackTrace) {

      });
    }
  }

}


import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/dashboard/chat/socialMedia_chatScreen.dart';

class socialMedia_userListScreen extends StatefulWidget {
  const socialMedia_userListScreen({super.key});

  @override
  State<socialMedia_userListScreen> createState() => _socialMedia_userListScreenState();
}

class _socialMedia_userListScreenState extends State<socialMedia_userListScreen> {

  DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, dataSnap, animation, index){

            if(socialMedia_sessionManager().userId.toString() == dataSnap.child('uid').value.toString()){
              return Container();
            }else{
              return Card(
                child: ListTile(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: socialMedia_chatScreen(
                          image: dataSnap.child('profile').value.toString(),
                          name: dataSnap.child('userName').value.toString(),
                          email: dataSnap.child('email').value.toString(),
                          receiverId: dataSnap.child('uid').value.toString(),
                        ),
                        withNavBar: false,
                    );
                  },
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.primaryButtonColor
                        )
                    ),
                    child: dataSnap.child('profile').value.toString() == "" ? Icon(Icons.person) :
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(dataSnap.child('profile').value.toString()
                        ),
                      ),
                    ),
                  ),
                  title: Text(dataSnap.child('userName').value.toString()),
                  subtitle: Text(dataSnap.child('email').value.toString()),

                ),
              );
            }
          },
        ),
      ),
    );
  }
}

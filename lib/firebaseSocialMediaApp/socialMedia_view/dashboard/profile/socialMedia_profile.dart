import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';

class socialMedia_profileScreen extends StatefulWidget {
  const socialMedia_profileScreen({super.key});

  @override
  State<socialMedia_profileScreen> createState() => _socialMedia_profileScreenState();
}

class _socialMedia_profileScreenState extends State<socialMedia_profileScreen> {

  final ref = FirebaseDatabase.instance.ref('User');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: StreamBuilder(
            stream: ref.child(socialMedia_sessionManager().userId.toString()).onValue,
            builder: (context, AsyncSnapshot snapshot){

              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }else if(snapshot.hasData){
                Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    SizedBox(height: 20,),

                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryTextTextColor,
                                )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: map["profile"] == "" ? Icon(Icons.person, size: 40,) : Image(
                                fit: BoxFit.cover,
                                image:  NetworkImage(map["profile"].toString()),
                                loadingBuilder: (context, child, loadingProgress){
                                  if(loadingProgress == null) return child;
                                  return Center(child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, object, stackTrace){
                                  return Container(
                                    child: Icon(Icons.error, color: AppColors.alertColor,),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryIconColor,
                          child: Icon(Icons.add_outlined),
                        )
                      ],
                    ),

                    SizedBox(height: 40,),
                    
                    reuseableRow_socialMedia(iconData: Icons.person, title: "Username", value: map["userName"]),
                    reuseableRow_socialMedia(iconData: Icons.phone_android, title: "Phone Number", value: map["phone"] == '' ? 'xxx-xxx-xxx-xxxx' : map["phone"]),
                    reuseableRow_socialMedia(iconData: Icons.alternate_email, title: "Email", value: map["email"]),
                  ],
                );
              } else {
                return Center(child: Text("Something went wrong.", style: Theme.of(context).textTheme.subtitle1,));
              }
            },
          ),
        ),
      ),
    );
  }
}


class reuseableRow_socialMedia extends StatelessWidget {

  final String title, value;
  final IconData iconData;

  reuseableRow_socialMedia({super.key, required this.iconData, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData, color: AppColors.primaryIconColor,),
          title: Text(title, style: Theme.of(context).textTheme.subtitle2,),
          trailing: Text(value, style: Theme.of(context).textTheme.subtitle2,),
        ),
        Divider(color: AppColors.dividedColor.withOpacity(0.5),)
      ],
    );
  }
}

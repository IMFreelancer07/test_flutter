import 'package:flutter/material.dart';
import 'package:test_flutter/multirole_App/multi_role_home.dart';

 class Splash_Screen extends StatefulWidget {
   const Splash_Screen({super.key});
 
   @override
   State<Splash_Screen> createState() => _Splash_ScreenState();
 }
 
 class _Splash_ScreenState extends State<Splash_Screen> {

   @override
  void initState() {

    super.initState();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> MR_Home()),
    );
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Image(
         height: double.infinity,
         fit: BoxFit.fitHeight,
         image: NetworkImage("https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/light-bulb-and-splash-water-setsiri-silapasuwanchai.jpg"),
       ),
     );
   }
 }
 
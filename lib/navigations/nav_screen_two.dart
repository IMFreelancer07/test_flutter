import 'package:flutter/material.dart';
import 'package:test_flutter/navigations/nav_third_screen.dart';

class ScreenTwoNav extends StatefulWidget {
  final String name;
  final int number;
  const ScreenTwoNav({super.key, required this.name, this.number = 6});

  @override
  State<ScreenTwoNav> createState() => _ScreenTwoNavState();
}

class _ScreenTwoNavState extends State<ScreenTwoNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Two Nav"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Credentials passed : $num"),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenThreeNav())
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey
                ),
                child: Center(
                  child: Text("ScreenThree"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

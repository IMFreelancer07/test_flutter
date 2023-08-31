import 'package:flutter/material.dart';

class ScreenThreeNav extends StatefulWidget {
  const ScreenThreeNav({super.key});

  @override
  State<ScreenThreeNav> createState() => _ScreenThreeNavState();
}

class _ScreenThreeNavState extends State<ScreenThreeNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Three Nav"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey
                ),
                child: Center(
                  child: Text("Back to Home"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

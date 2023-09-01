import 'package:flutter/material.dart';
import 'package:test_flutter/navigations/nav_third_screen.dart';
import 'package:test_flutter/utils/routes_name.dart';

class ScreenTwoNav extends StatefulWidget {
  dynamic data;

  ScreenTwoNav({super.key, required this.data});

  @override
  State<ScreenTwoNav> createState() => _ScreenTwoNavState();
}

class _ScreenTwoNavState extends State<ScreenTwoNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScreenTwo Nav"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Credentials passed : Key0 = "+widget.data["Key0"]+"; Key1 = "+widget.data["Key1"]),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.screenThreeNav);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ScreenThreeNav())
                // );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueGrey),
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

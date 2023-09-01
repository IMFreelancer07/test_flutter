import 'package:flutter/material.dart';
import 'package:test_flutter/navigations/nav_screen_two.dart';
import 'package:test_flutter/utils/routes_name.dart';

class NavHomeScreen extends StatefulWidget {
  const NavHomeScreen({super.key});

  @override
  State<NavHomeScreen> createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen Nav"),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {

                  Navigator.pushNamed(context, RouteName.screenTwoNav, arguments: {
                    "Key0" : "This is data for Key 0",
                    "Key1" : "Key1 Data Huhuhaha!"
                  });

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ScreenTwoNav(
                  //           name: 'Syed Dev',
                  //           number: 07,
                  //         )));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.blueGrey),
                  child: Center(
                    child: Text("ScreenTwo"),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

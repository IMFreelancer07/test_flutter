import 'package:flutter/material.dart';
import 'package:test_flutter/navigations/nav_screen_two.dart';

class NavHomeScreen extends StatefulWidget {
  const NavHomeScreen({super.key});

  @override
  State<NavHomeScreen> createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenTwoNav(
                            name: 'Syed Dev',
                            number: 07,
                          )));
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

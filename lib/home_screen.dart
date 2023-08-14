import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/second_screen.dart';

class HomeScreen extends StatefulWidget {

  static const String id = "Home_Screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage("https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png"),
                ),
                accountName: Text("Syed Shahbaz"),
                accountEmail: Text("imfreelancer07@gmail.com")
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Second Screen"),
              onTap: (){
                Navigator.pushNamed(context, SecondScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){
                Navigator.pushNamed(context, MyApp.id);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: (){
                Navigator.pushNamed(context, SecondScreen.id);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => SecondScreen())
                // );
              },
              child: Center(
                  child: Text("Second Screen")
              ),
          )
        ],
      ),
    );
  }
}

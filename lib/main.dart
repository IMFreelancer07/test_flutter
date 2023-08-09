import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        height: 50,
                        width: 50,
                        image: AssetImage('images/logo.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Maintenance",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Rubik Medium",
                              color: Color(0xff2D3142)),
                        ),
                        Text(
                          "Box",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Rubik Medium",
                              color: Color(0xffF9703B)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Rubik Medium",
                      color: Color(0xff2D3142)),
                )),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                    child: Text(
                  "Lorem ipsum intro text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Rubik Regular",
                      color: Color(0xff4C5980)),
                )),

                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      fillColor: Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon: Icon(Icons.alternate_email, color: Color(0xff323F4B),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Color(0xff323F4B),),
                      suffixIcon: Icon(Icons.visibility_off),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontFamily: "Rubik Regular",
                            color: Color(0xff4C5980)),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 50,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xffF9703B),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Rubik Regular",
                          color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an Account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Regular",
                          color: Color(0xff4C5980)),
                    ),
                    Text(
                      "SignUp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Medium",
                          color: Color(0xffF9703B),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

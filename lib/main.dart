import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Text Fields'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Color emailBorderColor = Colors.transparent;
  Color passwordBorderColor = Colors.transparent;
  Color suffixIconColor = Colors.transparent;

  bool isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 0),
            child: Stack(
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 38),
                    child: Material(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: email,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: emailBorderColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: emailBorderColor),
                          ),
                          suffixIcon: Icon(
                            Icons.verified,
                            size: 20,
                            color: suffixIconColor,
                          ),
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),

                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  elevation: 7,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: emailBorderColor,
                          width: 1.0,
                        ),

                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 38,),
                    child: Material(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: password,
                        obscureText: !isPasswordVisible,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: passwordBorderColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: passwordBorderColor),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        ),
                      ),
                    ),
                  ),
                ),

                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                    ),
                  elevation: 7,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: passwordBorderColor,
                          width: 1.0, // Set the border width
                        ),
                        ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),

              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                if (email.text == 'abc' && password.text == '12345') {
                  emailBorderColor = Colors.green;
                  passwordBorderColor = Colors.green;
                  suffixIconColor = Colors.green;

                } else {
                  emailBorderColor = Colors.red;
                  passwordBorderColor = Colors.red;
                  suffixIconColor = Colors.transparent;
                }
              });
            },
            child: Text('Login'),
          ),

        ],
      ),
    );
  }
}

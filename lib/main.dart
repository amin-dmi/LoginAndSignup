import 'package:flutter/material.dart';
import 'package:flutterlogin/login_page.dart';

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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff1E1E1E),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'B612'),
        ),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xff545458),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            )),
        textButtonTheme:  TextButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(11))),
            backgroundColor: MaterialStateProperty.all(Color(0xff545458),

            ),
          ),
        ),
      ),
      home: login(),
    );
  }
}

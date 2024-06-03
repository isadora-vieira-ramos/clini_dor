import 'package:clini_dor/pages/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   final ThemeData theme = ThemeData();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0xff2ec4b6),
          secondary: Colors.white,
          tertiary: Color(0xffff9f1c)
        ) 
      ),
      home: IntroPage(),
    );
  }
}


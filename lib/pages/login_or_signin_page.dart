import 'package:clini_dor/pages/login_page.dart';
import 'package:clini_dor/pages/signin_page.dart';
import 'package:flutter/material.dart';

class LoginOrSignInPage extends StatefulWidget {
  const LoginOrSignInPage({super.key});

  @override
  State<LoginOrSignInPage> createState() => _LoginOrSignInPageState();
}

class _LoginOrSignInPageState extends State<LoginOrSignInPage> {
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!showLoginPage){
      return LoginPage(
        onTap: togglePages
      );
    }else{
      return SignInPage(
        onTap: togglePages
      );
    }
  }
}
import 'package:clini_dor/pages/home_page.dart';
import 'package:clini_dor/pages/login_or_signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapchot){
          //usuario logado
          if(snapchot.hasData){
            return const HomePage();
          }
          //não logado
          else{
            return const LoginOrSignInPage();
          }
        }
      )
    );
  }
}
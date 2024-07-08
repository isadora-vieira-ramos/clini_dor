import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/pages/auth_page.dart';
import 'package:clini_dor/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void signUserIn() async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        )
                      )
                    ),
                    StandardTextfield(
                      controller: _emailController, 
                      hintText: 'Email', 
                      obscureText: false
                    ),
                    StandardTextfield(
                      controller: _passwordController, 
                      hintText: 'Senha', 
                      obscureText: true
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15, right: 20, left: 20),
                      child: GestureDetector(
                        onTap: signUserIn,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(
                              'ENTRAR',
                              style: GoogleFonts.josefinSans(
                                textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
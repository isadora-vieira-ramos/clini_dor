import 'dart:async';

import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/pages/auth_page.dart';
import 'package:clini_dor/pages/home_page.dart';
import 'package:clini_dor/pages/signin_page.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {

    void signUserIn() async{

      if(_formKey.currentState == null || !_formKey.currentState!.validate()){
        return;
      }

      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pop(context);
      }on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          setState(() {
            errorMessage = "Usuário não encontrado.";
          });
        }
        else{
          setState(() {
            errorMessage = "Credenciais inválidas.";
          });
        }
      }catch (e){
        Navigator.pop(context);
        setState(() {
         errorMessage = "Credenciais inválidas";
        });
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
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
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 75,
                          child: StandardTextfield(
                            controller: _emailController, 
                            hintText: 'Email', 
                            obscureText: false,
                            enabled: true,
                          )
                        ),
                        SizedBox(
                          height: 75,
                          child: StandardTextfield(
                            controller: _passwordController, 
                            hintText: 'Senha', 
                            obscureText: true,
                            enabled: true,
                          )
                        ),
                        Visibility(
                          visible: errorMessage.isEmpty ? false : true,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(
                                errorMessage,
                                style: TextStyle(
                                  color: Colors.red[900],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
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
                                      color: ColorUtils.getMaterialColor(Colors.black).shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Primeiro acesso? Cadastre-se',
                                style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )
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
          ),
        ),
      )
    );
  }
}
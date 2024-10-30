import 'dart:async';
import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isNotEmpty && !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    void forgotPassword(){

      TextEditingController emailController = TextEditingController();
      AlertDialog alertDialog = AlertDialog(
        title: Text(
          "Trocar a senha",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
            )
          )
        ),
        content: TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "email",
          ),
          validator: validateEmail,
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )
              ),
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.tertiary
              ),
            ),
            child: Text(
              "Enviar",
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              )
            ),
            onPressed: () async => {
              if(emailController.text.isNotEmpty){
                FirebaseAuth.instance.sendPasswordResetEmail(
                  email: emailController.text 
                ).then((value) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email Enviado!")));
                })
              }
            },
          )
        ],
      );
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return alertDialog;
        }
      );
    }

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Clinidor",
                      style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
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
                        GestureDetector(
                          onTap: forgotPassword,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Esqueceu a senha?',
                                style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  fontSize: 16,
                                )
                              ),
                            ),
                          ),
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
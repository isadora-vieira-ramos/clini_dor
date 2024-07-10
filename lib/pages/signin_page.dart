import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/pages/auth_page.dart';
import 'package:clini_dor/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  final Function()? onTap;
  const SignInPage({super.key, required this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String errorMessage = "";

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );

    try{
      if(_passwordController.text == _confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _userController.text, 
          password: _passwordController.text
        );
      }else{
        setState(() {
          errorMessage = "Senha e confirmação da senha não correspondem";
        });
      }
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = "Erro ao cadastrar. Tente novamente";
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Cadastre-se',
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary
                            )
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 75,
                        child:  StandardTextfield(
                          controller: _nameController, 
                          hintText: 'Nome', 
                          obscureText: false
                        )
                      ),
                      SizedBox(
                        height: 75,
                        child: StandardTextfield(
                          controller: _userController, 
                          hintText: 'Usuário', 
                          obscureText: false
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: StandardTextfield(
                          controller: _passwordController, 
                          hintText: 'Senha', 
                          obscureText: true
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: StandardTextfield(
                          controller: _confirmPasswordController, 
                          hintText: 'Confirmar Senha', 
                          obscureText: true
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
                                'CADASTRAR',
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
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              'Já tem cadastro? Faça login aqui',
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
      )
    );
  }
}
import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordRecord = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Text(
                      'Cadastre-se',
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                    ),
                    StandardTextfield(
                      controller: _nameController, 
                      hintText: 'Nome', 
                      obscureText: false
                    ),
                    StandardTextfield(
                      controller: _userController, 
                      hintText: 'Usuário', 
                      obscureText: false
                    ),
                    StandardTextfield(
                      controller: _passwordRecord, 
                      hintText: 'Senha', 
                      obscureText: true
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15, right: 20, left: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
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
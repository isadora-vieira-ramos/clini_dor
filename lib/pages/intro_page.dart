import 'package:clini_dor/pages/auth_page.dart';
import 'package:clini_dor/pages/login_page.dart';
import 'package:clini_dor/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('lib/images/logo_hcpa.jpg', height: 50),
                    Image.asset('lib/images/lab_dor_neuro_logo.png', height: 70),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'CliniDor',
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Bem vindo(a) ao app CliniDor, que busca ajudar os pacientes no tratamento de dores crônicas',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                              color:Colors.black
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )
                        ),                     
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthPage())),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 400),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(25.0),
                        child: Center(
                          child: Text(
                            'ACESSAR',
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
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
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
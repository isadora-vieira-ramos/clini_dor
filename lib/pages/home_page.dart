import 'package:clini_dor/pages/about_page.dart';
import 'package:clini_dor/pages/auth_page.dart';
import 'package:clini_dor/pages/conducts_page.dart';
import 'package:clini_dor/pages/evaluation_page.dart';
import 'package:clini_dor/pages/intro_page.dart';
import 'package:clini_dor/pages/patients_page.dart';
import 'package:clini_dor/pages/questionnaire_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  void navigateBar(int index){
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  final List<Widget> _pages = [
    const PatientPage(),
    const EvaluationPage(),
    const QuestionnairePage(),
    const ConductsPage(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.only(left:12),
              child: Icon(
                Icons.menu,
                color: Colors.white
              ),
            )
          )
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: Column(
          children: [
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () => navigateBar(0),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.black),
                  title: Text('Pacientes', style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => navigateBar(1),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.notes, color: Colors.black),
                  title: Text('Avaliações', style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => navigateBar(2),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.question_answer, color: Colors.black),
                  title: Text('Questionário', style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => navigateBar(3),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.health_and_safety, color: Colors.black),
                  title: Text('Condutas', style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => navigateBar(4),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.black),
                  title: Text('Sobre', style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
        ],),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
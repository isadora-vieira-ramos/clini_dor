import 'package:clini_dor/pages/about_page.dart';
import 'package:clini_dor/pages/intro_page.dart';
import 'package:clini_dor/pages/patient/patient_list_page.dart';
import 'package:flutter/material.dart';
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

  final _pages = [
    const PatientListPage(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text(
          _selectedIndex == 0? "Pacientes": "Sobre",
          style: GoogleFonts.josefinSans(
            fontSize: 25,
            color: Colors.white
          )
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                      leading: Icon(Icons.info, color: Colors.black),
                      title: Text('Sobre', style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroPage())),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom:25.0),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.black),
                  title: Text('Sair', style: TextStyle(color: Colors.black),),
                ),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
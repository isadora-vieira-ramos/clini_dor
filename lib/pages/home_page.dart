import 'package:clini_dor/pages/about_page.dart';
import 'package:clini_dor/pages/patient/patient_list_page.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

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
            textStyle: const TextStyle(
              fontSize: 25,
              color: Colors.black
            )
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
                color: Colors.black
              ),
            )
          )
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: ColorUtils.getMaterialColor(Theme.of(context).colorScheme.tertiary).shade400
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left:25.0),
                        child: Icon(Icons.account_circle, color: Colors.black, size: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(FirebaseAuth.instance.currentUser!.displayName != null)...[
                              Text(
                                FirebaseAuth.instance.currentUser!.displayName!, 
                                style: const TextStyle(
                                  color:  Colors.black,
                                  fontSize: 22
                                )
                              )
                            ],
                            if(FirebaseAuth.instance.currentUser!.email != null)...[
                              Text(
                                FirebaseAuth.instance.currentUser!.email!, 
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                                )
                              ),
                            ]
                          ],
                        ),
                      ) 
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => navigateBar(0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.groups, color: ColorUtils.getMaterialColor(Theme.of(context).colorScheme.tertiary).shade700),
                      title: const Text('Pacientes', style: TextStyle(color: Colors.black, fontSize: 20),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => navigateBar(1),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.info, color:  ColorUtils.getMaterialColor(Theme.of(context).colorScheme.tertiary).shade700),
                      title: const Text('Sobre', style: TextStyle(color: Colors.black, fontSize: 20),),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: signUserOut,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom:25.0),
                child: ListTile(
                  leading: Icon(Icons.logout, color: ColorUtils.getMaterialColor(Theme.of(context).colorScheme.tertiary).shade700),
                  title: const Text('Sair', style: TextStyle(color: Colors.black, fontSize: 20),),
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
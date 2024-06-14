import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/loading_component.dart';
import 'package:clini_dor/components/no_items.dart';
import 'package:clini_dor/components/patient_tile.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/models/patients.dart';
import 'package:clini_dor/pages/register_patient_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListPage extends StatefulWidget {
  
  const PatientListPage({super.key});
  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  late TextEditingController _controller;
  bool loaded = false;
  List<Patient> filteredPatients = [];
  List<Patient> allPatients = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Future<void> getPatients() async {
    if(!loaded){
      allPatients = await Patients.getPatientsAsync();
      filteredPatients = allPatients;
      loaded = true;
    }
  }

  void filterPatients(value) async{
    if(value.toString().length>=3){
      setState(() {
        filteredPatients = allPatients.where((patient) => patient.name.toLowerCase().contains(value.toString().toLowerCase())).toList();
      });
    }else if(value.toString().isEmpty){
      setState(() {
        filteredPatients = allPatients;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Consumer<Patients>(
        builder: (context, value, child) =>Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPatientPage()))),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (text) {
                    filterPatients(text);
                  },
                  controller: _controller,
                  style: const TextStyle(
                    fontSize: 15
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0, 
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: "Pesquisar",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(Icons.search)
                  ),
                ),
              ),
              FutureBuilder(
                future: getPatients(), 
                builder: (context, snapshot) {
                  if(snapshot.connectionState != ConnectionState.done){
                    return const LoadingComponent();
                  }
                  else{
                    if(filteredPatients.isNotEmpty){
                      return Expanded(
                        child: ListView.builder(
                          itemCount: filteredPatients.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            Patient patient = filteredPatients[index];
                            return PatientTile(patient: patient);
                          },
                        )
                      );
                    }else{
                      return NoItemsMessagem(message: "Nenhum paciente cadastrado.");
                    }
                  } 
                  
                }
              ),
            ],
          )
        )
      ),
    );
  }
}
import 'package:clini_dor/components/medicine_tile.dart';
import 'package:clini_dor/models/medicine.dart';
import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/pages/question/add_medicine.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineListQuestion extends StatefulWidget {
  final Question question;
  final Function registerAnswer;
  String? currentAnswer;
  MedicineListQuestion({super.key, required this.question, required this.registerAnswer,  this.currentAnswer});

  @override
  State<MedicineListQuestion> createState() => _MedicineQuestionState();
}

class _MedicineQuestionState extends State<MedicineListQuestion> {
  final _formKey = GlobalKey<FormState>();
  bool showTextFields = false;
  TextEditingController medicineName = TextEditingController();
  TextEditingController medicineWeekFrequency = TextEditingController();
  TextEditingController medicineMonthlyFrequency = TextEditingController(); 
  List<Medicine> medicineList = [];
  
  @override
  void initState() {
    super.initState();
    loadMedicineList();
  }

  @override
  void didUpdateWidget(MedicineListQuestion oldWidget){
    loadMedicineList();
  }

  void loadMedicineList(){
    if(widget.currentAnswer!.isNotEmpty && widget.currentAnswer! != "Não"){
      medicineList = [];
      List<String> answers = widget.currentAnswer!.split("},");
      answers.forEach((element) {
        element.replaceAll("{", "");
        element.replaceAll("}", "");
        var values = element.split(",");
        String name = values[0].split(":")[1];
        int weekUse = int.tryParse(values[1].split(":")[1])?? 0;
        int monthlyUse = int.tryParse(values[2].split(":")[1]) ?? 0;
        setState(() {
          medicineList.add(Medicine(name: name, weeklyFrequencyUse: weekUse, monthlyFrequencyUse: monthlyUse));
        });
      },);
    }else{
      setState(() {
        medicineList = [];
      });
    }
  }

  getMedicineValue(String key){
    if(widget.currentAnswer == "Não"){
      return "Não";
    }else{
      if(widget.currentAnswer != null && widget.currentAnswer!.isNotEmpty){
        List<String> medicineInformation = widget.currentAnswer!.split(",");
        var answer = medicineInformation.where((element) => element.contains(key));
        if(answer.isNotEmpty){
          var value = answer.toList()[0].split(":")[1];
          return value;
        }
      }else{
        return widget.currentAnswer;
      }
    }
  }

  List<String> opcoes = ["Sim", "Não"];

  getRadioListValue(){
    if(widget.currentAnswer == "Não"){
      return "Não";
    }else{
      if(widget.currentAnswer != null && widget.currentAnswer!.isNotEmpty){
        return "Sim";
      }else{
        return "";
      } 
    }
  } 

  @override
  Widget build(BuildContext context) {

    void deleteMedicine(int index){
      setState(() {
        medicineList.removeAt(index);
      });
    }

    void changeTextFieldValue(){
      setState(() {
        showTextFields = !showTextFields;
      });
    }

    void addMedicine(){
      if(_formKey.currentState == null || !_formKey.currentState!.validate()){
        return;
      }
      var weekFrequency = int.parse(medicineWeekFrequency.text);
      var monthFrequency = int.parse(medicineMonthlyFrequency.text);
      setState(() {
        medicineList.add(Medicine(name: medicineName.text, weeklyFrequencyUse: weekFrequency, monthlyFrequencyUse: monthFrequency));
        showTextFields = !showTextFields;
      });
      List<String> jsonMedicineList = [];
      for (var item in medicineList){
        jsonMedicineList.add(item.toJson().toString());
      }
      widget.registerAnswer(widget.question.id, jsonMedicineList);

      medicineName.text = "";
      medicineWeekFrequency.text = "";
      medicineMonthlyFrequency.text = "";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  widget.question.questionText,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20
                  )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 150, minHeight: 50),
                child: ListView.builder(
                  itemCount: opcoes.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: opcoes[index].toString(), 
                      groupValue: getRadioListValue(), 
                      title: Text(opcoes[index]),
                      onChanged: (value){
                        List<String> registeredAnswer = [];
                        if(value.toString() == "Não"){
                          registeredAnswer.add(value.toString());
                          widget.registerAnswer(widget.question.id, registeredAnswer);
                        }else{
                          widget.registerAnswer(widget.question.id, registeredAnswer);
                        }
                        setState(() {
                          widget.currentAnswer = value.toString();
                        });
                      }
                    );
                  }
                )
              ),
              if(getRadioListValue() == "Sim")...[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Lista de medicamentos do tipo utilizados",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold          
                      )
                    ),
                  ),
                ),
                Visibility(
                  visible: medicineList.isNotEmpty? true: false,
                  child:Padding(
                    padding: EdgeInsets.all(showTextFields == true? 8: 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: medicineList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Medicine medicine = Medicine(
                          name: medicineList[index].name, 
                          weeklyFrequencyUse: medicineList[index].weeklyFrequencyUse, 
                          monthlyFrequencyUse: medicineList[index].monthlyFrequencyUse
                        );
                        return MedicineTile(medicine:medicine, deleteItem: () => deleteMedicine(index));
                      }
                    ),
                  ),
                ),
                if(showTextFields)...[
                  Form(
                    key: _formKey,
                    child: AddMedicine(
                      medicineName: medicineName, 
                      medicineWeekFrequency: medicineWeekFrequency,
                      medicineMonthlyFrequency: medicineMonthlyFrequency,
                      options: widget.question.options,
                    )
                  )
                ],
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FilledButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorUtils.getMaterialColor(Theme.of(context).colorScheme.tertiary),
                        foregroundColor: Colors.black
                      ),
                      onPressed: showTextFields == true? addMedicine: changeTextFieldValue, 
                      icon: showTextFields == true? const Icon(Icons.save_outlined): const Icon(Icons.add),
                      label: Text(
                        showTextFields == true? "Salvar": "Incluir",
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100)
              ]
            ]
          ),
        ),
      )
    );
  }
}
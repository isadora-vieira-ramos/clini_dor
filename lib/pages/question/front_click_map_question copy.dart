import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class FrontClickMapQuestion extends StatefulWidget {
  Question question;
  FrontClickMapQuestion({super.key, required this.question});

  @override
  State<FrontClickMapQuestion> createState() => _FrontClickMapQuestionState();
}

class _FrontClickMapQuestionState extends State<FrontClickMapQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Image.asset(widget.question.questionImage.toString(), fit: BoxFit.fill),
                        )
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 80, left: 50),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 80, right: 50),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 150),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 140, left: 150),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 140, right: 150),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 220, right: 150),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 220, left: 150),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 275),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 275, left: 170),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 275, right: 170),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 320, right: 120),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 320, left: 120),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 350, left: 210),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 350, right: 210),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 425, left: 100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 425, right: 100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 500, right: 90),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 500, left: 90),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 575, left: 100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 575, right: 100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 700, right: 100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 700, left: 100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.radio_button_checked, color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
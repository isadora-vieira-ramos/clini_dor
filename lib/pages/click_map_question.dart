import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class ClickMapQuestion extends StatelessWidget {
  Question question;
  ClickMapQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(question.questionText, overflow: TextOverflow.fade),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: question.answers[0],
              ),
              Tab(
                text: question.answers[1],
              ),
              
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Frente"),
            ),
            Center(
              child: Text("Costas"),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandClickMapQuestion extends StatelessWidget {
  HandClickMapQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Dores na mão",
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            fontSize: 18    
          )
        ),
        ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.radio_button_checked, color: Colors.yellow.shade800),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Menor intensidade"),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.radio_button_checked, color: Colors.red),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Maior intensidade"),
                  )
                ],
              )
            ],
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Image.asset('lib/images/hand_outline.png', fit: BoxFit.fill),
                )
              ),
              StandardIconButton(position: "wrist", top: 250, left: 80, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "thumb", top: 170, left: 170, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "index_finger_matacarpophalangeal_joint", top: 120, left: 30, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "middle_finger_metacarpophalangeal_joint", top: 120, right: 40, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "ring_finger_metacarpophalangeal_joint", top: 135, right: 95, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "small_finger_metacarpophalangeal_joint", top: 170, right: 140, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "index_finger_proximal_interphalangeal_joint", top: 80, left: 30, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "middle_finger_proximal_interphalangeal_joint", top: 80, right: 55, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "ring_finger_proximal_interphalangeal_joint", top: 100, right: 130, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "small_finger_proximal_interphalangeal_joint", top: 155, right: 180, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "index_finger_distal_interphalangeal_joint", top: 50, left: 30, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "middle_finger_distal_interphalangeal_joint", top: 50, right: 70, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "ring_finger_distal_interphalangeal_joint", top: 75, right: 155, currentValue: 0, registerAnswer: (){}),
              StandardIconButton(position: "small_finger_distal_interphalangeal_joint", top: 135, right: 220, currentValue: 0, registerAnswer: (){}),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.tertiary
            )
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "OK",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}
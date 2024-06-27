import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandClickMapQuestion extends StatelessWidget {
  final Function getCurrentAnswer;
  final Function registerAnswer;
  HandClickMapQuestion({super.key, required this.getCurrentAnswer, required this.registerAnswer});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Dores na mão",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 20    
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.radio_button_checked, color: Colors.yellow.shade800),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Menor intensidade",
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.radio_button_checked, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Maior intensidade",
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Image.asset('lib/images/hand_outline.png', fit: BoxFit.fill),
                      )
                    ),
                    StandardIconButton(position: "wrist", top: 350, left: 120, currentValue: getCurrentAnswer("wrist"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "thumb_metacarpophalangeal_joint", top: 240, left: 240, currentValue: getCurrentAnswer("thumb_metacarpophalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "thumb_interphalangeal_joint", top: 200, left: 280, currentValue: getCurrentAnswer("thumb_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "index_finger_metacarpophalangeal_joint", top: 180, left: 40, currentValue: getCurrentAnswer("index_finger_metacarpophalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "index_finger_proximal_interphalangeal_joint", top: 115, left: 40, currentValue: getCurrentAnswer("index_finger_proximal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "index_finger_distal_interphalangeal_joint", top: 70, left: 40, currentValue: getCurrentAnswer("index_finger_distal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "middle_finger_metacarpophalangeal_joint", top: 190, right: 50, currentValue: getCurrentAnswer("middle_finger_metacarpophalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "middle_finger_proximal_interphalangeal_joint", top: 120, right: 80, currentValue: getCurrentAnswer("middle_finger_proximal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "middle_finger_distal_interphalangeal_joint", top: 70, right: 100, currentValue: getCurrentAnswer("middle_finger_distal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "ring_finger_metacarpophalangeal_joint", top: 210, right: 120, currentValue: getCurrentAnswer("ring_finger_metacarpophalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "ring_finger_proximal_interphalangeal_joint", top: 150, right: 175, currentValue: getCurrentAnswer("ring_finger_proximal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "ring_finger_distal_interphalangeal_joint", top: 115, right: 210, currentValue: getCurrentAnswer("ring_finger_distal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "small_finger_metacarpophalangeal_joint", top: 255, right: 175, currentValue: getCurrentAnswer("small_finger_metacarpophalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "small_finger_proximal_interphalangeal_joint", top: 225, right: 250, currentValue: getCurrentAnswer("small_finger_proximal_interphalangeal_joint"), registerAnswer: registerAnswer),
                    StandardIconButton(position: "small_finger_distal_interphalangeal_joint", top: 200, right: 300, currentValue: getCurrentAnswer("small_finger_distal_interphalangeal_joint"), registerAnswer: registerAnswer),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.tertiary
                ),
              ),
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text(
                "OK",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 18
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
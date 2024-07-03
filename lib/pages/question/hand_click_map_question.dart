import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandClickMapQuestion extends StatefulWidget {
  final Function getCurrentAnswer;
  final Function registerAnswer;
  const HandClickMapQuestion({super.key, required this.getCurrentAnswer, required this.registerAnswer});

  @override
  State<HandClickMapQuestion> createState() => _HandClickMapQuestionState();
}

class _HandClickMapQuestionState extends State<HandClickMapQuestion> {
  
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
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Dores na mãos",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 20    
                  )
                ),
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Marque os pontos onde de dor em qualquer uma das mãos",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18
                    )
                  ),
                ),
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
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('lib/images/hand_outline.png', fit: BoxFit.fill)
                    ),
                    StandardIconButton(position: "wrist_joint", top: 350, left: 120, currentValue: widget.getCurrentAnswer("wrist_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "thumb_metacarpophalangeal_joint", top: 240, left: 240, currentValue: widget.getCurrentAnswer("thumb_metacarpophalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "thumb_interphalangeal_joint", top: 200, left: 280, currentValue: widget.getCurrentAnswer("thumb_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "index_finger_metacarpophalangeal_joint", top: 180, left: 40, currentValue: widget.getCurrentAnswer("index_finger_metacarpophalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "index_finger_proximal_interphalangeal_joint", top: 115, left: 40, currentValue: widget.getCurrentAnswer("index_finger_proximal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "index_finger_distal_interphalangeal_joint", top: 70, left: 40, currentValue: widget.getCurrentAnswer("index_finger_distal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "middle_finger_metacarpophalangeal_joint", top: 190, right: 50, currentValue: widget.getCurrentAnswer("middle_finger_metacarpophalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "middle_finger_proximal_interphalangeal_joint", top: 120, right: 80, currentValue: widget.getCurrentAnswer("middle_finger_proximal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "middle_finger_distal_interphalangeal_joint", top: 70, right: 100, currentValue: widget.getCurrentAnswer("middle_finger_distal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "ring_finger_metacarpophalangeal_joint", top: 210, right: 120, currentValue: widget.getCurrentAnswer("ring_finger_metacarpophalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "ring_finger_proximal_interphalangeal_joint", top: 150, right: 175, currentValue: widget.getCurrentAnswer("ring_finger_proximal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "ring_finger_distal_interphalangeal_joint", top: 115, right: 210, currentValue: widget.getCurrentAnswer("ring_finger_distal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "small_finger_metacarpophalangeal_joint", top: 255, right: 175, currentValue: widget.getCurrentAnswer("small_finger_metacarpophalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "small_finger_proximal_interphalangeal_joint", top: 225, right: 250, currentValue: widget.getCurrentAnswer("small_finger_proximal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                    StandardIconButton(position: "small_finger_distal_interphalangeal_joint", top: 200, right: 300, currentValue: widget.getCurrentAnswer("small_finger_distal_interphalangeal_joint"), registerAnswer: widget.registerAnswer),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
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
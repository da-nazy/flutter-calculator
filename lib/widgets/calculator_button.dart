import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int? textColor;
  final double? textSize;
  final Function? callback;

  const CalculatorButton({
  required this.text,
  this.fillColor,
  this.textColor,
  this.textSize,
  this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10.0),
      child:SizedBox(
          width: 70,
          height: 70,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(
                       Color(fillColor!)),
                textStyle: MaterialStateProperty.all<TextStyle?>(
                    GoogleFonts.rubik(
                        fontSize:textSize, 
                        color:Color(textColor!)
                        )
                        ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ))),
            onPressed: () => {
              callback!(text)
            },
            child: Text(text),
          )),
    );
  }
}

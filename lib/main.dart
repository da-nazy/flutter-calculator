import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CalculatorAppState());
}

class CalculatorAppState extends StatefulWidget {
  const CalculatorAppState({super.key});

  @override
  State<CalculatorAppState> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorAppState> {
  int? firstNum;
  int? secondNum;
  String? history = '';
  String? textToDisplay = '';
  String? res = '';
  String? operation;

  void btnOnClick(String btnval) {
    print(btnval);
    if (btnval == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnval == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnval == '+/-') {
      if (textToDisplay![0] != '-') {
        res = '-' + textToDisplay!;
      } else {
        // having negative value
        res = textToDisplay!.substring(1);
      }
    } else if (btnval == '<') {
      // removing last character of this string
      res = textToDisplay!.substring(0, textToDisplay!.length - 1);

    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == 'X' ||
        btnval == '/') {
      firstNum = int.parse(textToDisplay!);
      res = '';
      operation = btnval;
    } else if (btnval == '=') {
      secondNum = int.parse(textToDisplay!);
      if (operation == '+') {
        res = (firstNum! + secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum! - secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum! * secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum! / secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay! + btnval).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Calculator"),
        ),
        backgroundColor: const Color(0xFF28527a),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history!,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color(0x66FFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    textToDisplay!,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: "AC",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "C",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "<",
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "/",
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: "9",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "8",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "7",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "X",
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: "6",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "5",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "4",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "-",
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: "3",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "2",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "1",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "+",
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: "+/-",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "0",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "00",
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: "=",
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 22,
                    callback: btnOnClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

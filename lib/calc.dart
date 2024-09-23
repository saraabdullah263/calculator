import 'package:calc_app/widget/custom_botton.dart';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  static const String routName = 'calc';
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String input = '';
  String result = '';
  String operator = '';
  String finalResult = '';
  String ans = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    input,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  result,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  finalResult,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBotton(
                  title: 'C',
                  onPressed: () {
                    setState(() {
                      input = '';
                      finalResult = '';
                      result = '';
                    });
                  },
                ),
                CustomBotton(
                    title: 'Del',
                    onPressed: () {
                      setState(() {
                        if (input.isNotEmpty) {
                          input = input.substring(0, input.length - 1);
                        }
                      });
                    }),
                CustomBotton(
                    title: 'Ans',
                    onPressed: () {
                      setState(() {
                        ans = finalResult;
                        input = ans;
                        finalResult = '';
                      });
                    }),
                CustomBotton(title: '+', onPressed: () => OnOperatorClic('+')),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBotton(title: '1', onPressed: () => OnDigitClic('1')),
                CustomBotton(title: '2', onPressed: () => OnDigitClic('2')),
                CustomBotton(title: '3', onPressed: () => OnDigitClic('3')),
                CustomBotton(title: '-', onPressed: () => OnOperatorClic('-')),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBotton(title: '4', onPressed: () => OnDigitClic('4')),
                CustomBotton(title: '5', onPressed: () => OnDigitClic('5')),
                CustomBotton(title: '6', onPressed: () => OnDigitClic('6')),
                CustomBotton(title: '*', onPressed: () => OnOperatorClic('*')),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBotton(title: '7', onPressed: () => OnDigitClic('7')),
                CustomBotton(title: '8', onPressed: () => OnDigitClic('8')),
                CustomBotton(title: '9', onPressed: () => OnDigitClic('9')),
                CustomBotton(title: '/', onPressed: () => OnOperatorClic('/')),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBotton(title: '00', onPressed: () => OnDigitClic('00')),
                CustomBotton(title: '0', onPressed: () => OnDigitClic('0')),
                CustomBotton(title: '.', onPressed: () => OnDigitClic('.')),
                CustomBotton(
                    title: '=',
                    onPressed: () {
                      setState(() {
                        Calculate();
                        finalResult = result;
                        input = '';
                        result = '';
                        operator = '';
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  OnDigitClic(String digit) {
    input += digit;
    setState(() {});
  }

  OnOperatorClic(String _operator) {
    if (result == '') {
      setState(() {
        result = input;
        input = '';
        operator = _operator;
      });
    } else {
      setState(() {
        Calculate();
        operator = _operator;
        input = '';
      });
    }
  }

  void Calculate() {
    switch (operator) {
      case '+':
        result = (double.parse(result) + double.parse(input)).toString();
        break;
      case '-':
        result = (double.parse(result) - double.parse(input)).toString();
        break;
      case '*':
        result = (double.parse(result) * double.parse(input)).toString();
        break;
      case '/':
        result = (double.parse(result) / double.parse(input)).toString();
        break;
    }
  }
}

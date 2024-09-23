import 'package:calc_app/calc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
         Calc.routName:(context)=> Calc(),
      },
      initialRoute: Calc.routName,
      debugShowCheckedModeBanner: false,
    );
  }

  
  }


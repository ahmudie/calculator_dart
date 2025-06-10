import 'package:flutter/material.dart';
import 'package:state_management/CalculatorView.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const CalculatorView(),
    );
  }
}
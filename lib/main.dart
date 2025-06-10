import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/CalculatorView.dart';
import 'CalculatorProvider.dart';
import 'CalculatorView.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
        create: (_) => CalculatorProvider(),
        child: const MyApp(),
    )
  );

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
      home:  CalculatorView(),
    );
  }
}
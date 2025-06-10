import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management/calcButton.dart';
import 'package:provider/provider.dart';
import 'CalculatorProvider.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({Key? key}) : super(key: key);
  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}
class _CalculatorViewState extends State<CalculatorView> {
  Widget build(BuildContext context){

    return ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black54,
          leading: const Icon(Icons.settings, color: Colors.orange,),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top:18.0),
              child: Text('DEG', style: TextStyle(color: Colors.white38)),


            ),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Consumer<CalculatorProvider>(
                      builder: (context, calculator, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(calculator.result,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize:80))),
                              const Icon(Icons.more_vert,
                                  color: Colors.orange, size: 30),
                              const SizedBox(width: 20),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(calculator.equation,
                                    style: const TextStyle(
                                      fontSize: 40,
                                      color: Colors.white38,
                                    )),
                              ),
                              IconButton(
                                icon: const Icon(Icons.backspace_outlined,
                                    color: Colors.orange, size: 30),
                                onPressed: () {
                                  buttonPressed("⌫");
                                },
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalcButtonFactory.create(text: 'AC', color: Colors.white24, onPressed: () => buttonPressed('AC')),
                              CalcButtonFactory.create(text: '%', color: Colors.white24, onPressed: () => buttonPressed('%')),
                              CalcButtonFactory.create(text: '÷', color: Colors.white24, onPressed: () => buttonPressed('÷')),
                              CalcButtonFactory.create(text: 'x', color: Colors.white24, onPressed: () => buttonPressed('x')),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalcButtonFactory.create(text: '7', color: Colors.white10, onPressed: () => buttonPressed('7')),
                              CalcButtonFactory.create(text: '8', color: Colors.white10, onPressed: () => buttonPressed('8')),
                              CalcButtonFactory.create(text: '9', color: Colors.white10, onPressed: () => buttonPressed('9')),
                              CalcButtonFactory.create(text: '-', color: Colors.white24, onPressed: () => buttonPressed('-')),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalcButtonFactory.create(text: '4', color: Colors.white10, onPressed: () => buttonPressed('4')),
                              CalcButtonFactory.create(text: '5', color: Colors.white10, onPressed: () => buttonPressed('5')),
                              CalcButtonFactory.create(text: '6', color: Colors.white10, onPressed: () => buttonPressed('6')),
                              CalcButtonFactory.create(text: '+', color: Colors.white24, onPressed: () => buttonPressed('+')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // calculator number buttons

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround
                                children: [
                                  Row(
                                    children: [
                                      CalcButtonFactory.create(text: '1', color: Colors.white10, onPressed: () => buttonPressed('1')),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.025),
                                      CalcButtonFactory.create(text: '2', color: Colors.white10, onPressed: () => buttonPressed('2')),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.025),
                                      CalcButtonFactory.create(text: '3', color: Colors.white10, onPressed: () => buttonPressed('3')),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CalcButtonFactory.create(text: '+/-', color: Colors.white10, onPressed: () => buttonPressed('+/-')),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.025),
                                      CalcButtonFactory.create(text: '0', color: Colors.white10, onPressed: () => buttonPressed('0')),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.025),
                                      CalcButtonFactory.create(text: '.', color: Colors.white10, onPressed: () => buttonPressed('.')),
                                    ],
                                  ),
                                ],
                              ),
                              CalcButtonFactory.create(text: '=', color: Colors.orange, onPressed: () => buttonPressed('=')),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ],
            )
        )
      ),
    );
  }

  void buttonPressed(String value) {
    final calculator = Provider.of<CalculatorProvider>(context, listen: false);
    calculator.handleInput(value);
  }
}

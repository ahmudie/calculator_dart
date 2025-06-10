import 'package:flutter/material.dart';

Widget calcButton(
    String buttonText, Color buttonColor, void Function()? buttonPressed) {
  return Container(
    width: 100,
    height: buttonText == '=' ? 180 : 90,
    padding: const EdgeInsets.all(6),
    child: ElevatedButton(
      onPressed: buttonPressed,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(20))),
          backgroundColor: buttonColor),
      child: Text(buttonText,
        style: const TextStyle(fontSize: 27, color: Colors.white),
      ),
    ),
  );
}

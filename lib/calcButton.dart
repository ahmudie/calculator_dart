import 'package:flutter/material.dart';

class CalcButtonFactory {
  static Widget create({
    required String text,
    required Color color,
    required VoidCallback onPressed,
}){
    return Container(
      width: 100,
      height: text == '=' ? 180 : 90,
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            backgroundColor: color,
          ),
        child: Text(
          text, style: const TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
    );
  }
}

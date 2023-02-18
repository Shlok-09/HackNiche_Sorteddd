import 'package:flutter/material.dart';

Widget Outcome(){
  return Stack(
    children: [
      Image.asset('assets/Rectangle 63.png',scale: 0.65,),
      Padding(
        padding: const EdgeInsets.all(27.0),
        child: Image.asset('assets/Arrow 15.png'),
      ),

    ],
  );
}

Widget IncomeCard(){
  return Stack(
    children: [
      Image.asset('assets/Rectangle_blue.png',scale: 0.65,),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Image.asset('assets/Arrow.png',),
      ),

    ],
  );
}
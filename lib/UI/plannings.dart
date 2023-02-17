import 'package:flutter/material.dart';

class MyPlannings extends StatefulWidget {
  const MyPlannings({Key? key}) : super(key: key);

  @override
  State<MyPlannings> createState() => _MyPlanningsState();
}

class _MyPlanningsState extends State<MyPlannings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Text("MY PLANNINGS"),
    );
  }
}

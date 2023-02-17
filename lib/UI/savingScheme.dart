import 'package:flutter/material.dart';

class SavingScheme extends StatefulWidget {
  const SavingScheme({Key? key}) : super(key: key);

  @override
  State<SavingScheme> createState() => _SavingSchemeState();
}

class _SavingSchemeState extends State<SavingScheme> {
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

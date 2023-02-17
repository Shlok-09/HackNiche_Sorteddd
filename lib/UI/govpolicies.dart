import 'package:flutter/material.dart';

class GovPolicies extends StatefulWidget {
  const GovPolicies({Key? key}) : super(key: key);

  @override
  State<GovPolicies> createState() => _GovPoliciesState();
}

class _GovPoliciesState extends State<GovPolicies> {
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hackniche_finance/UI/wrapper.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141332),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(10, 250, 10, 10),
              child: Image.asset('assets/logo.png')
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Start your empowering journey with us in a few steps',
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.white
              ),),
            ),
            SizedBox(height:50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                  Get.to(Wrapper());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xff6359E9))),
                child: const Text("Get Started"),
              )
            ),
          ],
        )
      ),
    );
  }
}



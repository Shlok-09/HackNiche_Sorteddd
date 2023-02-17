import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/login.dart';
import 'package:hackniche_finance/UI/wrapper.dart';
import 'package:hackniche_finance/auth/auth.dart';
import 'package:get/get.dart';

import 'getStarted.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      appBar: AppBar(
        leading: IconButton(
        onPressed: ()=>Get.to(GetStarted()),
        icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text('SignIn'),
        backgroundColor: Colors.transparent,elevation: 0,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Hero(
                createRectTween: (Rect? begin, Rect? end) {
                  return MaterialRectCenterArcTween(begin: begin, end: end);
                },
                tag: 'logo',
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                    child: Image.asset('assets/logo.png',scale: 0.5,)
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff1d1d40),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(color: Colors.white),
                  decoration: InputDecoration(hintText: 'Enter Email',hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),),
                  validator: (val) => val!.isEmpty? 'Enter an Email' : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff1d1d40),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(color: Colors.white),
                  decoration: InputDecoration(hintText: 'Enter Password',hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),),
                  obscureText: true,
                  validator: (val) => val!.length<6? 'Password minimum 6 chars' : null,
                  onChanged: (val){
                    setState(() {
                      pass = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff1d1d40),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(color: Colors.white),
                  decoration: InputDecoration(hintText: 'Re-enter Password',hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),),
                  obscureText: true,
                  validator: (val) => val!=pass? 'Passwords don\'t match' : null,
                  onChanged: (val){},
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff03c9d7)),),
                  onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      final result = _auth.signUpEmailPassword(email, pass);
                      Get.to(Wrapper());
                      print(result);
                    }
                    else{}
                  },
                  child: Text("Submit",style: GoogleFonts.poppins(fontSize: 24,color: Colors.white),)
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Or Using Google: ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                  const SizedBox(width: 5,),
                  Container(
                    width: 70,
                    height: 55,
                    padding: const EdgeInsets.fromLTRB(1,0,1,1),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(onPressed: (){
                      final result = _auth.handleSignIn();
                      print(result);
                    }, icon: const Icon(Icons.g_mobiledata,size: 40,color: Colors.white,)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(onPressed: (){Get.to(LoginPage());}, child: Text("Or Log-in",style: GoogleFonts.poppins(fontSize: 20),)),
            ],
          ),
        ),
      ),
    );
  }
}

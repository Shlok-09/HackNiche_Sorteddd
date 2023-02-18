import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/plannings.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({Key? key}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  final _formKey = GlobalKey<FormState>();
  String plan = "";
  String totalAmount = "";
  String progress = "";
  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  late User? mFirebaseUser = FirebaseAuth.instance.currentUser ;
  late int planlen;

  void fetch() async{
    dynamic result = (await _databaseReference.child(mFirebaseUser!.uid).child('plans').once()).snapshot.value;
    print("result : ${result.length}");
    planlen = result.length;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      appBar: AppBar(
        title: Text("Add Plan"),
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Get.to(MyPlannings()),icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff1d1d40),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(color: Colors.white),
                  decoration: InputDecoration(hintText: 'Enter Plan',hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),),
                  onChanged: (val){
                    plan = val;
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
                  decoration: InputDecoration(labelText: '₹',labelStyle: TextStyle(color: Colors.white),hintText: 'Enter Total Amount',hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),),
                  onChanged: (val){
                    totalAmount = val;
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
                  decoration: InputDecoration(labelText: '%',labelStyle: TextStyle(color: Colors.white),hintText: 'Enter Progress',hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),),
                  onChanged: (val){
                    progress = val;
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff03c9d7)),),
                  onPressed: ()async{
                    dynamic objRes = {
                      'name': plan,
                      'totalAmount': totalAmount,
                      'progress':progress
                    };
                    await _databaseReference.child(mFirebaseUser!.uid).child('plans').child(planlen.toString()).set(objRes);
                    Get.to(MyPlannings());
                  },
                  child: Text("Add Plan",style: GoogleFonts.poppins(fontSize: 24,color: Colors.white),)
              ),
            ]
          ),
        ),
      ),
    );
  }
}

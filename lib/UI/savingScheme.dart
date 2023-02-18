import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavingScheme extends StatefulWidget {
  const SavingScheme({Key? key}) : super(key: key);

  @override
  State<SavingScheme> createState() => _SavingSchemeState();
}

class _SavingSchemeState extends State<SavingScheme> {
  final _databaseRef = FirebaseDatabase.instance.ref();
  final User? mFirebaseUser = FirebaseAuth.instance.currentUser;
  bool dataPresent = false;

  void fetch() async{
    dynamic result = (await _databaseRef.child(mFirebaseUser!.uid).child('userData').once()).snapshot.value;
    if(result.length>0)
      {
        setState(() {
          dataPresent = true;
        });
      }
  }
  final _key = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _eduController = TextEditingController();
  final TextEditingController _profController = TextEditingController();
  final TextEditingController _marController = TextEditingController();
  final TextEditingController _childController = TextEditingController();
  final TextEditingController _nocController = TextEditingController();
  final TextEditingController _incController = TextEditingController();

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: !dataPresent? SingleChildScrollView(
        child: Container(
          height: 850,
          padding: EdgeInsets.all(15),
          child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _ageController,
                      decoration: InputDecoration(
                        hintText: 'Enter Age',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _genderController,
                      decoration: InputDecoration(
                        hintText: 'Enter Gender',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      onChanged: (val){},
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _eduController,
                      decoration: InputDecoration(
                        hintText: 'Enter Education',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _profController,
                      decoration: InputDecoration(
                        hintText: 'Enter Profession',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _marController,
                      decoration: InputDecoration(
                        hintText: 'Enter Marital Status',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _childController,
                      decoration: InputDecoration(
                        hintText: 'Children Y/N',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _nocController,
                      decoration: InputDecoration(
                        hintText: 'Enter No. of Children',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1d1d40),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                      controller: _incController,
                      decoration: InputDecoration(
                        hintText: 'Enter Income',
                        hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff03c9d7))
                      ),
                      onPressed: () async {
                        //TODO: Add to firebase
                        dynamic objRes = {
                          'Age': _ageController.text.toString(),
                          'Gender' : _genderController.text.toString(),
                          'Education': _eduController.text.toString(),
                          'Profession': _profController.text.toString(),
                          'Marital Status': _marController.text.toString(),
                          'Children': _childController.text.toString(),
                          'Number of Children': _nocController.text.toString(),
                          'Income': _incController.text.toString()
                        };
                        await _databaseRef.child(mFirebaseUser!.uid).child('userData').set(objRes);
                        setState(() {
                          dataPresent = true;
                        });
                      },
                      child: Text('Add Data',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white)
                        ,))
                ],
              )),
        ),
      ):Container(),
    );
  }
}



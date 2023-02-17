import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hackniche_finance/UI/income.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({Key? key}) : super(key: key);

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  var translen;
  late User? mFirebaseUser ;
  var cost ;

  void fetch() async{
    dynamic result = (await _databaseReference.child(mFirebaseUser!.uid).child('transactions').once()).snapshot.value;
    print("result : ${result.length}");
    translen = result.length;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mFirebaseUser = FirebaseAuth.instance.currentUser;
    fetch();
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.to(Income()),
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter transaction title',
                      hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff1d1d40),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: 'Enter date(1 Jan 2022)',
                      hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff1d1d40),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      cost = val;
                      print("cost $cost");
                    },
                    style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                    controller: _costController,
                    decoration: InputDecoration(
                      hintText: 'Enter transaction cost',
                      hintStyle: GoogleFonts.poppins(fontSize: 24,color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff1d1d40),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,),
                    controller: _typeController,
                    decoration: InputDecoration(
                      hintText: 'Enter type(expense/income)',
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
                        'cost': _costController.text.toString(),
                        'date' : _dateController.text.toString(),
                        'title': _titleController.text.toString(),
                        'type': _typeController.text.toString()
                      };
                      await _databaseReference.child(mFirebaseUser!.uid).child('transactions').child(translen.toString()).set(objRes);
                      dynamic test1 = (await _databaseReference.child(mFirebaseUser!.uid).child('income').once()).snapshot.value;
                      dynamic test2 = (await _databaseReference.child(mFirebaseUser!.uid).child('totalExpense').once()).snapshot.value;
                      int result;
                      if(_typeController.text == 'expense'){
                        result = test2.toInt() + int.parse(cost);
                        await _databaseReference.child(mFirebaseUser!.uid).child('totalExpense').set(result);
                      } else{
                        result = test1.toInt() + int.parse(cost);
                        await _databaseReference.child(mFirebaseUser!.uid).child('income').set(result);
                      }
                      await _databaseReference.child(mFirebaseUser!.uid).child('transactions').child(translen.toString()).set(objRes);
                    Get.to(const Income());
                    },
                    child: Text('Add Transaction',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white)
                  ,))
              ],
            )),
      ),
    );
  }
}

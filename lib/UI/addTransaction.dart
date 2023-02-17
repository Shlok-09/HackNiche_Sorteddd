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

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      appBar: AppBar(
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
                    backgroundColor: MaterialStateProperty.all(Color(0xff6359E9))
                  ),
                    onPressed: (){
                    //TODO: Add to firebase
                    Get.to(const Income());
                    },
                    child: Text('Submit',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white)
                  ,))
              ],
            )),
      ),
    );
  }
}

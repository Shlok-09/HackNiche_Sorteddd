import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/addTransaction.dart';
import 'package:hackniche_finance/UI/bottomBar.dart';
import '../constants/constants.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class Income extends StatefulWidget {
  const Income({Key? key}) : super(key: key);

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  late User? mFirebaseUser;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
  late var transaction;
  late String income,expense;
  bool isLoading = true;

  Future fetch() async{
    dynamic result = (await databaseRef.child(mFirebaseUser!.uid).child('transactions').once()).snapshot.value;
    print(result![1]);
    income = (await databaseRef.child(mFirebaseUser!.uid).child('income').once()).snapshot.value.toString();
    expense = (await databaseRef.child(mFirebaseUser!.uid).child('totalExpense').once()).snapshot.value.toString();
    setState(() {
      isLoading = false;
    });
    print(income);
    return result;
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mFirebaseUser = FirebaseAuth.instance.currentUser;
    fetch();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141332),
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.to(BottomBarStart()),
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        title: Text('Logs'),
        elevation: 0,
      ),
      body: !isLoading? Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff1D1D40),
              ),
              height:150,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IncomeCard(),
                  // const SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height:20),
                      Text("Total Income",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 25)),
                      Text("₹$income",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
                    ],
                  ),
                  // const SizedBox(width: 25),
                  Stack(
                    children: [
                      Image.asset('assets/Rectangle 34.png',scale: 0.9,),
                      const Padding(padding: EdgeInsets.fromLTRB(10, 4, 0, 0),child: Text('+1.29%',style: TextStyle(
                        color: Colors.green,
                      ),),)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            //OUTCOME
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff1D1D40),
              ),
              height:150,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Outcome(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height:20),
                      Text("Total Expense",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 25)),
                      Text("-₹$expense",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/Rectangle 35.png',scale: 0.9,),
                      const Padding(padding: EdgeInsets.fromLTRB(10, 3, 0, 0),child: Text('+1.29%',style: TextStyle(
                        color: Colors.redAccent,
                      ),),)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Text("Transactions",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white),),
            const SizedBox(height: 10),
            Stack(
              children: [
                SizedBox(
                  height: 385,
                  child: FutureBuilder(
                    future: fetch(),
                      builder: (context,snapshot){
                      return snapshot.hasData? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff1D1D40),
                                      ),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            !(snapshot.data[index]['type']== 'expense') ? IncomeCard() : Outcome(),
                                            const SizedBox(width: 12,),
                                            Container(
                                              width: 215,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('${snapshot.data[index]['title']}',style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                                                  Text('${snapshot.data[index]['date']}',style: GoogleFonts.poppins(fontSize: 15,color: const Color(0xff8C89B4)),)
                                                ],
                                              ),
                                            ),
                                            Text('₹${snapshot.data[index]['cost']}',style: GoogleFonts.poppins(fontSize: 20,color: !(snapshot.data[index]['type']== 'expense') ?Colors.green:Colors.redAccent),)
                                          ]
                                      ),
                                    ),
                                    const SizedBox(height: 15,)
                                  ],
                                );
                              }
                          ): Container();
                      }
                  ),
                ),
                Positioned(
                    bottom: 30,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff6359E9),
                      minRadius: 25,
                      child: Center(child: IconButton(icon: const Icon(Icons.add,color: Colors.white,),onPressed: (){Get.to(const AddTransactions());},)),
                    )
                )
              ],
            ),

          ],
        ),
      ): const Center(child: CircularProgressIndicator()),
    );
  }
}

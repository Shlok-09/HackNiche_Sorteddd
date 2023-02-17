import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/addTransaction.dart';
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
  late DatabaseReference databaseRef;
  List transactions = [
    {'item': 'Nike Air Max 2090','date':'15 Aug 2022','cost':'\$243.00','type':'expense'},
    {'item': 'Salary','date':'15 Aug 2022','cost':'\$243.00','type':'income'},
    {'item': 'Nike Air Max 2090','date':'15 Aug 2022','cost':'\$243.00','type':'expense'},
    {'item': 'Salary','date':'15 Aug 2022','cost':'\$243.00','type':'income'},
    {'item': 'Salary','date':'15 Aug 2022','cost':'\$243.00','type':'income'},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mFirebaseUser = FirebaseAuth.instance.currentUser;
    databaseRef = FirebaseDatabase.instance.ref().child(mFirebaseUser!.uid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141332),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
                      Text("\$632.000",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
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
            SizedBox(height: 15,),
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
                      Text("Total Outcome",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 25)),
                      Text("-\$632.000",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
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
            SizedBox(height: 15,),
            Text("Transactions",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white),),
            SizedBox(height: 10),
            // FutureBuilder(
            //   future: transactions,
            //     builder: (context,snapshot){
            //       return Container();
            //     }
            // )
            Stack(
              children: [
                SizedBox(
                  height: 385,
                  child: ListView.builder(
                    itemCount: transactions.length,
                      itemBuilder: (context,index){
                      return Column(
                        children: [
                          Container(
                            height: 80,
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff1D1D40),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (transactions[index]['type']== 'expense') ? IncomeCard() : Outcome(),
                                SizedBox(width: 12,),
                                Container(
                                  width: 215,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${transactions[index]['item']}',style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                                      Text('${transactions[index]['date']}',style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff8C89B4)),)
                                    ],
                                  ),
                                ),
                                Text('${transactions[index]['cost']}',style: GoogleFonts.poppins(fontSize: 20,color: (transactions[index]['type']== 'expense') ?Colors.green:Colors.redAccent),)
                              ]
                            ),
                          ),
                          const SizedBox(height: 15,)
                        ],
                      );
                      }
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    minRadius: 25,
                    child: Center(child: IconButton(icon: Icon(Icons.add,color: Colors.white,),onPressed: (){Get.to(AddTransactions());},)),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

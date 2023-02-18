import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/govpolicies.dart';
import 'package:hackniche_finance/UI/income.dart';
import 'package:get/get.dart';
import 'package:d_chart/d_chart.dart';
import 'package:hackniche_finance/UI/plannings.dart';
import 'package:hackniche_finance/UI/savingScheme.dart';
import 'package:hackniche_finance/UI/stock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? mFirebaseUser;
  late String name = 'Ayush';
  late DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  CustomClipper<Rect>? clipper;
  late int balance;
  bool isLoading = false;
  late var food,extra,cloth;
  late int income,expense;

  Future<void> fetch() async{
    isLoading = true;
    // balance = (await _databaseReference.child(mFirebaseUser!.uid).child('balance').once()).snapshot.value.toString();
    try {
      food =
      (await _databaseReference.child(mFirebaseUser!.uid).child('expense')
          .child('food')
          .once()).snapshot.value as int;
      extra =
      (await _databaseReference.child(mFirebaseUser!.uid).child('expense')
          .child('extra')
          .once()).snapshot.value as int;
      cloth =
      (await _databaseReference.child(mFirebaseUser!.uid).child('expense')
          .child('clothing')
          .once()).snapshot.value as int;
      income = (await _databaseReference.child(mFirebaseUser!.uid)
          .child('income')
          .once()).snapshot.value as int;
      expense = (await _databaseReference.child(mFirebaseUser!.uid)
          .child('totalExpense')
          .once()).snapshot.value as int;
      balance = income - expense;
    } catch(e){
      print(e);
      food = 38;
      extra = 25;
      cloth = 18;
      income = 10000;
      expense = 5000;
      balance = income - expense;
    }
    setState(() {
      isLoading = false;
    });
    print("balance: ${balance.toString()}");
  }
  @override
  void initState() {
    super.initState();
    mFirebaseUser = FirebaseAuth.instance.currentUser;
    fetch();
  }
  @override
  Widget build(BuildContext context) {
    return !isLoading? Container(
      padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    const Text('Welcome Back,',style: TextStyle(fontSize: 19,color: Color(0xffA6A6A6)),),
                    const SizedBox(height:5),
                    Text('$name 👋',style: const TextStyle(fontSize: 24,color: Colors.white),)
                  ],
                ),
                CircleAvatar(
                  minRadius: 20,
                  child: Image.asset('assets/Mask group.png')
                )
                // Image.asset('assets/homephotos.png')
                // Image.asset('assets/')
              ],
            ),
            const SizedBox(height: 13,),
            GestureDetector(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Income()));
                Get.to(const Income());
              },
              child: Container(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("My Balance",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 25)),
                          Text("\₹${balance.toString()}",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
                          Stack(
                            children: [
                              Image.asset('assets/Rectangle 34.png',scale: 0.9,),
                              const Padding(padding: EdgeInsets.fromLTRB(10, 3, 0, 0),child: Text('+1.29%',style: TextStyle(
                                color: Colors.green,
                              ),),)
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Stack(
                        children: [
                          Image.asset('assets/Rectangle_blue.png',scale: 0.65,),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Image.asset('assets/Arrow.png'),
                          ),

                        ],
                      ),
                    ),
                    // const SizedBox(width: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff1D1D41),
              ),
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:30,bottom: 10),
                    child: Text('My Expenses',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white),),
                  ),
                  AspectRatio(
                    aspectRatio: 20 / 9,
                    child: DChartPie(
                      data: [
                        {'domain': 'Food', 'measure': food},
                        {'domain': 'Clothing', 'measure': cloth},
                        {'domain': 'Extra', 'measure': extra},
                      ],
                      donutWidth: 18,
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'Food':
                            return const Color(0xff64CFF6);
                          case 'Clothing':
                            return const Color(0xff6359E9);
                          default:
                            return Colors.purple.shade900;
                        }
                      },
                      pieLabel: (pieData, index) {
                        return "${pieData['domain']}-${pieData['measure']}%";
                      },
                      labelPosition: PieLabelPosition.outside,
                      labelColor: Colors.white60,
                      labelFontSize: 16,
                      labelLineColor: Colors.red,
                      strokeWidth: 2,
                      animate: true,
                      labelLineThickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(const MyPlannings());
                    },
                      child: homeCard(AssetImage('assets/Vector_save.png'),"My Plannings",Colors.lightBlueAccent)),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(Stock());
                    },
                      child: homeCard(AssetImage('assets/Vector.png'),"Stock",Colors.lightGreenAccent)),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: GestureDetector(
                    onTap: ()=>Get.to(GovPolicies()),
                      child: homeCard(AssetImage('assets/image 2.png'),"Government \nPolicies",Colors.lightBlueAccent)),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: ()=>Get.to(SavingScheme()),
                      child: homeCard(AssetImage('assets/image 3.png',),"Saving \nStrategies",Colors.lightGreenAccent)),
                )
              ],
            )
          ],
        )
    ): const Center(child: CircularProgressIndicator());
  }

  Widget homeCard(var icon,String text, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff1D1D40)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(height: 130,width: 5,color: color,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageIcon(icon,color: color),
                      Text(text,style: GoogleFonts.poppins(fontSize: 24,color: Colors.white),),
                    ],
                  ),
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}

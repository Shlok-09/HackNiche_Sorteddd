import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/income.dart';
import 'package:get/get.dart';
import 'package:d_chart/d_chart.dart';
import 'package:hackniche_finance/UI/plannings.dart';
import 'package:hackniche_finance/UI/stock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? mFirebaseUser;
  late String name = 'Ayush';
  CustomClipper<Rect>? clipper;

  @override
  void initState() {
    super.initState();
    mFirebaseUser = FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    const Text('Welcome Back,',style: TextStyle(fontSize: 19,color: Color(0xffA6A6A6)),),
                    const SizedBox(height:5),
                    Text('$name 👋',style: const TextStyle(fontSize: 24,color: Colors.white),)
                  ],
                ),
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
                          Text("\$632.000",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
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
                          Image.asset('assets/Rectangle.png',scale: 0.65,),
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
            //OUTCOME
            // Container(
            //   padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: const Color(0xff1D1D40),
            //   ),
            //   height:150,
            //   width: double.infinity,
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Stack(
            //         children: [
            //           Image.asset('assets/Rectangle.png',scale: 0.65,),
            //           Padding(
            //             padding: const EdgeInsets.all(25.0),
            //             child: Image.asset('assets/Arrow.png'),
            //           ),
            //
            //         ],
            //       ),
            //       const SizedBox(width: 15,),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Container(height:20),
            //           Text("Total Outcome",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 25)),
            //           Text("-\$632.000",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
            //         ],
            //       ),
            //       const SizedBox(width: 15),
            //       Stack(
            //         children: [
            //           Image.asset('assets/Rectangle 35.png',scale: 0.9,),
            //           const Padding(padding: EdgeInsets.fromLTRB(10, 3, 0, 0),child: Text('+1.29%',style: TextStyle(
            //             color: Colors.redAccent,
            //           ),),)
            //         ],
            //       )
            //     ],
            //   ),
            // )
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
                        {'domain': 'Food', 'measure': 38},
                        {'domain': 'Clothing', 'measure': 37},
                        {'domain': 'Extra', 'measure': 25},
                        // {'domain': 'Cordova', 'measure': 15},
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
                      child: homeCard(Icons.ac_unit,"My Plannings",Colors.lightBlueAccent)),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(Stock());
                    },
                      child: homeCard(Icons.abc,"Stock",Colors.lightGreenAccent)),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: homeCard(Icons.ac_unit,"Government \nPolicies",Colors.lightBlueAccent),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 1,
                  child: homeCard(Icons.abc,"Saving \nStrategies",Colors.lightGreenAccent),
                )
              ],
            )
          ],
        )
    );
  }

  Widget homeCard(IconData icon,String text, Color color) {
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
                      Icon(icon,color: color,),
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

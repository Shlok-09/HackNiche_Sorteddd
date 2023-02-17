import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/income.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? mFirebaseUser;
  late String name = 'Ayush';

  @override
  void initState() {
    // TODO: implement initState
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
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Income()));
                Get.to(Income());
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
            const SizedBox(height: 20),
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

          ],
        )
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hackniche_finance/UI/addPlan.dart';
import 'package:hackniche_finance/UI/bottomBar.dart';

class MyPlannings extends StatefulWidget {
  const MyPlannings({Key? key}) : super(key: key);

  @override
  State<MyPlannings> createState() => _MyPlanningsState();
}

class _MyPlanningsState extends State<MyPlannings> {
  // void fetch() async{
  //   // var url =
  //   // Uri.http('10.0.2.2:5000', '/api/predictloan');
  //   // // [
  //   // //   {
  //   // //     "Age":27,
  //   // //     "Gender": "M",
  //   // //     "Education": "UG",
  //   // //     "Profession": "Employee",
  //   // //     "Maritial Status": "Married",
  //   // //     "Children": "No",
  //   // //     "Number Of Children": 0,
  //   // //     "Income": 50000
  //   // //   }
  //   // // ]
  //   // // Await the http get response, then decode the json-formatted response.
  //   // try {
  //   //   var response = await http.post(
  //   //       url,
  //   //       body: {
  //   //         "Age": "27",
  //   //         "Gender": "M",
  //   //         "Education": "UG",
  //   //         "Profession": "Employee",
  //   //         "Maritial Status": "Married",
  //   //         "Children": "No",
  //   //         "Number Of Children": "0",
  //   //         "Income": "50000"
  //   //       }
  //   //   );
  //   //   if (response.statusCode == 200) {
  //   //     print(response.body);
  //   //     var jsonResponse =
  //   //     convert.jsonDecode(response.body) as Map<String, dynamic>;
  //   //     var itemCount = jsonResponse['totalItems'];
  //   //     print('Number of books about http: $itemCount.');
  //   //   } else {
  //   //     print('Request failed with status: ${response.statusCode}.');
  //   //   }
  //   // } catch (e){
  //   //   print(e);
  //   // }
  //   var client = http.Client();
  //   try {
  //     var response = await client.post(
  //         Uri.http('127.0.0.1:5000', '/api/predictloan'),
  //         body: {
  //           "Age": "27",
  //           "Gender": "M",
  //           "Education": "UG",
  //           "Profession": "Employee",
  //           "Maritial Status": "Married",
  //           "Children": "No",
  //           "Number Of Children": "0",
  //           "Income": "50000"
  //         });
  //     print(response.statusCode);
  //     print(response.request);
  //     print(response.headers);
  //     String jsonsDataString = response.bodyBytes.toString(); // toString of Response's body is assigned to jsonDataString
  //     dynamic _data = jsonDecode(jsonsDataString);
  //     print(_data.toString());
  //     // var decodedResponse = await jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //     // print(decodedResponse);
  //     // var uri = Uri.parse(decodedResponse['uri'] as String);
  //     // print(await client.get(uri));
  //   } finally {
  //     client.close();
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch();
  }
  User? mFirebaseUser = FirebaseAuth.instance.currentUser;
  var _databaseRef = FirebaseDatabase.instance.ref();
  Future dataFetch() async{
    dynamic result = (await _databaseRef.child(mFirebaseUser!.uid).child('plans').once()).snapshot.value;
    print(result[0]);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.to(BottomBarStart()),icon: Icon(Icons.arrow_back_ios),),
        title: Text("My Plannings"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){Get.to(AddPlan());},
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(10),
              height:100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1d1d40),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                children: [
                  Image.asset('assets/Rectangle.png',scale: 0.5,),
                  Positioned(
                    left: 120,
                    top: 10,
                    child: Column(
                      children: [
                        Icon(Icons.add,size: 25,color: Colors.white,),
                        Text("Make a Plan",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          FutureBuilder(
            future: dataFetch(),
            builder:(context,snapshot){
            return snapshot.hasData? SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  var cal = double.tryParse(snapshot.data[index]['totalAmount'].toString())!*(double.tryParse(snapshot.data[index]['progress'].toString())!)/100;
                return Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(10),
                  height:100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff1d1d40),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.home,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text(snapshot.data[index]['name'],style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),)
                        ]
                      ),
                      SizedBox(height:10),
                      Stack(
                        children: [
                          Container(
                            height: 10,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          Container(
                            height: 10,
                            width: ((double.tryParse(snapshot.data[index]['progress'].toString())!*8)),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${snapshot.data[index]['progress']}%',style: GoogleFonts.poppins(fontSize: 15,color: Colors.white),),
                          Text('₹$cal - ${snapshot.data[index]['totalAmount']}',style: GoogleFonts.poppins(fontSize: 15,color: Colors.white),)
                        ],
                      )
                      // Container(
                      //   height: 10,
                      //   width: double.infinity,
                      //   color: Colors.white,
                      //   child: Container(
                      //     width: (snapshot.data[index]['progress']*7.0),
                      //     color: Colors.blue,
                      //   ),
                      // )

                    ]
                  )
                );},
              ),
            ):Container();}
          ),
        ]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackniche_finance/UI/getStarted.dart';
import 'package:provider/provider.dart';
import 'Languages/translations.dart';
import 'UI/wrapper.dart';
import 'auth/auth.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<User?>.value(
    value: AuthService().user,
    initialData: FirebaseAuth.instance.currentUser,
    child: Theme(
      data: ThemeData(
        backgroundColor: const Color(0xff141332),
        textTheme: GoogleFonts.poppinsTextTheme(Typography.blackHelsinki)
        // fontFamily: GoogleFonts.poppins()
      ),
      child: GetMaterialApp(
          translations: LocaleString(),
        locale: const Locale('en','US'),
        home: const SafeArea(child: GetStarted()),
        debugShowCheckedModeBanner: false,),
    ),
  ));
  // runApp(const MyApp());
}


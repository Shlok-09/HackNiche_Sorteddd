import 'package:flutter/material.dart';
import 'package:hackniche_finance/auth/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          child: Text("Signout"),
          onPressed: (){
            _auth.handleSignOut();
          },
        ),
      ),
    );
  }
}

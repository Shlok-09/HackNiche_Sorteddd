import 'package:flutter/material.dart';
import 'package:hackniche_finance/UI/home.dart';
import 'package:hackniche_finance/UI/profile.dart';

class BottomBarStart extends StatefulWidget {
  const BottomBarStart({Key? key}) : super(key: key);

  @override
  State<BottomBarStart> createState() => _BottomBarStartState();
}

class _BottomBarStartState extends State<BottomBarStart> {
  int _selectedIndex = 0;

  late List<Widget> pages ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      const HomePage(),
      const HomePage(),
      const Profile()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141332),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (curentIndex){
          setState(() {
            _selectedIndex = curentIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'sub'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'try'
          ),

        ],
      ),
    );
  }
}

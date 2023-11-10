import 'package:flutter/material.dart';
import 'package:rentspeed/menu/dashboard.dart';
import 'package:rentspeed/menu/notif.dart';
import 'package:rentspeed/menu/profile.dart';

class Menus extends StatefulWidget {
  final txt;
  Menus({Key? mykey, this.txt}) : super(key: mykey);

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  List pages = [
    Dashboard(),
    const Notif(),
    const Profil(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C354B),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(end: Alignment.bottomLeft, colors: [
                    Color(0xFF1C354B),
                    Color.fromARGB(255, 32, 66, 94)
                  ]),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.account_box_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              'Halo, ${widget.txt}',
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rent Speed',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: pages[currentIndex],
              )
            ],
          ),
        ),
      ),
      //Bottom NavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C354B),
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFF1C354B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert),
              label: 'Notif',
              backgroundColor: Color(0xFF1C354B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profil',
              backgroundColor: Color(0xFF1C354B)),
        ],
      ),
    );
  }
}

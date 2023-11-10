import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  const Notif({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF1C354B),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 10.0, bottom: 10.0),
                          child: Container(
                            child: Image.asset('assets/images/pajero.png'),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Merk : Pajero",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.amber)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Order : 01-11-2023",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                Text("Return : 02-11-2023",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                Text("Pay : Rp. 400.000",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 10.0, bottom: 10.0),
                          child: Container(
                            child: Image.asset('assets/images/pajero.png'),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Merk : Pajero",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.amber)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Order : 01-11-2023",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                Text("Return : 02-11-2023",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                Text("Pay : Rp. 400.000",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

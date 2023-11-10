import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:rentspeed/menu/menus.dart';

class LoginFinger extends StatelessWidget {
  LoginFinger({super.key});

  final text = 'Jefri Rahman';

  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            end: Alignment.bottomLeft,
            colors: [Color(0xFF1C354B), Color.fromARGB(255, 32, 66, 94)]),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Rent Speed",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                          Text(
                            "for you, and",
                            style: TextStyle(color: Colors.amber, fontSize: 18),
                          ),
                          Text(
                            "Enjoy your holiday",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 100.0, top: 150.0),
                            child: SizedBox(
                              height: 40,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final bool canAuthenticateWithBiometrics =
                                      await auth.canCheckBiometrics;
                                  final bool canAuthenticate =
                                      canAuthenticateWithBiometrics ||
                                          await auth.isDeviceSupported();

                                  print({'Cek Support': canAuthenticate});

                                  final List<BiometricType>
                                      availableBiometrics =
                                      await auth.getAvailableBiometrics();

                                  print({'Cek Available': availableBiometrics});

                                  if (canAuthenticate) {
                                    try {
                                      final bool didAuthenticate = await auth
                                          .authenticate(
                                              options: AuthenticationOptions(
                                                  biometricOnly: true),
                                              localizedReason:
                                                  'Masukan sidik jari untuk verifikasi',
                                              authMessages: [
                                            AndroidAuthMessages(
                                                cancelButton: 'Batal',
                                                signInTitle: 'Rent Speed')
                                          ]);
                                      print({
                                        'Cek apakah Finger benar':
                                            didAuthenticate
                                      });
                                      if (didAuthenticate) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Menus(
                                                      txt: text,
                                                    )));
                                      }
                                    } on PlatformException catch (error) {
                                      print(error);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 5,
                                  backgroundColor: Color(0xFF1C354B),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.fingerprint),
                                    Text('Login')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Contact
                    Container(
                      height: 280,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Rent Speed hadir untuk melayani Anda",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "Berbadan hukum CV. Berkah",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          Text(
                            "Tlpn/WA : 0812-0982-1657, www.cvberkah.com",
                            style: TextStyle(color: Colors.white, fontSize: 13),
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
      ),
    );
  }
}

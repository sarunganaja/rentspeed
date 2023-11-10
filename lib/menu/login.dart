import 'package:flutter/material.dart';
import 'package:rentspeed/menu/menus.dart';
import 'package:rentspeed/menu/login_finger.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formState = GlobalKey<FormState>();
  final _formStatePass = GlobalKey<FormState>();
  TextEditingController userCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomLeft,
              colors: [Color(0xFF1C354B), Color.fromARGB(255, 43, 85, 122)],
            ),
          ),
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  // Judul
                  Container(
                    child: Column(
                      children: [
                        // Logo Aplikasi
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'Rent Speed',
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                const SizedBox(
                                  child: Text(
                                    'for you, and',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 16),
                                  ),
                                ),
                                Text(
                                  'Enjoy your holiday',
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Form Login
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12.0),
                              gradient: const LinearGradient(
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFF1C354B),
                                  Color.fromARGB(255, 43, 85, 122),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                // Judul Form
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Selamat datang, silahkan Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                  ),
                                ),

                                // Username
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Container(
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      gradient: const LinearGradient(
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFF1C354B),
                                          Color.fromARGB(255, 43, 85, 122),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 30.0,
                                        child: Form(
                                          key: _formState,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                color: Colors.black),
                                            controller: userCtrl,
                                            validator: (value) {
                                              if (value == '') {
                                                return "Username tidak boleh kosong!";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              hintText: 'Username',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 20.0,
                                ),

                                // Password
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Container(
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6.0),
                                      gradient: const LinearGradient(
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFF1C354B),
                                          Color.fromARGB(255, 43, 85, 122),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 40.0,
                                        child: Form(
                                          key: _formStatePass,
                                          child: TextFormField(
                                            controller: passCtrl,
                                            validator: (value) {
                                              if (value == '') {
                                                return "Password tidak boleh kosong!";
                                              }
                                              return null;
                                            },
                                            obscureText: _isSecurePassword,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon:
                                                  const Icon(Icons.lock),
                                              suffixIcon: togglePassword(),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              hintText: 'Password',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 20.0,
                                ),

                                _buildLoginButton(),

                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginFinger(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Click Login Finger",
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Izin
                  Container(
                    height: 200,
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

                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(right: 3.0, top: 3.0),
                          child: const Column(
                            children: [
                              Text(
                                'Versi 0.1',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Copyright CV.Berkah',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
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
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formState.currentState!.validate()) {
            // Do something
            print("Validate success");
            if (_formStatePass.currentState!.validate()) {
              print("Username and Password Validate");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Menus(txt: userCtrl.text)));
            } else {
              print('Password Empty');
            }
          } else {
            print("Username Empty");
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 5,
          backgroundColor: const Color(0xFF1C354B),
          minimumSize: const Size.fromHeight(45),
        ),
        child: const Text("LOGIN"),
      ),
    );
  }
}

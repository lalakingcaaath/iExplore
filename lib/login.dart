import 'package:flutter/material.dart';

Color orangeOneColor = const Color(0xFFD25017);
Color orangeTwoColor = const Color(0xFFDD6614);
Color orangeThreeColor = const Color(0xFFE0750F);
Color brownColor = const Color(0xFF703A07);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child:
                       GestureDetector(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: SizedBox(
                           child: Container(
                             child: const Icon(
                               Icons.arrow_back,
                               size: 30,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ),
                    ),
                  ],
                ),
                Center(
                  child: Image.asset('images/iexplore-logo.png', width: 175, height: 175),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                ),
                const Center(
                  child: Text(
                    "iExplore PH", style: TextStyle(
                      fontFamily: 'AdobeDevanagari',
                      fontStyle: FontStyle.normal,
                      fontSize: 40,
                      color: Colors.white
                  ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                ),
                SizedBox(
                  width: 350,
                  child: Center(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your Email",
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                const SizedBox(
                  width: 350,
                  child: Center(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                          border: OutlineInputBorder(),
                          labelText: "Enter your Password",
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(
                          "Login", style: TextStyle(
                        fontFamily: 'AdobeDevanagari',
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 85),
                ),
              ],
            )
        ),
      ),
    );
  }
}

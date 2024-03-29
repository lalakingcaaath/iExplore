import 'package:flutter/material.dart';
import 'package:i_explore/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() {
  
  runApp(const MyApp());
}

Color brownColor = const Color(0xFF703A07);
Color lightOrangeColor = const Color(0xFFF9DCAF);
Color lightOrangeTwoColor = const Color(0xFFF5C57E);
Color orangeOneColor = const Color(0xFFD25017);
Color orangeTwoColor = const Color(0xFFDD6614);
Color orangeThreeColor = const Color(0xFFE0750F);
Color orangeFourColor = const Color(0xFFE88506);
Color darkOrangeColor = const Color(0xFFBE5108);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iExplore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'iExplore PH'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FSP-Demo',
            fontWeight: FontWeight.normal
        ),
        ),
        centerTitle: true,
        backgroundColor: orangeOneColor,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('images/iexplore-logo.png'),

        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [orangeOneColor, orangeTwoColor, orangeThreeColor], // Define your gradient colors
              begin: Alignment.topCenter, // Define the gradient start point
              end: Alignment.bottomCenter, // Define the gradient end point
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    decoration: BoxDecoration(
                        color: lightOrangeColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      "Which Island do you want to explore?",
                      style: TextStyle(
                          color: orangeTwoColor,
                          fontFamily: 'AdobeDevanagari',
                          fontStyle: FontStyle.italic,
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('images/luzon.jpg'),
                      child: Center(
                        child: Text(
                          'LUZON',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdobeDevanagari',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('images/visayas.jpg'),
                      child: Center(
                        child: Text(
                          'VISAYAS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdobeDevanagari',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('images/mindanao.jpg'),
                      child: Center(
                        child: Text(
                          'MINDANAO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                              fontFamily: 'AdobeDevanagari',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Container(
                color: lightOrangeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TOUR CATEGORIES",
                      style: TextStyle(
                        color: orangeTwoColor,
                        fontSize: 20,
                        fontFamily: 'AdobeDevanagari',
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("CULINARY",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("ECOTOURISM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("ADVENTURE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("PILGRIMAGE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("LEISURE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("RURAL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("CULTURAL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("WELLNESS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Container(
                color: lightOrangeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SUGGESTED ITINERARIES",
                      style: TextStyle(
                        color: orangeTwoColor,
                        fontFamily: 'AdobeDevanagari',
                        fontStyle: FontStyle.italic,
                        fontSize: 20
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("MANILA CITY",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                          color: brownColor,
                          child: const Center(
                            child: Text("BAGUIO CITY",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    width: 40,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top:20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthenticationPage()),);
                  },
                      child: const Text("Authentication Page")
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
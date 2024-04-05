import 'package:flutter/material.dart';
import 'package:i_explore/pages/homepage.dart';
import 'utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:i_explore/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iExplore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: orangeOneColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'iExplore'),
    );
  }
}

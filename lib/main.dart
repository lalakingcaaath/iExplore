import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_explore/pages/homepage.dart';
import 'package:i_explore/pages/login.dart';
import 'package:i_explore/services/AuthService.dart';
import 'utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider(
            create: (context) => context.read<AuthService>().authState,
            initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iExplore',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: orangeOneColor),
          useMaterial3: true,
        ),
        home: const Auth(),
      ),
    );
  }
}

// automatically login if user is logged in
class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    // Use FutureBuilder to handle Firebase initialization state
    return FutureBuilder(
      future: Firebase.initializeApp(), // Ensure Firebase is initialized
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (user != null) {
            return const MyHomePage(title: 'Homepage');
          } else {
            return const Login();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

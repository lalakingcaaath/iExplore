import 'package:flutter/material.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/router/router_config.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:i_explore/services/firestorage_service.dart';
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
        ChangeNotifierProvider<CoinProvider>(create: (_) => CoinProvider()),
        Provider<FirebaseStorageService>(
            create: (_) => FirebaseStorageService()),
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider(
            create: (context) => context.read<AuthService>().authState,
            initialData: null)
      ],
      child: MaterialApp.router(
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
        title: 'iExplore',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: orangeOneColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}

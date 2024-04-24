import 'package:flutter/material.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:i_explore/services/firestore_service.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late String uid;

  @override
  void initState() {
    super.initState();
    AuthService _authService = Provider.of<AuthService>(context, listen: false);
    uid = _authService.user!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is a test page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        FirestoreService().addSampleCoins(uid, 50);
                      },
                      child: Text('Add data')),
                  ElevatedButton(
                      onPressed: () {
                        CoinProvider coinProvider =
                            Provider.of<CoinProvider>(context, listen: false);
                        coinProvider.fetchCoinData(uid);
                      },
                      child: Text('Read data')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

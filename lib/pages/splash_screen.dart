import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

// Initial screen for fetching the data to the database

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CoinProvider>(context, listen: false).fetchCoinData();
      Future.delayed(const Duration(milliseconds: 3500), () {
        context.go('/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: LoadingAnimationWidget.hexagonDots(
                color: lightOrangeColor, size: 80.0),
          )),
    );
  }
}

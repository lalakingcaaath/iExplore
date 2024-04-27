import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/model/coin_model.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

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
      AuthService authService =
          Provider.of<AuthService>(context, listen: false);
      Provider.of<CoinProvider>(context, listen: false)
          .fetchCoinData(authService.user!.uid as Coin);

      context.go('/home');
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

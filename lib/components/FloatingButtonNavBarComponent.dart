import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloatingButtonNavBarComponent extends StatelessWidget {
  const FloatingButtonNavBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            context.go('/home');
              
          },
          child: Transform.scale(
            scale: 1.275,
            child: Image.asset('images/iexplore-logo-circle.png'),
          ),
        ),
      ),
    );
  }
}

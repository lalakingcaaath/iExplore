import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_explore/pages/homepage.dart';

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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const MyHomePage(title: "iExplore")));
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

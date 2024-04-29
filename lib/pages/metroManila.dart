import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Metro_Manila extends StatefulWidget {
  const Metro_Manila({Key? key}) : super(key: key);

  @override
  State<Metro_Manila> createState() => _Metro_ManilaState();
}

class _Metro_ManilaState extends State<Metro_Manila> {
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
          appBar: HeaderAppBarComponent(headerTitle: 'Metro Manila'),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowButton(
                      text: 'Manila',
                      func: () =>
                          context.push('/home/luzon/metro_manila/manila')),
                  RowButton(text: 'Navotas'),
                  RowButton(text: 'Las Pinas'),
                  RowButton(text: 'Makati'),
                  RowButton(text: 'Malabon'),
                  RowButton(text: 'Mandaluyong'),
                  RowButton(text: 'Marikina'),
                  RowButton(text: 'Muntinlupa'),
                  RowButton(text: 'Navotas'),
                  RowButton(text: 'Paranaque'),
                  RowButton(text: 'Pasay'),
                  RowButton(text: 'Pasig'),
                  RowButton(text: 'Quezon City'),
                  RowButton(text: 'San Juan'),
                  RowButton(text: 'Valenzuela'),
                  RowButton(text: 'Pateros'),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonNavBarComponent(),
          bottomNavigationBar: BottomNavigationBarComponent()),
    );
  }
}

class RowButton extends StatelessWidget {
  final String text;
  final void Function()? func;

  const RowButton({
    super.key,
    required this.text,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: func,
            child: Container(
              width: 350,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              decoration: BoxDecoration(
                  color: lightOrangeColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: orangeTwoColor,
                      fontFamily: 'AdobeDevanagari',
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

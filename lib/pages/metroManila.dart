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
                          context.pushReplacement('/day_select/manila')),
                  RowButton(
                    text: 'Navotas',
                    func: () => context.pushReplacement('/day_select/navotas'),
                  ),
                  RowButton(
                    text: 'Las Pinas',
                    func: () =>
                        context.pushReplacement('/day_select/las_pinas'),
                  ),
                  RowButton(
                    text: 'Makati',
                    func: () => context.pushReplacement('/day_select/makati'),
                  ),
                  RowButton(
                    text: 'Malabon',
                    func: () => context.pushReplacement('/day_select/malabon'),
                  ),
                  RowButton(
                    text: 'Mandaluyong',
                    func: () =>
                        context.pushReplacement('/day_select/mandaluyong'),
                  ),
                  RowButton(
                    text: 'Marikina',
                    func: () => context.pushReplacement('/day_select/marikina'),
                  ),
                  RowButton(
                    text: 'Muntinlupa',
                    func: () =>
                        context.pushReplacement('/day_select/muntinlupa'),
                  ),
                  RowButton(
                    text: 'Navotas',
                    func: () => context.pushReplacement('/day_select/navotas'),
                  ),
                  RowButton(
                    text: 'Paranaque',
                    func: () =>
                        context.pushReplacement('/day_select/paranaque'),
                  ),
                  RowButton(
                      text: 'Pasay',
                      func: () => context.pushReplacement('/day_select/pasay')),
                  RowButton(
                      text: 'Pasig',
                      func: () => context.pushReplacement('/day_select/pasig')),
                  RowButton(
                      text: 'Quezon City',
                      func: () =>
                          context.pushReplacement('/day_select/quezon')),
                  RowButton(
                      text: 'San Juan',
                      func: () =>
                          context.pushReplacement('/day_select/san_juan')),
                  RowButton(
                      text: 'Valenzuela',
                      func: () =>
                          context.pushReplacement('/day_select/valenzuela')),
                  RowButton(
                      text: 'Pateros',
                      func: () =>
                          context.pushReplacement('/day_select/pateros')),
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

// * if this component reused in other file. make sure to create another file in ./components/RowButtonComponent.dart

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

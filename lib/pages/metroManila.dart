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
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'manila'
                        }),
                  ),
                  RowButton(
                    text: 'Navotas',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'navotas'
                        }),
                  ),
                  RowButton(
                    text: 'Las Pinas',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'las_pinas'
                        }),
                  ),
                  RowButton(
                    text: 'Makati',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'makati'
                        }),
                  ),
                  RowButton(
                    text: 'Malabon',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'malabon'
                        }),
                  ),
                  RowButton(
                    text: 'Mandaluyong',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'mandaluyong'
                        }),
                  ),
                  RowButton(
                    text: 'Marikina',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'marikina'
                        }),
                  ),
                  RowButton(
                    text: 'Muntinlupa',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'muntinlupa'
                        }),
                  ),
                  RowButton(
                    text: 'Navotas',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'navotas'
                        }),
                  ),
                  RowButton(
                    text: 'Paranaque',
                    func: () => context.pushReplacementNamed('day_select',
                        pathParameters: {
                          'region': 'metro_manila',
                          'city': 'paranaque'
                        }),
                  ),
                  RowButton(
                      text: 'Pasay',
                      func: () => context.pushReplacementNamed('day_select',
                              pathParameters: {
                                'region': 'metro_manila',
                                'city': 'pasay'
                              })),
                  RowButton(
                      text: 'Pasig',
                      func: () => context.pushReplacementNamed('day_select',
                              pathParameters: {
                                'region': 'metro_manila',
                                'city': 'pasig'
                              })),
                  RowButton(
                      text: 'Quezon City',
                      func: () => context.pushReplacementNamed('day_select',
                              pathParameters: {
                                'region': 'metro_manila',
                                'city': 'quezon'
                              })),
                  RowButton(
                      text: 'San Juan',
                      func: () => context.pushReplacementNamed('day_select',
                              pathParameters: {
                                'region': 'metro_manila',
                                'city': 'san_juan'
                              })),
                  RowButton(
                      text: 'Valenzuela',
                      func: () => context.pushReplacementNamed('day_select',
                              pathParameters: {
                                'region': 'metro_manila',
                                'city': 'valenzuela'
                              })),
                  RowButton(
                      text: 'Pateros',
                      func: () => context.pushReplacementNamed('day_select',
                              pathParameters: {
                                'region': 'metro_manila',
                                'city': 'pateros'
                              })),
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

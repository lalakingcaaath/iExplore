import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/model/day_model.dart';
import 'package:i_explore/provider/day_provider.dart';
import 'package:i_explore/services/firestore_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:provider/provider.dart';

class DaySelect extends StatefulWidget {
  final String city;
  final String region;

  const DaySelect(
      {Key? key, // Fix the key parameter declaration
      required this.city,
      required this.region})
      : super(key: key); // Add super(key: key)

  @override
  State<DaySelect> createState() => _DaySelectState();
}

class _DaySelectState extends State<DaySelect> {
  int day = 1;
  bool isHidden = false;

  void dayIncrement() {
    setState(() {
      day++;
      print(day);
    });
  }

  void dayDecrement() {
    setState(() {
      day--;
    });
  }

  void getRecommended() async {
    await FirestoreService().getIternaries(widget.region, widget.city);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DayProvider>(context, listen: false).removeAll();

      // Add Your Code here.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: HeaderAppBarComponent(
              headerTitle: '${widget.city} City',
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'YOU ARE NOW IN ${widget.city.toUpperCase()} CITY',
                          style: TextStyle(
                              fontFamily: 'FSP-Demo',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HOW MANY DAYS WILL YOU EXPLORE?",
                          style: TextStyle(
                              fontFamily: 'FSP-Demo',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 64,
                            width: 198,
                            decoration: BoxDecoration(
                                color: brownColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: day > 1
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonComponent(
                                        icon: Icons.remove,
                                        func: dayDecrement,
                                      ),
                                      Text(
                                        "$day DAY",
                                        style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontStyle: FontStyle.italic,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      ButtonComponent(
                                          icon: Icons.add, func: dayIncrement),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(flex: 1, child: SizedBox()),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "$day DAY",
                                          style: TextStyle(
                                              fontFamily: 'AdobeDevanagari',
                                              fontStyle: FontStyle.italic,
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: ButtonComponent(
                                          icon: Icons.add,
                                          func: dayIncrement,
                                        ),
                                      ),
                                    ],
                                  ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          decoration: BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                final list = await FirestoreService()
                                    .getRecommendedIternaries(
                                        widget.region, widget.city, day);
                                // print(list);
                                // print(widget.city);
                                // print(day);
                                Provider.of<DayProvider>(context, listen: false)
                                    .fetchDay(list);
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Consumer<DayProvider>(
                      builder: (context, dayProvider, child) {
                        List<DayModel> dayList = dayProvider.dayValue;
                        return Column(
                          children: dayList.map((dayModel) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                tileColor: brownColor,
                                title: Text(
                                  dayModel.title,
                                  style: TextStyle(
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  dayModel.desc,
                                  style: TextStyle(
                                      fontSize: 16, color: orangeFourColor),
                                ),
                                trailing: Text(
                                  'Good for ${dayModel.goodForDays} ${dayModel.goodForDays > 1 ? 'days' : 'day'}',
                                  style: TextStyle(
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  print(dayModel.id);
                                }, // Add more UI elements as needed
                              ),
                            );
                          }).toList(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingButtonNavBarComponent(),
            bottomNavigationBar: BottomNavigationBarComponent()));
  }
}

class ButtonComponent extends StatelessWidget {
  final IconData icon;
  final void Function() func;

  const ButtonComponent({Key? key, required this.icon, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: func,
        splashColor: darkOrangeColor,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return orangeTwoColor;
            }
            return darkOrangeColor;
          }),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(10)), // Adjust the radius as needed
            ),
          ),
        ),
        icon: Icon(icon, color: Colors.white));
  }
}

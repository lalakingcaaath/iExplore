import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/provider/itinerary_provider.dart';
import 'package:i_explore/services/generativeAI_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:i_explore/utils/helper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:typethis/typethis.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ItineraryGenerator extends StatefulWidget {
  const ItineraryGenerator({Key? key}) : super(key: key);

  @override
  State<ItineraryGenerator> createState() => _ItineraryGeneratorState();
}

class _ItineraryGeneratorState extends State<ItineraryGenerator> {
  String? _name;
  int day = 1;
  int hour = 1;
  bool isLoading = false; // * Loading screen indicator
  bool isCulinary = false;
  bool isAdventure = false;
  bool isEcotourism = false;
  bool isLeisure = false;
  bool isSchools = false;
  bool isPilgrimage = false;
  bool isHotels = false;
  bool isCultural = false;

  final TextEditingController _optionalText = TextEditingController();
  final TextEditingController _budget = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    _name = authService.user?.displayName;
  }

  @override
  void dispose() {
    _optionalText.dispose();
    _budget.dispose();
    super.dispose();
  }

  void generateItinerary() async {
    String optionalTextValue = _optionalText.text.trim();
    String budgetValue = _budget.text.trim();
    List<String> category = [];

    if (isCulinary) category.add('Culinary');
    if (isAdventure) category.add('Adventure');
    if (isEcotourism) category.add('Ecotourism');
    if (isLeisure) category.add('Leisure');
    if (isSchools) category.add('Schools');
    if (isPilgrimage) category.add('Pilgrimage');
    if (isHotels) category.add('Hotels');
    if (isCultural) category.add('Cultural');

    // * validator
    if (category.isEmpty) {
      print('Please select one or more category');
      return;
    }

    if (budgetValue.isEmpty) {
      print('please add budget value');
      return;
    }

    print(
        "Day: ${day} \n Hour: ${hour} \n Budget: ${budgetValue} \n Optional Text: ${optionalTextValue} \n Categories: $category");

    // * preparing statement
    String prompt =
        itineraryPrompt(day, hour, category, int.parse(budgetValue));

    // * create an instance class
    GenerativeAIService aiService = GenerativeAIService();

    try {
      setState(() => isLoading = true);

      String response = await aiService.promptCommand(prompt);

      Map<String, dynamic> jsonParse = aiService.promptToJson(response);
      // * save to our global state
      Provider.of<ItineraryProvider>(context, listen: false)
          .fetchItinerary(jsonParse);

      setState(() => isLoading = false);

      context.
    } catch (error) {
      print(error);
      setState(() => isLoading = false);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void dayIncrement() {
    setState(() {
      day++;
    });
  }

  void dayDecrement() {
    setState(() {
      day--;
    });
  }

  void hourIncrement() {
    setState(() {
      hour++;
    });
  }

  void hourDecrement() {
    setState(() {
      hour--;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom == 0;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: HeaderAppBarComponent(headerTitle: "Itinerary Generator"),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeThis(
                        string: "Hi $_name",
                        style: TextStyle(
                          fontFamily: 'FSP-Demo',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        speed: 150,
                        showBlinkingCursor: false,
                      ),
                      TypeThis(
                        string: "!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        speed: 150,
                        showBlinkingCursor: false,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeThis(
                        string: "READY TO EXPLORE IN ONE CLICK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                        speed: 150,
                        showBlinkingCursor: false,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ImageSlideshow(
                      width: 350,
                      initialPage: 0,
                      indicatorBackgroundColor: Colors.grey,
                      autoPlayInterval: 2500,
                      isLoop: true,
                      children: [
                        Image.asset(
                            "images/category_images/ADVENTURE/Bambike.png",
                            fit: BoxFit.cover),
                        Image.asset(
                          "images/category_images/CULINARIES/Barbaras.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                            "images/category_images/CULTURAL/Manila Metropolitan Theater.jpg",
                            fit: BoxFit.cover),
                        Image.asset(
                          "images/category_images/HOTELS/Shangri-La The Fort, Manila.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                            "images/category_images/LEISURE/Baluarte.jpg",
                            fit: BoxFit.cover),
                        Image.asset(
                            "images/category_images/PILGRIMAGE/Quiapo Church.jpg",
                            fit: BoxFit.cover),
                      ]),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Generate your itinerary based on your preference",
                        style: TextStyle(
                            fontFamily: "AdobeDevanagari",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 64,
                        width: 150,
                        decoration: BoxDecoration(
                            color: brownColor,
                            borderRadius: BorderRadius.circular(20)),
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
                                    "$day day",
                                    style: TextStyle(
                                        fontFamily: 'AdobeDevanagari',
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                  ButtonComponent(
                                      icon: Icons.add, func: dayIncrement),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(Icons.sunny,
                                          color: Colors.white, size: 30)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "$day day",
                                      style: TextStyle(
                                          fontFamily: 'AdobeDevanagari',
                                          fontSize: 15,
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
                              ),
                      ),
                      Container(
                        height: 64,
                        width: 150,
                        decoration: BoxDecoration(
                            color: brownColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: hour > 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonComponent(
                                    icon: Icons.remove,
                                    func: hourDecrement,
                                  ),
                                  Text(
                                    "$hour hour",
                                    style: TextStyle(
                                        fontFamily: 'AdobeDevanagari',
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                  ButtonComponent(
                                      icon: Icons.add, func: hourIncrement),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(Icons.access_time_filled,
                                          color: Colors.white, size: 30)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "$hour hour",
                                      style: TextStyle(
                                          fontFamily: 'AdobeDevanagari',
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: ButtonComponent(
                                      icon: Icons.add,
                                      func: hourIncrement,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 275,
                        height: 290,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search,
                                      color: Colors.white, size: 30),
                                  Text(
                                    "Tour Category",
                                    style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You can select more than one category",
                                    style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isCulinary,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCulinary = value!;
                                              });
                                            }),
                                        Text(
                                          "Culinary",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isAdventure,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isAdventure = value!;
                                              });
                                            }),
                                        Text(
                                          "Adventure",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isEcotourism,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isEcotourism = value!;
                                              });
                                            }),
                                        Text(
                                          "Ecotourism",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isLeisure,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isLeisure = value!;
                                              });
                                            }),
                                        Text(
                                          "Leisure",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isSchools,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isSchools = value!;
                                              });
                                            }),
                                        Text(
                                          "Schools",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isPilgrimage,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isPilgrimage = value!;
                                              });
                                            }),
                                        Text(
                                          "Pilgrimage",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isHotels,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isHotels = value!;
                                              });
                                            }),
                                        Text(
                                          "Hotels",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 125,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.white, width: 2),
                                            checkColor: Colors.white,
                                            value: isCultural,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCultural = value!;
                                              });
                                            }),
                                        Text(
                                          "Cultural",
                                          style: TextStyle(
                                              fontFamily: "AdobeDevanagari",
                                              fontSize: 15,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: brownColor,
                        ),
                        child: Center(
                          // Center the content within the Container
                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min, // Use min to wrap the content
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SizedBox(
                                  width:
                                      100, // Adjust width of TextField as needed
                                  child: TextField(
                                    controller: _budget,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "...type here",
                                        hintStyle: TextStyle(
                                          fontFamily: "AdobeDevanagari",
                                          fontSize: 16,
                                          color: Colors.white,
                                        )),
                                    style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "budget",
                                style: TextStyle(
                                  fontFamily: "AdobeDevanagari",
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Optional",
                                    style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  child: SizedBox(
                                    width: 290,
                                    height: 50,
                                    child: TextField(
                                      controller: _optionalText,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              "...if you want to include a specific place"
                                              "and activity in your itinerary you can type it here."
                                              "Otherwise leave it blank",
                                          hintMaxLines: 3,
                                          hintStyle: TextStyle(
                                            fontFamily: "AdobeDevanagari",
                                            fontStyle: FontStyle.italic,
                                            fontSize: 10,
                                            color: Colors.white,
                                          )),
                                      style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: generateItinerary,
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/AI-transparent.png",
                              width: 40, color: Colors.black),
                          Text(
                            "Generate",
                            style: TextStyle(
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Visibility(
                visible: showFab, child: FloatingButtonNavBarComponent()),
            bottomNavigationBar: BottomNavigationBarComponent(),
          ),
        ),
        if (isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (isLoading)
          Center(
            child: LoadingAnimationWidget.hexagonDots(
                color: lightOrangeTwoColor, size: 80.0),
          )
      ],
    );
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
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return orangeTwoColor;
            }
            return darkOrangeColor;
          }),
          shape: WidgetStateProperty.all<OutlinedBorder>(CircleBorder()),
        ),
        icon: Icon(icon, color: Colors.white));
  }
}

import 'package:flutter/material.dart';
import 'package:i_explore/model/itinerary_model.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/provider/itinerary_provider.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:i_explore/services/firestore_service.dart';
import 'package:i_explore/services/generativeAI_service.dart';
import 'package:i_explore/utils/helper.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late String uid;
  Itinerary? itinerary;
  bool isLoading = false; // Track loading state

  Future<void> generate() async {
    isLoading = true;
    GenerativeAIService aiService = GenerativeAIService();

    String text = itineraryPrompt(1, 3, ['culinary'], 3000);

    String prompt = await aiService.promptCommand(text);
    Map<String, dynamic> promptJson = aiService.promptToJson(prompt);
    print(prompt);
    itinerary = Itinerary.fromJson(promptJson);

    setState(() {
      itinerary = itinerary;
    });

    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    AuthService _authService = Provider.of<AuthService>(context, listen: false);
    uid = _authService.user!.uid;
    itinerary = null;
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
                        // after adding coin
                        FirestoreService().addSampleCoins(1);
                        // then reload the coin value
                        Provider.of<CoinProvider>(context, listen: false)
                            .fetchCoinData();
                      },
                      child: Text('Add data')),
                  ElevatedButton(
                      onPressed: () {
                        CoinProvider coinProvider =
                            Provider.of<CoinProvider>(context, listen: false);
                        print(coinProvider.coinValue!.coinValue);
                      },
                      child: Text('Read data')),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // after adding coin
                        FirestoreService().removeSampleCoins(1);
                        // then reload the coin value
                        Provider.of<CoinProvider>(context, listen: false)
                            .fetchCoinData();
                      },
                      child: Text('-1 coin')),
                  ElevatedButton(
                      onPressed: () async {
                        // after adding coin
                        await FirestoreService()
                            .getIternaries('metro_manila', 'manila');
                      },
                      child: Text('Get Itinaries')),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: generate,
                    child: Text('AI Prompt'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Itinerary? itinerary = Provider.of<ItineraryProvider>(
                                context,
                                listen: false)
                            .itineraryVal;
                        if (itinerary != null) {
                          print(itinerary.id);
                        }
                      },
                      child: Text('Fetch Itinerary'))
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Itinerary? itinerary = Provider.of<ItineraryProvider>(
                                context,
                                listen: false)
                            .itineraryVal;
                        var example = itinerary?.toJson();

                        print(example);
                        // print('fetch from provider');
                        // Itinerary itiObj = Itinerary.fromJson(example);

                        // print('done');
                      },
                      child: Text('Get itinerary in JSON'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget buildItineraryTable(Itinerary itinerary) {
//   return Table(
//     border: TableBorder.all(color: Colors.grey),
//     children: [
//       TableRow(
//         children: [
//           TableCell(
//             child: Text(
//               'Theme',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           TableCell(
//             child: Text(itinerary.category),
//           ),
//         ],
//       ),
//       TableRow(
//         children: [
//           TableCell(
//             child: Text(
//               'Duration',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           TableCell(
//             child: Text(itinerary.duration),
//           ),
//         ],
//       ),
//       TableRow(
//         children: [
//           TableCell(
//             child: Text(
//               'Budget',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           TableCell(
//             child: Text(itinerary.budget as String),
//           ),
//         ],
//       ),
//       const TableRow(children: [
//         TableCell(
//           child: Text(
//             'Activities',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         TableCell(child: Text('')),
//       ]),
//       ...itinerary.activities
//           .map((activity) => buildActivityRow(activity))
//           .toList(),
//     ],
//   );
// }

// TableRow buildActivityRow(Activity activity) {
//   return TableRow(
//     children: [
//       TableCell(
//         child: Text(activity.time),
//       ),
//       TableCell(
//         child: Text('${activity.location} - ${activity.whatToDo}'),
//       ),
//     ],
//   );
// }

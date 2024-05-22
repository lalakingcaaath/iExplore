import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  TextEditingController _userInput =TextEditingController();

  static const apiKey = "AIzaSyBNit_I6C6T3mwzbQETGXYgJFjWXA3RZ1s";

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  Future<void> sendMessage() async{
    final message = _userInput.text;

    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
      _userInput.clear();
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);


    setState(() {
      _messages.add(Message(isUser: false, message: response.text?? "", date: DateTime.now()));
      _userInput.clear();
    });

  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom == 0;
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
        appBar: HeaderAppBarComponent(headerTitle: "AI Chat"),
        body: Container(
          decoration: BoxDecoration(
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(itemCount:_messages.length,itemBuilder: (context,index){
                    final message = _messages[index];
                    return Messages(isUser: message.isUser, message: message.message, date: DateFormat('HH:mm').format(message.date));
                  })
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 15,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _userInput,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            label: Text('Enter Your Message')
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        padding: EdgeInsets.all(12),
                        iconSize: 30,
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.black),
                            foregroundColor: WidgetStateProperty.all(Colors.white),
                            shape: WidgetStateProperty.all(CircleBorder())
                        ),
                        onPressed: (){
                          sendMessage();
                        },
                        icon: Icon(Icons.send))
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:Visibility(
            visible: showFab,
            child: FloatingButtonNavBarComponent()),
        bottomNavigationBar: BottomNavigationBarComponent(),
      ),
    );
  }
}

class Message{
  final bool isUser;
  final String message;
  final DateTime date;

  Message({ required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {

  final bool isUser;
  final String message;
  final String date;

  const Messages(
      {
        super.key,
        required this.isUser,
        required this.message,
        required this.date
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
          left: isUser ? 100:10,
          right: isUser ? 10: 100
      ),
      decoration: BoxDecoration(
          color: isUser ? orangeFourColor : orangeFourColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: isUser ? Radius.circular(10): Radius.zero,
              topRight: Radius.circular(10),
              bottomRight: isUser ? Radius.zero : Radius.circular(10)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontFamily: "AdobeDevanagari",fontSize: 16,color: isUser ? Colors.black: Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontFamily: "AdobeDevanagari",fontSize: 10,color: isUser ? Colors.black: Colors.black,),
          )
        ],
      ),
    );
  }
}
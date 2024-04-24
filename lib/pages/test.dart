import 'package:flutter/material.dart';
import 'package:i_explore/services/FirestoreService.dart';

class Test extends StatelessWidget {
  const Test({super.key});

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
                      FirestoreService().addSampleData();
                    }, 
                    child: Text('Add data'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

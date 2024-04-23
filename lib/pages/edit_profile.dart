import 'package:flutter/material.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
import 'package:i_explore/utils/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: orangeOneColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.white),
              iconSize: 32,
            ),
          ),
          title: Text(
            'Edit Profile'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'FSP-Demo',
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 75,
                    ),
                    GestureDetector(
                      onTap: () => print('Clicked edit photo'),
                      child: Text('Change Photo',
                          style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'Personal Info:'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFieldComponent(
                      name: 'Full Name',
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFieldComponent(
                      name: 'Email',
                      icon: Icons.mail,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFieldComponent(
                      name: 'Password',
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () => print('Clicked Delete acc btn'),
                            child: Text(
                              'Delete your account?',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            )),
                        ElevatedButton(
                            onPressed: () => print('Clicked save acc btn'),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            )),
                      ],
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

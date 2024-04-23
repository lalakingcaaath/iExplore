import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/services/AuthService.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/utils/validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _editNameController = TextEditingController();
  final _editFormKey = GlobalKey<FormState>();
  bool _isLoading = false;

  File? _profileImage;
  String? _profileImageUrl;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });

      //Upload Image to Firebase Storage
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('user_profile_picture.jpg');
      await storageRef.putFile(_profileImage!);

      //Get Download URL
      final String downloadUrl = await storageRef.getDownloadURL();

      //Storage download URL in Cloud Firestore
      final userRef =
          FirebaseFirestore.instance.collection('users').doc('user_id');
      await userRef.set({'profileImageUrl': downloadUrl});

      setState(() {
        _profileImageUrl = downloadUrl;
      });
    }
  }

  void _changeName(BuildContext context) async {
    if (_editFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String username = _editNameController.text.trim();

      try {
        AuthService authService =
            Provider.of<AuthService>(context, listen: false);
        final isChangedName = await authService.changeName(username);
        if (isChangedName) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('You changed your name')),
          );
        }
      } catch (e) {
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _editNameController.dispose();
    super.dispose();
  }

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
        appBar: HeaderAppBarComponent(headerTitle: 'Profile'),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage,
                      child: _profileImage != null
                          ? CircleAvatar(
                              radius: 75,
                              backgroundImage: FileImage(_profileImage!),
                            )
                          : GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 75,
                                child: Text('Upload\nProfile\nPhoto',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isLoading
                        ? CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                          'Edit your name',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'FSP-Demo',
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        content: Form(
                                            key: _editFormKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _editNameController,
                                                  validator: validateName,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () =>
                                                            context.pop(),
                                                        child: Text('Close')),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          _changeName(context);
                                                          context.pop();
                                                        },
                                                        child: Text('Edit')),
                                                  ],
                                                )
                                              ],
                                            )),
                                      ));
                            },
                            child: Text(
                              AuthService().user!.displayName!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'FSP-Demo',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ),
                    Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        "TRAVEL HISTORY",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        "CUSTOMIZED ITINERARIES",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        "MY REVIEWS",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          if (await AuthService().logOutUser()) {
                            context.go('/login');
                          }
                        },
                        child: Text('Logout')),
                    ElevatedButton(
                        onPressed: () {
                          context.push('/profile/edit');
                        },
                        child: Text('Edit Profile')),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButtonNavBarComponent(),
        bottomNavigationBar: BottomNavigationBarComponent(),
      ),
    );
  }
}

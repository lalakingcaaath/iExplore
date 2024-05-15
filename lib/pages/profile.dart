import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:i_explore/services/firestorage_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/utils/validator.dart';
import 'package:image_picker/image_picker.dart';
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

  String? photoURL;

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      final String filePath = pickedFile!.path;
      print('Filepath: ${filePath}');

      AuthService _authService =
          Provider.of<AuthService>(context, listen: false);
      final String userUid = _authService.user!.uid;
      print('UserUID: ${userUid}');
      FirebaseStorageService _fbStorage =
          Provider.of<FirebaseStorageService>(context, listen: false);

      final String? _downloadUrl =
          await _fbStorage.uploadProfile(filePath, userUid);
      print('DL URL: ${_downloadUrl}');

      if (await _authService.changeProfile(_downloadUrl!)) {
        print('SUCCESS');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('You changed your profile')),
        );
      }

      setState(() {
        photoURL = _authService.user!.photoURL;
      });
    } catch (e) {
      print(e);
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
  void initState() {
    super.initState();
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    photoURL = authService.user?.photoURL;
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
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage:
                            photoURL != null ? NetworkImage(photoURL!) : null,
                        child: photoURL == null
                            ? Text('Upload\nProfile\nPhoto',
                                textAlign: TextAlign.center)
                            : null,
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
                                                SizedBox(
                                                  height: 4,
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
                              AuthService().user?.displayName ?? 'User',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 330,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: orangeFourColor,
                        border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: Text(
                          "SHARE iEXPLORER PH & GET REWARDED!", style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AdobeDevanagari",
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 2
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get more coins for every successful referral!", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "AdobeDevanagari",
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: orangeFourColor,
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: Text(
                          "See details", style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AdobeDevanagari",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2
                        ),
                        ),
                      ),
                    )
                  ],
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
                          context.push('/test');
                        },
                        child: Text('Test Page')),
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

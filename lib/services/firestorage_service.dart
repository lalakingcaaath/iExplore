import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload file to Firebase Storage
  Future<String?> uploadProfile(String filePath, String destinationPath) async {
    try {
      TaskSnapshot snapshot = await _storage
          .ref()
          .child('profile_pictures')
          .child('${destinationPath}.jpg')
          .putFile(File(filePath));
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }
}

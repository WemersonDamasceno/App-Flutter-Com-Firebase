import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(String path) async {
    File file = File(path);
    try {
      String ref = "images/img-${DateTime.now().toString()}.jpg";
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      print("Erro no upload -> $e");
    }
  }
}

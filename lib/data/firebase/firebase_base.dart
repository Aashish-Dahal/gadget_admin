import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseBase {
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static FirebaseStorage storageInstance = FirebaseStorage.instance;
}

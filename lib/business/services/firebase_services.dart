import 'dart:io';
import 'package:admin_panel/data/firebase/firebase_base.dart';
import 'package:admin_panel/data/model/slider_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseServices {
  static String? _url;
  static TaskSnapshot? _snapshot;
  static Reference? _ref;

  static Future<String?> uploadImage(File image) async {
    _ref = FirebaseBase.storageInstance
        .ref()
        .child("sliderImages")
        .child(image.path.split("/cache/").last);
    _snapshot = await _ref?.putFile(File(image.path));
    _url = await _ref?.getDownloadURL();
    return _url;
  }

  static Future<void> uploadBannerData(SliderModel sliderInstance) async {
    final docUser = FirebaseBase.firestoreInstance.collection('slider').doc();
    sliderInstance.id = docUser.id;
    await docUser.set(sliderInstance.toFirestore());
  }
}

import 'dart:io';
import 'package:admin_panel/data/firebase/firebase_base.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  File? _image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Slider"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!), fit: BoxFit.cover)
                        : const DecorationImage(
                            image: AssetImage(
                                "assets/images/slider_background.jpg"))),
              ),
              _image != null
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.topCenter,
                      child: TextButton(
                          onPressed: () {
                            _openImagePicker();
                          },
                          child: const Text(
                            "Select Image",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (_image == null)
                  ? null
                  : () async {
                      TaskState state = await _uploadImage();
                      if (state == TaskState.success) {
                        print("success");
                      }
                    },
              child: const Text("Upload Image"))
        ],
      ),
    );
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<TaskState> _uploadImage() async {
    final ref = FirebaseBase.storageInstance
        .ref()
        .child("sliderImages")
        .child(_image!.path.split("/cache/").last);
    var result = await ref.putFile(File(_image!.path));
    var url = await ref.getDownloadURL();
    final docUser = FirebaseBase.firestoreInstance.collection('slider').doc();
    await docUser.set({'id': docUser.id, 'imagePath': url});
    return result.state;
  }
}

import 'dart:io';
import 'dart:ui' show ImageFilter;
import 'package:admin_panel/business/services/firebase_services.dart';
import 'package:admin_panel/config/style/mp_value.dart';
import 'package:admin_panel/data/model/slider_model.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BackdropFilter,
        BorderRadius,
        BoxFit,
        BuildContext,
        ClipRRect,
        Colors,
        Column,
        Container,
        EdgeInsets,
        ElevatedButton,
        Image,
        Key,
        MainAxisSize,
        Padding,
        Scaffold,
        SizedBox,
        Stack,
        StackFit,
        State,
        StatefulWidget,
        Text,
        TextButton,
        Theme,
        TileMode,
        Widget;
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

import '../widgets/button.dart';

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
        title: const Text("Add Slider Image"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p10, right: AppPadding.p10, left: AppPadding.p10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(_image!, fit: BoxFit.cover))
                      : Image.asset('assets/images/slider_background.jpg',
                          fit: BoxFit.cover),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
                      child: Container(
                          color: Colors.black.withOpacity(.2),
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                _openImagePicker();
                              },
                              child: Text("Select Image",
                                  style:
                                      Theme.of(context).textTheme.headline1))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              width: double.infinity,
              size: ButtonSize.large,
              type: ButtonType.filled,
              onPressed: _image == null
                  ? () {}
                  : () async {
                      String? url = await FireBaseServices.uploadImage(_image!);
                      if (url != null) {
                        FireBaseServices.uploadBannerData(
                            SliderModel(imagePath: url));
                      }
                    },
              child: const Text("Upload Image"),
            ),
          ],
        ),
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
}

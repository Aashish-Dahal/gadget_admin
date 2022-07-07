import 'package:flutter/material.dart';

import '../../config/style/font.dart';
import '../../config/style/style.dart';

class InputField extends StatelessWidget {
  final IconData? prefixIcon;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const InputField(
      {Key? key,
      this.prefixIcon,
      this.hintText,
      this.keyboardType,
      this.controller,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.text,
      style: getRegularStyle(color: Colors.black, fontSize: FontSize.s14),
      decoration: InputDecoration(
        hintText: hintText ?? "Category name",
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}

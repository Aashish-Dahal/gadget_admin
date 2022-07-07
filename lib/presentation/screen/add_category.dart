import 'package:admin_panel/presentation/widgets/button.dart';
import 'package:admin_panel/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  static const routeName = "add_category";
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController _category = TextEditingController();
  @override
  void dispose() {
    _category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InputField(
              controller: _category,
              prefixIcon: Icons.category,
            ),
            const SizedBox(
              height: 10,
            ),
            Button(
                width: double.infinity,
                size: ButtonSize.large,
                type: ButtonType.filled,
                onPressed: () {},
                child: const Text("Add Category"))
          ],
        ),
      ),
    );
  }
}

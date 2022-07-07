import 'package:admin_panel/config/themes/app_themes.dart';
import 'package:admin_panel/presentation/screen/dashboard_screen.dart';
import 'package:flutter/material.dart'
    show BuildContext, Key, MaterialApp, StatelessWidget, Widget;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gadget Admin',
        theme: AppTheme.light,
        home: const DashBoardScreen());
  }
}

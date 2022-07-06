import 'package:admin_panel/config/app_colors.dart';
import 'package:admin_panel/presentation/screen/dashboard_screen.dart';
import 'package:flutter/material.dart'
    show BuildContext, Key, MaterialApp, StatelessWidget, ThemeData, Widget;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: AppColors.primary,
        ),
        home: const DashBoardScreen());
  }
}

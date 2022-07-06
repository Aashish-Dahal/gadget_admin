import 'package:admin_panel/config/app_colors.dart';
import 'package:admin_panel/presentation/screen/slider_screen.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BuildContext,
        Colors,
        Column,
        Divider,
        Drawer,
        FontWeight,
        Icon,
        Image,
        Key,
        ListTile,
        MaterialPageRoute,
        Navigator,
        Radius,
        RoundedRectangleBorder,
        SafeArea,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

import '../../data/model/dashboard_model.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
          width: 220,
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 120,
              ),
              const Divider(
                thickness: 1,
              ),
              ...List.generate(dashboardDataList.length, (index) {
                var item = dashboardDataList[index];
                return ListTile(
                  dense: true,
                  tileColor: (selectedIndex == index)
                      ? Colors.grey.shade200
                      : Colors.transparent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeSlider()));
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  leading: Icon(
                    item.icon,
                    color: (selectedIndex == index)
                        ? AppColors.primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    item.title.toString(),
                    style: TextStyle(
                        color: (selectedIndex == index)
                            ? Colors.black
                            : Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                );
              })
              // dashboardDataList.map((item) {

              // }).toList()
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
    );
  }
}

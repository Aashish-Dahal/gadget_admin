import 'package:flutter/material.dart' show IconData, Icons;

class DashboardModel {
  String? title;
  IconData? icon;
  DashboardModel({
    this.title,
    this.icon,
  });
}

final dashboardDataList = <DashboardModel>[
  DashboardModel(title: "Dashboard", icon: Icons.dashboard),
  DashboardModel(title: "Category", icon: Icons.category),
  DashboardModel(title: "Slider", icon: Icons.slideshow_rounded),
  DashboardModel(title: "Products", icon: Icons.add),
];

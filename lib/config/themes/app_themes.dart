import 'package:admin_panel/config/style/font.dart';
import 'package:admin_panel/config/style/style.dart';
import 'package:admin_panel/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        brightness: Brightness.light,
        primarySwatch: AppColors.primary,
        fontFamily: FontConstants.fontFamily,
        scaffoldBackgroundColor: Colors.white,
        primaryColorDark: AppColors.primary.shade700,
        primaryColorLight: AppColors.primary.shade100,
        textTheme: TextTheme(
          button: getMediumStyle(color: Colors.white, fontSize: FontSize.s14),
          caption: getRegularStyle(color: Colors.white),
          headline1:
              getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s20),
          headline2: getBoldStyle(color: Colors.white, fontSize: FontSize.s18),
          headline3:
              getRegularStyle(color: Colors.white, fontSize: FontSize.s16),
          subtitle1:
              getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s16),
          subtitle2:
              getRegularStyle(color: Colors.white, fontSize: FontSize.s14),
          bodyText1:
              getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s16),
          bodyText2:
              getRegularStyle(color: Colors.white, fontSize: FontSize.s14),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
            8,
          )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
            8,
          )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
            8,
          )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
            8,
          )),
          fillColor: AppColors.primaryColor.withOpacity(.1),
        ),
        appBarTheme: AppBarTheme(
            elevation: 0,
            titleTextStyle:
                getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s20)));
  }
}

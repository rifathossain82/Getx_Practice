import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_demo/src/counter/controller/counterController.dart';
import 'package:get_x_demo/src/counter/view/counterPage.dart';
import 'package:get_x_demo/src/localizations/controller/languageController.dart';
import 'package:get_x_demo/src/localizations/view/HomeLocale.dart';
import 'package:get_x_demo/src/route/homeRoute.dart';
import 'package:get_x_demo/src/spacialServices/dialog_snackbar.dart';
import 'package:get_x_demo/src/studentInfo/view.dart';
import 'package:get_x_demo/src/themeChange/controller/themeController.dart';
import 'package:get_x_demo/src/themeChange/theme/themes.dart';
import 'package:get_x_demo/src/themeChange/view/HomeTheme.dart';

void main() async{

  ///only for counter practice
  //Get.put(CounterController());

  //this is for initialization getx storage
  //await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key, );


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      ///only for localization
      //translations: LanguageController(),
      //locale: Locale('en', 'US'),
      //fallbackLocale: Locale('en', 'US'),

      home: Dialog_Snackbar(),

      ///only for themechange
      //theme: Themes().lightTheme,
      //darkTheme: Themes().darkTheme,
      //themeMode: ThemeController().getThemeMode(),
    );
  }
}


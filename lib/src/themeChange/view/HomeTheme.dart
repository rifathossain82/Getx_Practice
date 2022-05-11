import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/src/themeChange/controller/themeController.dart';

class HomeTheme extends StatelessWidget {
  const HomeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme With GetX'),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            ThemeController().changeThemeMode();
          },
          child: Text('Switch Theme'),
        ),
      ),
    );
  }
}

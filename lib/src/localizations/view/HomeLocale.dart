import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLocale extends StatelessWidget {
  const HomeLocale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appName".tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('myName'.tr),
          SizedBox(height: 60,),
          ElevatedButton(onPressed: (){Get.updateLocale(Locale('en', 'US'));}, child: Text('English')),
          ElevatedButton(onPressed: (){Get.updateLocale(Locale('bn', 'BD'));}, child: Text('Bangla')),
        ],
      ),
    );
  }
}

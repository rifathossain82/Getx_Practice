import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result=Get.arguments;
    print(result);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Next Page'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            Get.back(
              result: ['Jobayer Hossain', 'Web Developer']
            );
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}

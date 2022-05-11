import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/src/route/nextPage.dart';


class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing with GetX'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            var result=await Get.to(()=>
              NextPage(),
              transition: Transition.rightToLeftWithFade,
              duration: Duration(milliseconds: 500),
              arguments: ['Rifat Hossain', 'Flutter App Developer'],
              preventDuplicates: true,
            );

            print(result);
          },
          child: Text('Go to Next page'),
        ),
      ),
    );
  }
}


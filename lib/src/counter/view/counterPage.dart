import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/src/counter/controller/counterController.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  var controller=Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter with getx'),
      ),
      body: Center(
        child: Obx(
          () {
            return Text('${controller.count}', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16,),
          FloatingActionButton(
            onPressed: (){
              controller.decrement();
            },
            child: Icon(CupertinoIcons.minus),
          ),
          SizedBox(height: 16,),
          FloatingActionButton(
            onPressed: (){
              controller.clearCount();
            },
            child: Icon(CupertinoIcons.refresh),
          ),
        ],
      ),
    );
  }
}

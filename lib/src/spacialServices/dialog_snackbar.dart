import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Dialog_Snackbar extends StatelessWidget {
  const Dialog_Snackbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog & Snackbar with GetX'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //snackBar button
            ElevatedButton(
              onPressed: (){
                Get.snackbar(
                  'Error',
                  'Unable to Delete Data',
                  duration: Duration(seconds: 5),
                  icon: Icon(Icons.error_outline_rounded, color: Colors.red,),
                  //backgroundColor: Colors.blueGrey[300],
                  barBlur: 10,
                  colorText: Colors.red,
                  //dismissDirection: DismissDirection.horizontal
                  showProgressIndicator: true,
                  progressIndicatorBackgroundColor: Colors.red,
                  //leftBarIndicatorColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM,
                  //titleText: Text('Error'),
                  //snackStyle: SnackStyle.FLOATING,
                );
              },
              child: Text('Snackbar')
            ),

            //dialog button
            ElevatedButton(
                onPressed: (){
                  Get.defaultDialog(
                    title: 'Warning!!!',
                    content: Text('All Data will be delete.'),
                    backgroundColor: Colors.blueGrey[900],
                    //contentPadding: EdgeInsets.only(top: 50),
                    barrierDismissible: false,
                    // cancel: TextButton(
                    //     onPressed: (){
                    //       //Get.close(0);
                    //       //Get.back();
                    //     },
                    //     child: Text('Cancel')
                    // ),
                    //
                    actions: [
                      TextButton(
                        onPressed: (){
                          //Get.close(0);
                          Get.back();
                        },
                        child: Text('Cancel')
                      ),

                      TextButton(
                        onPressed: (){
                          //Get.close(0);
                          Get.back();
                        },
                        child: Text('OK')
                      ),
                    ]
                  );
                },
                child: Text('Dialog')
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/src/counter/controller/counterController.dart';
import 'package:get_x_demo/src/studentInfo/controller.dart';
import 'package:get_x_demo/src/studentInfo/model.dart';

class StudentView extends StatefulWidget {
  StudentView({Key? key}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final controller=Get.put(StudentController());

  final counterController=Get.put(CounterController());

  TextEditingController searchController=TextEditingController();

  TextEditingController controller1=TextEditingController();

  TextEditingController controller2=TextEditingController();

  TextEditingController controller3=TextEditingController();

  TextEditingController controller4=TextEditingController();

  TextEditingController controller5=TextEditingController();

  void clear_controller(){
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
  }

  var appbar=Text('MySql Practice');

  Icon _icon=Icon(Icons.search);

  var search_active=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: search_active?
        TextField(
          controller: searchController,
          style: TextStyle(color: Colors.white),
          onChanged: (val){
            if(searchController.text.toString().isEmpty){
              controller.getData();
            }
            else{
              print(searchController.text.toString());
              controller.getData(roll: searchController.text.toString());
            }
          },
          decoration: InputDecoration(
              hintText: 'Enter Roll',
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none
          ),
        )
            :
        appbar,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(_icon.icon==Icons.search){
                search_active = true;
                _icon=Icon(Icons.close);
              }
              else{
                search_active = false;
                _icon=Icon(Icons.search);
                controller.getData();
              }
            });
          }, icon: _icon),
          IconButton(onPressed: (){
            //refreshData();
          }, icon: Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                      label: Text('Enter Id'),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: controller2,
                  decoration: InputDecoration(
                      label: Text('Enter Name'),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: controller3,
                  decoration: InputDecoration(
                      label: Text('Enter Roll'),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: controller4,
                  decoration: InputDecoration(
                      label: Text('Enter Shift'),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: controller5,
                  decoration: InputDecoration(
                      label: Text('Enter Technology'),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    TextButton(onPressed: ()async {
                      var s=await controller.AddData(StudentData(controller1.text, controller2.text, controller3.text, controller4.text, controller5.text));
                      print(s);
                      controller.getData();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
                      clear_controller();
                    }, child: Text('Add')),
                    TextButton(onPressed: ()async{
                      var s=await controller.UpdateData(StudentData(controller1.text, controller2.text, controller3.text, controller4.text, controller5.text));
                      print(s);
                      controller.getData();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
                      clear_controller();
                    }, child: Text('Update')),
                    TextButton(onPressed: (){
                      clear_controller();
                      counterController.increment();
                      controller.getData();
                    }, child: Text('Clear')),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: GetX<StudentController>(builder: (controller){
                return ListView.builder(
                    itemCount: controller.students.length,
                    itemBuilder: (context, index) {
                      var data=controller.students[index];
                      return ListTile(
                        title: Text(data.name.toString(),),
                        leading: Text(data.id.toString()),
                        trailing: IconButton(
                          onPressed: ()async{
                            var s=await controller.DeleteData(data.id.toString());
                            controller.getData();
                            print(s);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
                          },
                          icon: Icon(Icons.delete),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Text(data.roll.toString())),
                            Expanded(child: Text(data.shift.toString())),
                            Expanded(child: Text(data.technology.toString())),
                          ],
                        ),
                        onTap: (){
                          controller1.text=data.id.toString();
                          controller2.text=data.name.toString();
                          controller3.text=data.roll.toString();
                          controller4.text=data.shift.toString();
                          controller5.text=data.technology.toString();
                        },
                      );
                    });
              },)
          )
        ],
      ),
    );
  }
}

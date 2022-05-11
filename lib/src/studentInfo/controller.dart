import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_x_demo/src/counter/controller/counterController.dart';
import 'package:get_x_demo/src/studentInfo/model.dart';
import 'package:http/http.dart' as http;

class StudentController extends GetxController{
  var students=<StudentData>[].obs;
  var counterController=Get.find<CounterController>();
  var searchBar=false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  setSearchBar(bool status){
    searchBar=status;
  }

  void getData({String? roll})async{
    var response;
    var data;
    students.value=[];
    print(counterController.count);

    if(roll != null){
      var map=Map<String,dynamic>();
      map['Roll']='${roll}';
      print(roll);
      response=await http.post(Uri.parse("https://5wldbx4qhdyjcv1aedqp.000webhostapp.com/search_student.php"), body: map);
    }
    else{
      response=await http.get(Uri.parse("https://5wldbx4qhdyjcv1aedqp.000webhostapp.com/serachAll.php"));
    }

    if(response.statusCode==200){
      data=jsonDecode(response.body.toString());
      for(Map i in data){
        students.add(StudentData.fromJson(i));
      }
    }
    else{
      throw Exception('No data found');
    }
  }

  Future<String> AddData(StudentData data)async{
    var map=Map<String,dynamic>();
    map['Id']='${data.id}';
    map['Name']='${data.name}';
    map['Roll']='${data.roll}';
    map['Shift']='${data.shift}';
    map['Technology']='${data.technology}';
    final response=await http.post(Uri.parse("https://5wldbx4qhdyjcv1aedqp.000webhostapp.com/addData.php"),body: map);
    if(response.statusCode==200){
      return response.body;
    }
    else{
      return 'Error';
    }
  }

  Future<String> UpdateData(StudentData data)async{
    var map=Map<String,dynamic>();
    map['Id']='${data.id}';
    map['Name']='${data.name}';
    map['Roll']='${data.roll}';
    map['Shift']='${data.shift}';
    map['Technology']='${data.technology}';
    final response=await http.post(Uri.parse("https://5wldbx4qhdyjcv1aedqp.000webhostapp.com/updateData.php"),body: map);
    if(response.statusCode==200){
      return response.body;
    }
    else{
      return 'Error';
    }
  }

  Future<String> DeleteData(String id)async{
    var map=Map<String,dynamic>();
    map['Id']='$id';
    final response=await http.post(Uri.parse("https://5wldbx4qhdyjcv1aedqp.000webhostapp.com/deleteData.php"),body: map);
    if(response.statusCode==200){
      return response.body;
    }
    else{
      return 'Error';
    }
  }
}
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firstproject/feature/model/page_load_refresh_model/Pagination_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class ParginationController extends GetxController{
  // Rx<ParticipantModel> getData=ParticipantModel().obs;

  ParticipantModel getData=ParticipantModel();



 List getDataList=[].obs;






  RxInt page=RxInt(0);
  @override
  void onInit() {
    super.onInit();

    // getRequest();

  }





  //get
  Future<http.Response?>getRequest()async{



    getDataList=[];

    // getDataList.value=[];
    try{
      return http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=0&_limit=20')).then((res) {
        // print(res.body);

        if(res.statusCode==200){
          // getData=ParticipantModel.fromJson(json.decode(res.body));


          getDataList=jsonDecode(res.body);
          // print(getDataList.length);


        }
      }).catchError((e){
        print(e.toString());
      });
      
    }on SocketException{
      return null;
    }on TimeoutException{
      return null;
    }


  }
  
  

}
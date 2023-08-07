import 'dart:convert';

import 'package:firstproject/constant/local_string.dart';
import 'package:firstproject/feature/model/price_icrease_index_model/price_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PriceController extends GetxController {
  TextEditingController priceController = TextEditingController();

  Rx<PriceModel> productData = Rx(PriceModel());
  Box<PriceModel> productBox = Hive.box<PriceModel>(LocalString.PRICE_BOX);
  PriceModel get getProduct => productData.value;

  RxInt price = RxInt(0);
  var body = {
    "data": [
      {
        "product_name": "Apple",
        "details": "description about product",
        "price": 0,
        "isSelect": false,
      },
      {
        "product_name": "Potato",
        "details": "description about product",
        "price": 0,
        "isSelect": false,
      },
      {
        "product_name": "Mango",
        "details": "description about product",
        "price": 0,
        "isSelect": false,
      },
      {
        "product_name": "Banana",
        "details": "description about product",
        "price": 0,
        "isSelect": false,
      }
    ],
    "totalPrice": 0
  };


  increament({index}) {
    price.value= productData.value.data![index].price!;
    if (price.value >= 0) {

      price.value++;



      productData.value.data![index].price =  price.value;
      totalPrice();
      print(productData.value.data![index].price);
    }

    // priceController.text=price.value.toString();
  }




  decreament({index}) {

    price.value= productData.value.data![index].price!;
    if (price.value > 0) {


      price.value--;
      // print(price.value);0
      productData.value.data![index].price =  price.value;


      totalPrice();
      print(productData.value.data![index].price);
    }

    // priceController.text=price.value.toString();
  }
  int totalPrice(){

    var totalPrice=0;

    for(var a in getProduct.data!){
      totalPrice+=a.price!;


    }

    return totalPrice;
  }
 int  calculatePrice(){

    int totalPrice=getProduct.data!.fold(0, (previousValue, element) => previousValue+ element.price!);
    return totalPrice;

    ;
  }

  getProductData() {
    // print('object');
    // productBox.put(LocalString.PRICE_BOX,);
    productData.value = PriceModel.fromJson(jsonDecode(jsonEncode(body)));
    productBox.put(LocalString.PRICE_BOX, productData.value);
    print(productBox.get(LocalString.PRICE_BOX)!.data![0].details);

    // productData.value=productBox.get(LocalString.PRICE_BOX)!;
    // print('price    ${productData.value.data![0].price}');
  }

  priceCalculate() {
    // print(jsonEncode(body));
  }
}

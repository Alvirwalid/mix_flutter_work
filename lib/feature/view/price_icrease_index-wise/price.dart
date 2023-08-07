import 'package:firstproject/feature/controller/price_increase_index/price_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
     
      body: Container(
        width:double.infinity,
        child: GetX<PriceController>(
          init: PriceController(),
          initState: (_) {
            _.controller!.getProductData();

          },
          builder: (_) {
            print(_.price.value);
            var itemCount=_.getProduct.data?.length??0;
            return Column(
              children: [
                Container(
                  width:double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text(_.totalPrice().toString()),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Row(

                            children: [
                              Text(_.getProduct.data![index].productName.toString(),),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  ElevatedButton(onPressed: () {
                                    _.increament(index: index);

                                  }, child:Icon(Icons.add)),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10),
                                    child: Container(
                                      child: Text(_.getProduct.data![index].price.toString(),style:TextStyle(color: Colors.white)),
                                    ),
                                  ),

                                  ElevatedButton(onPressed: () {
                                    _.decreament(index: index);

                                  }, child:Icon(Icons.remove)),


                              ],))




                            ],
                          ),




                        ElevatedButton(onPressed: () {

                          print(_.calculatePrice());



                        }, child: Text('Calculate'))

                      ],
                      ),
                    );

                },),
              ],
            );
          }
        ),
      ),
    );
  }
}

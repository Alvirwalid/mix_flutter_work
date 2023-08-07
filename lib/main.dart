import 'package:firstproject/constant/local_string.dart';
import 'package:firstproject/feature/model/price_icrease_index_model/price_model.dart';
import 'package:firstproject/feature/view/price_icrease_index-wise/price.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PriceModelAdapter());
  Hive.registerAdapter(DataAdapter());
 await Hive.openBox<PriceModel>(LocalString.PRICE_BOX);
 //






  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  PricePage(),
    );
  }
}



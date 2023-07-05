import 'package:expences/expences/view/firt_screen.dart';
import 'package:expences/expences/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => HomeScreen(),
        '/first':(p0) => InsertScreen(),
      },
    )
  );
}
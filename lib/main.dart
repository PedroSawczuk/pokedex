import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/views/homePage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

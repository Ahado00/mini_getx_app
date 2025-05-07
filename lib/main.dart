import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'heart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HeartController());

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Big Love to Flutter!',
            style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.pink,),
        body: const Center(child: HeartToggle()),
      )
    );
  }
}

class HeartToggle extends StatelessWidget{
  const HeartToggle({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.find<HeartController>();

    return Obx(()=>IconButton(
      icon: Icon(
        controller.isFavorite.value
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.pink,
        size: 20,
      ),
      onPressed: controller.toggleFavorite,
    ));
  }
}
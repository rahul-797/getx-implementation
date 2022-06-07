import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/image_controller.dart';
import 'package:getx/controllers/increment_controller.dart';
import 'package:getx/controllers/randomTextController.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  final incrementController = Get.put(IncrementController());
  final randomTextController = Get.put(RandomTextController());
  final imageController = Get.put(ImageController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<ImageController>(
                builder: (_) => Image.network("${imageController.url}"),
              ),
              ElevatedButton(
                child: const Text("Generate image"),
                onPressed: () {
                  imageController.urlGenerate();
                },
              ),
              const SizedBox(
                height: 32,
              ),
              GetX<RandomTextController>(
                  builder: (_) => Text("Random : ${randomTextController.randomString}"),
              ),
              ElevatedButton(
                child: const Text("Generate random"),
                onPressed: () {
                  randomTextController.getRandomString(10);
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Obx(
                () => Text(
                  "Floating button pressed ${incrementController.timesPressed} times",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 32),
        onPressed: () {
          incrementController.increment();
        },
      ),
    );
  }
}

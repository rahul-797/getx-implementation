import 'dart:math';
import 'package:get/get.dart';

class ImageController extends GetxController{
  final category = ["car", "house", "beach", "mountain", "desert", "bike", "face"];
  var url = "https://source.unsplash.com/600x600/?mountain";

  String urlGenerate(){
    int random = Random().nextInt(7);
    url = "https://source.unsplash.com/600x600/?${category[random]}";
    update();
    return url;
  }
}
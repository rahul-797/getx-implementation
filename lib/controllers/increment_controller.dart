import 'package:get/get.dart';

class IncrementController extends GetxController{
  var timesPressed = 0.obs;

  void increment(){
    timesPressed++;
  }
}
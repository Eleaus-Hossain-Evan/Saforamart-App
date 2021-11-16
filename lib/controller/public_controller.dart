import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicController extends GetxController {
  RxBool isPhone = true.obs;
  SharedPreferences? preferences;
  RxDouble size = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    iniatializeApp();
  }

  Future<void> iniatializeApp() async {
    preferences = await SharedPreferences.getInstance();
    isPhone(preferences!.getBool('isPhone')!);

    if (isPhone.value) {
      size(MediaQuery.of(Get.context!).size.width);
    } else {
      size(MediaQuery.of(Get.context!).size.height);
    }
    update();
    print('IsPhone: ${isPhone.value}');
    print('Size: ${size.value}');
    print("Data Initialized !!!");
  }

  List<Widget> imageSlider = [
    Image.network(
      'http://saforamart.glamworlditltd.com/admin/slide_show/1636200656282311pexels-photo-3872406.jpeg',
      fit: BoxFit.cover,
    ),
    Image.network(
      'http://saforamart.glamworlditltd.com/admin/slide_show/1636200543174357pexels-photo-1656666.jpeg',
      fit: BoxFit.cover,
    ),
  ];
}

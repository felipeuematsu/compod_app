import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalizationFormText extends Container {
  HospitalizationFormText({required String data}) : super(width: double.infinity, child: Text(data, style: Get.textTheme.bodyText1));
}
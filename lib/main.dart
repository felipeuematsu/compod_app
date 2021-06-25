import 'package:compod_app/commons/app_colors.dart';
import 'package:compod_app/commons/strings.dart';
import 'package:compod_app/forms/views/forms_select_view.dart';
import 'package:compod_app/forms/views/internation_description_view.dart';
import 'package:compod_app/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Strings(),
      locale: Locale('pt', 'BR'),
      title: StringsEnum.COMPOD.name.tr,
      theme: AppColors.theme,
      home: InternationDescriptionView(),
    );
  }
}

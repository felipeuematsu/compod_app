import 'package:compod_app/forms/views/hospitalization_form.dart';
import 'package:compod_app/forms/views/hospitalization_description_view.dart';
import 'package:compod_app/forms/views/hospitalization_select_view.dart';
import 'package:compod_app/forms/views/success_view.dart';
import 'package:compod_app/home/view/home_view.dart';
import 'package:compod_app/mini_book/view/mini_book_view.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Routes {

  static final pages = [
    GetPage(name: RoutesEnum.hospitalization.route, page: () => HospitalizationSelectView()),
    GetPage(name: RoutesEnum.hospitalization_form.route, page: () => HospitalizationForm()),
    GetPage(name: RoutesEnum.hospitalization_description.route, page: () => HospitalizationDescriptionView()),
    GetPage(name: RoutesEnum.hospitalization_success.route, page: () => SuccessView()),
    GetPage(name: RoutesEnum.minibook.route, page: () => MiniBookView()),
    GetPage(name: RoutesEnum.home.route, page: () => HomeView()),
  ];
}

enum RoutesEnum {
  hospitalization,
  hospitalization_success,
  hospitalization_form,
  hospitalization_description,
  minibook,
  home,
}

extension RoutesEnumExt on RoutesEnum {
  String get route => '/${describeEnum(this).replaceAll('_', '/')}';
}
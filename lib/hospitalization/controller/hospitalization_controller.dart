import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compod_app/commons/routes.dart';
import 'package:compod_app/hospitalization/models/hospitalization_form.dart';
import 'package:compod_app/hospitalization/models/hospitalization_type.dart';
import 'package:compod_app/hospitalization/views/components/hospitalization_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HospitalizationController extends GetxController {
  static const collectionId = 'forms';

  var description = ''.obs;
  var name = ''.obs;
  var sexValue = ''.obs;

  var form = HospitalizationForm().obs;

  void setupDescriptionValues(HospitalizationType type) async {
    name.value = type.text;
    final path = 'assets/texts/${type.name}_description.txt';
    description.value = await rootBundle.loadString(path);
  }

  void selectHospitalizationType(HospitalizationType type) {
    setupDescriptionValues(type);
    Get.toNamed(RoutesEnum.hospitalization_description.route);
  }

  void goToFormInput() {
    Get.toNamed(RoutesEnum.hospitalization_form.route);
  }

  void sendForm(GlobalKey<FormState> key) async {
    if ((key.currentState?.validate() ?? false) && sexValue.value != '') {
      FirebaseFirestore.instance
          .collection(collectionId)
          .add(form.value.toJson)
          .then((_) => goToSuccessView())
          .catchError((_, __) => goToFailureView());
    }
  }

  void goToSuccessView() => Get.toNamed(RoutesEnum.hospitalization_success.route);

  void goToFailureView() => null; // TODO Tela do Julio

  void updateFormContent(HospitalizationFormType type, String value) {
    switch (type) {
      case HospitalizationFormType.age:
        form.update((val) => val?.age = int.tryParse(value) ?? 0);
        break;
      case HospitalizationFormType.text:
        form.update((val) => val?.text = value);
        break;
      case HospitalizationFormType.name:
        form.update((val) => val?.name = value);
        break;
      case HospitalizationFormType.email:
        form.update((val) => val?.email = value);
        break;
      case HospitalizationFormType.phone:
        form.update((val) => val?.phone = value);
        break;
      case HospitalizationFormType.job:
        form.update((val) => val?.job = value);
        break;
      case HospitalizationFormType.address:
        form.update((val) => val?.job = value);
        break;
    }
  }
}

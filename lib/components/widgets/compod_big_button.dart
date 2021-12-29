import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompodBigButton extends GetView {
  CompodBigButton({Key? key, required this.action, required this.text, this.image}) : super(key: key);

  final _highlighted = false.obs;

  final String text;
  final String? image;
  final void Function() action;

  static const _size = 100.0;
  static const _imageSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 2, spreadRadius: 2, offset: Offset(0, 2))],
        border: Border.all(color: _highlighted.isTrue ? Get.theme.colorScheme.secondaryVariant : Colors.white.withOpacity(0.6), width: 2),
        borderRadius: BorderRadius.circular(5),
        color: Get.theme.colorScheme.primary,
      ),
      height: _size,
      child: MaterialButton(
          onPressed: action,
          onHighlightChanged: (highlight) => _highlighted.value = highlight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                image != null ?  Image.asset(image ?? '', width: _imageSize, height: _imageSize) : Container(),
                Text(text.toUpperCase(), textAlign: TextAlign.right, style: Get.textTheme.button?.copyWith(color: Colors.white))
              ],
            ),
          )),
    ));
  }
}

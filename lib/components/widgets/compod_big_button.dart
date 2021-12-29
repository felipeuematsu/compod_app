import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompodBigButton extends GetView {
  CompodBigButton({Key? key, required this.action, required this.text, required this.image}) : super(key: key);

  final _highlighted = false.obs;

  final String text;
  final String image;
  final Function action;

  static const _size = 100.0;
  static const _imageSize = 100.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 2, spreadRadius: 2, offset: Offset(0, 2))],
        border: Border.all(color: _highlighted.isTrue ? Get.theme.colorScheme.secondaryVariant : Colors.white.withOpacity(0.6), width: 2),
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(begin: const Alignment(0, 0.4), end: Alignment.bottomCenter, colors: [Get.theme.primaryColor, Get.theme.primaryColorDark]),
      ),
      height: _size,
      child: MaterialButton(
          onPressed: () => action,
          onHighlightChanged: (highlight) => _highlighted.value = highlight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image, width: _imageSize, height: _imageSize),
                Text(text.toUpperCase(), textAlign: TextAlign.right, style: Get.textTheme.button)
              ],
            ),
          )),
    );
  }
}

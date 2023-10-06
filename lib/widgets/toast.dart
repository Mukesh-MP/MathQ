import 'package:flutter/material.dart';
import 'package:get/get.dart';

showToast(
    {String msg = "",
    Color backgroundColor = Colors.red,
    Color textColor = Colors.black}) {
  Get.snackbar(
    animationDuration: Duration(milliseconds: 100),
    "",
    "",
    // maxWidth: 250,
    maxWidth: double.infinity,
    margin: const EdgeInsets.only(
      right: 50,
      left: 50,
    ),
    barBlur: 0,
    overlayBlur: 0,
    backgroundColor: Colors.transparent,
    snackPosition: SnackPosition.BOTTOM,
    messageText: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  msg,
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        )),
  );
}

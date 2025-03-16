import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() async {


  await Get.defaultDialog(
    title: "44".tr, // Translated title
    middleText: "45".tr, // Translated message
    actions: [
      ElevatedButton(
        onPressed: () {

          exit(0); // Close the dialog
        },
        child: Text("46".tr), // Confirm button text
      ),
      ElevatedButton(
        onPressed: () {

          Get.back(); // Close the dialog
        },
        child: Text("47".tr), // Cancel button text
      ),
    ],
  );


}
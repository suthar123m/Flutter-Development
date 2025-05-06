import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateProductDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productDisController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productRatingController = TextEditingController();

  /// Loads the current brand name into the controller
  Future<void> loadDetail(String id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('Products').doc(id).get();

      brandNameController.text = documentSnapshot['BrandName'];
      productCategoryController.text = documentSnapshot['ProductCategoty'];
      productDescriptionController.text =
          documentSnapshot['ProductDescription'];
      productDisController.text = documentSnapshot['ProductDis'];
      productNameController.text = documentSnapshot['ProductName'];
      productPriceController.text = documentSnapshot['ProductPrice'];
      productRatingController.text = documentSnapshot['ProductRating'];
    } catch (e) {
      Get.snackbar('Error', 'Failed to load details: $e');
    }
  }

  /// Updates the brand name in Firestore
  Future<void> updateDetail(String id) async {
    try {
      await _firestore.collection('Products').doc(id).update({
        'BrandName': brandNameController.text,
        'ProductCategoty': productCategoryController.text,
        'ProductDescription': productDescriptionController.text,
        'ProductDis': productDisController.text,
        'ProductName': productNameController.text,
        'ProductPrice': productPriceController.text,
        'ProductRating': productRatingController.text,
      });
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update details: $e');
    }
  }
}

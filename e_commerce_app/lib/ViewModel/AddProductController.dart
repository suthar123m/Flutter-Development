import 'dart:io';

import 'package:e_commerce_app/Service/AddProductService.dart';
import 'package:e_commerce_app/ViewModel/DropDownCategoryController.dart';
import 'package:e_commerce_app/ViewModel/ImagePickerController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addproductcontroller extends GetxController {
  final AddProductService _productService = AddProductService();

  final ImagePickerController imagePickerController = Get.put(
    ImagePickerController(),
  );

  final Dropdowncategorycontroller dropdowncategorycontroller = Get.put(
    Dropdowncategorycontroller(),
  );

  final productNameController = TextEditingController();
  final brandNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDisController = TextEditingController();
  final productRatingController = TextEditingController();
  final productDescriptionController = TextEditingController();

  var isLoading = false.obs;

  Future<void> addProduct() async {
    if (_validateFields()) {
      try {
        isLoading.value = true;

        String imageUrl = await _uploadImageToFirebase(
          imagePickerController.pickedImage.value!,
        );

        // Save product data to Firestore

        await _productService.addProduct(
          productName: productNameController.text.trim(),
          brandName: brandNameController.text.trim(),
          productImage: imageUrl,
          productPrice: productPriceController.text.trim(),
          productDis: productDisController.text.trim(),
          productRating: productRatingController.text.trim(),
          productDescription: productDescriptionController.text.trim(),
          productCategory: dropdowncategorycontroller.selectedValue.value,
        );

        _clearFields();
      } catch (e) {
        Get.snackbar('Error', 'Something went wrong: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        'Missing Fields',
        'Please fill all the fields and pick an image.',
      );
    }
  }

  Future<String> _uploadImageToFirebase(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance
        .ref()
        .child('product_images')
        .child(fileName);
    final uploadTask = await ref.putFile(imageFile);
    return await uploadTask.ref.getDownloadURL();
  }

  bool _validateFields() {
    return productNameController.text.isNotEmpty &&
        brandNameController.text.isNotEmpty &&
        productPriceController.text.isNotEmpty &&
        productDisController.text.isNotEmpty &&
        productRatingController.text.isNotEmpty &&
        productDescriptionController.text.isNotEmpty &&
        imagePickerController.pickedImage.value != null;
  }

  void _clearFields() {
    productNameController.clear();
    brandNameController.clear();
    productPriceController.clear();
    productDisController.clear();
    productRatingController.clear();
    productDescriptionController.clear();
    imagePickerController.pickedImage.value = null;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //? Function for Add Product Details Using Firebase Firestore

  Future<void> addProduct({
    required String productName,
    required String brandName,
    required String productImage,
    required String productPrice,
    required String productDis,
    required String productRating,
    required String productDescription,
    required String productCategory,
  }) async {
    try {
      await _firestore.collection('Products').add({
        'ProductName': productName,
        'BrandName': brandName,
        'ProductImage': productImage,
        'ProductPrice': productPrice,
        'ProductDis': productDis,
        'ProductRating': productRating,
        'ProductDescription': productDescription,
        'ProductCategoty': productCategory,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar(
        'Success',
        'Data added successfully',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add product: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}

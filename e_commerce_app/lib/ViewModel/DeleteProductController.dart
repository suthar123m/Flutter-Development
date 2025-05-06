import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DeleteProductController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteProduct(var id) async {
    try {
      await _firestore.collection('Products').doc(id).delete();
      Get.snackbar('Success', 'Product deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Filed to Delete Product $e');
    }
  }
}

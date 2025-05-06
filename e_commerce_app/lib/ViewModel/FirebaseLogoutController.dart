import 'package:e_commerce_app/Service/FirebaseLogOutService.dart';
import 'package:get/get.dart';

class FirebaseLogoutController extends GetxController {
  FirebaseLogOutService firebaseLogOutService = FirebaseLogOutService();

  Future<void> fetchFirebaseLogout() async {
    await firebaseLogOutService.logoutService();

  }
}

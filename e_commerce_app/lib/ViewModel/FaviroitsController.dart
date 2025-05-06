import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Favoritecontroller extends GetxController {
  var item = <String>[].obs;
  var favotireList = <String>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> itemFetch() async {
    var snapshot = await _firestore.collection('Products').get();
    item.value = snapshot.docs.map((e) => e['ProductName'].toString()).toList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemFetch();
  }

  addFavorite(String items) {
    if (favotireList.contains(items)) {
      favotireList.remove(items);
    } else {
      favotireList.add(items);
    }
    print(favotireList);
  }
}

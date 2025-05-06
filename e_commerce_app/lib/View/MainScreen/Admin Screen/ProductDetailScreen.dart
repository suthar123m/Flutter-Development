import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/View/MainScreen/Admin%20Screen/AddProductDetailsScreen.dart';
import 'package:e_commerce_app/View/MainScreen/Admin%20Screen/UpdateDetailScreen.dart';
import 'package:e_commerce_app/ViewModel/DeleteProductController.dart';
import 'package:e_commerce_app/ViewModel/FirebaseLogoutController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DeleteProductController deleteProductController = Get.put(
    DeleteProductController(),
  );

  FirebaseLogoutController firebaseLogoutController = Get.put(
    FirebaseLogoutController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 1),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No products found."));
          }

          final products = snapshot.data!.docs;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Slidable(
                key: Key(product.id),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        deleteProductController.deleteProduct(product.id);
                      },
                      icon: Icons.delete,
                      label: 'Delete',
                      backgroundColor: Colors.red,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        Get.to(() => Updatedetailscreen(id: product.id));
                      },
                      icon: Icons.edit,
                      label: 'Edit',
                      backgroundColor: Colors.blue.shade100,
                    ),
                  ],
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: product['ProductImage'] ?? '',
                              placeholder:
                                  (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.grey,
                                    ),
                                  ),
                              errorWidget:
                                  (context, url, error) =>
                                      const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['ProductName'] ?? 'No Name',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text('Brand : ${product['BrandName'] ?? 'N/A'}'),
                              Text(product['ProductDescription'] ?? 'N/A'),
                              Text(
                                "Category: ${product['ProductCategoty'] ?? 'N/A'}",
                              ),
                              Text(
                                "Price: ₹ ${product['ProductPrice'] ?? 'N/A'}",
                              ),
                              Text(
                                "Discount: ${product['ProductDis'] ?? 'N/A'} %",
                              ),
                              Text(
                                "Rating: ${product['ProductRating'] ?? 'N/A'} ⭐",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.grey,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: 'Product Add',
            onTap: () {
              Get.to(() => const AddProductDetailsScreen());
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.logout),
            label: 'LogOut',
            onTap: () {
              firebaseLogoutController.fetchFirebaseLogout();
            },
          ),
        ],
      ),
    );
  }
}

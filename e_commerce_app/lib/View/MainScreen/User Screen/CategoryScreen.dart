import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/View/MainScreen/User%20Screen/Detail%20Screen/DetailScreen.dart';
import 'package:e_commerce_app/ViewModel/CategoryProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Categoryscreen extends StatefulWidget {
  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  final CategoryProductController categoryProductController = Get.put(
    CategoryProductController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              child: Obx(() {
                return ListView.builder(
                  itemCount: categoryProductController.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var category = categoryProductController.categories[index];
                    bool isSelected =
                        categoryProductController.selectedCategory.value ==
                        category;
                    return GestureDetector(
                      onTap: () {
                        categoryProductController.selectCategory(category);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.orangeAccent : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Divider(),
            Expanded(
              child: Obx(() {
                if (categoryProductController.products.isEmpty) {
                  return Center(child: Text('No products found.'));
                }
                return ListView.builder(
                  itemCount: categoryProductController.products.length,
                  itemBuilder: (context, index) {
                    var product = categoryProductController.products[index];
                    return
                    //   ListTile(
                    //   title: Text(product['BrandName']),
                    //   subtitle: Text('₹ ${product['ProductPrice']}'),
                    // );
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                                () => Detailscreen(
                              productImage: product['ProductImage'],
                              brandName: product['BrandName'],
                              productName: product['ProductName'],
                              productCategory: product['ProductCategoty'],
                              productDescription: product['ProductDescription'],
                              productDis: product['ProductDis'],
                              productPrice: product['ProductPrice'],
                              productRating: product['ProductRating'],
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: product['ProductImage'],
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: 130,
                                        height: 130,
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
                              SizedBox(width: 10),
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
                                    Text(
                                      'Brand : ${product['BrandName'] ?? 'N/A'}',
                                    ),
                                    Text(
                                      "Category: ${product['ProductCategoty'] ?? 'N/A'}",
                                    ),
                                    Text(
                                      "Price: ₹ ${product['ProductPrice'] ?? 'N/A'}",
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}

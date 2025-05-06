import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/View/MainScreen/User%20Screen/Detail%20Screen/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';


class Homescreen extends StatefulWidget {
  String username;

  Homescreen({super.key, required this.username});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> categoryImage = [
    'assets/images/man.png',
    'assets/images/woman.png',
    'assets/images/child.png',
    'assets/images/Electronics.png',
    'assets/images/Fashion.png',
    'assets/images/Grocery.png',
    'assets/images/Sports.png',
    'assets/images/Home.png',
  ];

  List<String> categoryText = [
    'Man',
    'Woman',
    'Child',
    'Electronics',
    'Fashion',
    'Grocery',
    'Sports',
    'Home',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(image: AssetImage('assets/images/AppLogo.png')),
          ),
        ),
        title: Text('Hi, ${widget.username}', style: TextStyle(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New Collection',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '20%OFF',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Image(
                        image: AssetImage('assets/images/model.png'),
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text('All Products',textAlign: TextAlign.left,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)))
            ),
            SizedBox(height: 10),
            Divider(),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No Products Found'));
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                              () =>
                              Detailscreen(
                                productImage: data['ProductImage'],
                                brandName: data['BrandName'],
                                productName: data['ProductName'],
                                productCategory: data['ProductCategoty'],
                                productDescription: data['ProductDescription'],
                                productDis: data['ProductDis'],
                                productPrice: data['ProductPrice'],
                                productRating: data['ProductRating'],
                              ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    imageUrl: data['ProductImage'],
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
                                      data['ProductName'] ?? 'No Name',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Brand : ${data['BrandName'] ?? 'N/A'}',
                                    ),
                                    Text(
                                      "Category: ${data['ProductCategoty'] ??
                                          'N/A'}",
                                    ),
                                    Text(
                                      "Price: ₹ ${data['ProductPrice'] ?? 'N/A'}",
                                    ),
                                    Text(
                                      "Rating: ${data['ProductRating'] ??
                                          'N/A'} ⭐",
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
          ],
        ),
      ),
    );
  }
}

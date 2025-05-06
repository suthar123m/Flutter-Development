import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Detailscreen extends StatefulWidget {
  String productImage;
  String brandName;
  String productName;
  String productCategory;
  String productDescription;
  String productDis;
  String productPrice;
  String productRating;

  Detailscreen({
    required this.productImage,
    required this.brandName,
    required this.productName,
    required this.productCategory,
    required this.productDescription,
    required this.productDis,
    required this.productPrice,
    required this.productRating,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: widget.productImage,
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
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        widget.brandName,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      SizedBox(width: 20),
                      Text('⭐${widget.productRating}'),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.productName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '\u20B9 ${widget.productPrice}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red.shade900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.productDescription,
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

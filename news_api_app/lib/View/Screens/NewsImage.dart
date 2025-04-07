import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsImage extends StatelessWidget {
  String urlToImage;

  NewsImage({super.key, required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: urlToImage ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return const Center(
                            child: CircularProgressIndicator(strokeWidth: 1));
                      },
                      errorWidget: (context, url, error) {
                        return const Image(
                            image: NetworkImage(
                                'https://img.freepik.com/premium-vector/3d-picture-photo-design-icon-social-media-search_135323-438.jpg?uid=R194519248&ga=GA1.1.1947139167.1712677315&semt=ais_hybrid'),
                            fit: BoxFit.contain);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 40,
              right: 10,
              child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('X',
                      style: TextStyle(fontSize: 20, color: Colors.white))))
        ],
      ),
    );
  }
}

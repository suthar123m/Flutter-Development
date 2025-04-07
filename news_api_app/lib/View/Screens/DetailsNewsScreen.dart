import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/View/Screens/NewsImage.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailsnewsscreen extends StatefulWidget {
  String author, title, description, url, urlToImage;

  Detailsnewsscreen(
      {super.key,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage});

  @override
  State<Detailsnewsscreen> createState() => _DetailsnewsscreenState();
}

class _DetailsnewsscreenState extends State<Detailsnewsscreen> {
  void _launchWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Detail News')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            //  Image of News

            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => NewsImage(urlToImage: widget.urlToImage));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.urlToImage ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return const Center(
                          child: CircularProgressIndicator(strokeWidth: 1));
                    },
                    errorWidget: (context, url, error) {
                      return const Image(
                          image: NetworkImage(
                              'https://img.freepik.com/premium-vector/3d-picture-photo-design-icon-social-media-search_135323-438.jpg?uid=R194519248&ga=GA1.1.1947139167.1712677315&semt=ais_hybrid'),
                          fit: BoxFit.cover);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Title

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),

            // Author

            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(widget.author ?? '',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15, color: Colors.blue))),
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 10),

            // Description label

            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text('Description',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500))),
            const SizedBox(height: 10),

            // Description Text

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(widget.description != null ? widget.description : ''),
            ),
            const SizedBox(height: 10),

            // Url for go to Direct on website

            Row(
              children: [
                Text('For More Details..  '),
                GestureDetector(
                  onTap: () {
                    _launchWebsite(widget.url);
                  },
                  child: Text(
                    'Press Here',
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/Controller/NewsModelController.dart';
import 'package:news_api_app/View/Screens/DetailsNewsScreen.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  NewsModelController newsModelController = Get.put(NewsModelController());


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: newsModelController.fetchnewscontroller(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(strokeWidth: 1));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error..'));
          }
          return Obx(
            () {
              var newsModelData = newsModelController.newsModelList;
              if (newsModelData.isEmpty) {
                return Center(child: Text('No Data..'));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: newsModelData.length,
                itemBuilder: (context, index) {
                  var newsData = newsModelData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Detailsnewsscreen(
                            author: '${newsData.author}',
                            title: '${newsData.title}',
                            description: '${newsData.description}',
                            url: '${newsData.url}',
                            urlToImage: '${newsData.urlToImage}'));
                      },

                      // Image of News

                      child: SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: newsData.urlToImage != null
                                      ? '${newsData.urlToImage}'
                                      : '',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return const Center(
                                        child: CircularProgressIndicator(
                                            strokeWidth: 1));
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
                            SizedBox(width: 10),

                            // News Title and Author

                            SizedBox(
                              height: 150,
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Text('${newsData.title}')),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        newsData.author != null
                                            ? '${newsData.author}'
                                            : '',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

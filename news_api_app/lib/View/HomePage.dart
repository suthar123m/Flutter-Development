import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_api_app/Controller/NewsHeadlineModelController.dart';
import 'package:news_api_app/View/CategoryNewsPage.dart';
import 'package:news_api_app/View/NewsPage.dart';
import 'package:news_api_app/View/Screens/DetailsNewsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum FilterList { TheTimesOfIndia, TheHindu, BCCNews, CNN, ViceNews }

class _HomePageState extends State<HomePage> {
  NewsHeadlineModelController newsHeadlineModelController =
  Get.put(NewsHeadlineModelController());

  FilterList? selectedMenu;
  String name = 'the-times-of-india';

  String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  List<String> CategoryList = [
    'general',
    'entertainment',
    'health',
    'sports',
    'business',
    'technology',
    'science'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('NEWS', style: TextStyle(letterSpacing: 3)),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 1,
        actions: [
          // Popup Menu Button for Select News Chanel

          PopupMenuButton<FilterList>(
              initialValue: selectedMenu,
              onSelected: (FilterList item) {
                if (FilterList.TheTimesOfIndia.name == item.name) {
                  name = 'the-times-of-india';
                }
                if (FilterList.TheHindu.name == item.name) {
                  name = 'the-hindu';
                }
                if (FilterList.BCCNews.name == item.name) {
                  name = 'bbc-news';
                }
                if (FilterList.CNN.name == item.name) {
                  name = 'cnn';
                }
                if (FilterList.ViceNews.name == item.name) {
                  name = 'vice-news';
                }
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<FilterList>>[
                PopupMenuItem<FilterList>(
                    value: FilterList.TheTimesOfIndia,
                    child: Text('The Times of India')),
                PopupMenuItem<FilterList>(
                    value: FilterList.TheHindu, child: Text('The Hindi')),
                PopupMenuItem<FilterList>(
                    value: FilterList.BCCNews, child: Text('BCC News')),
                PopupMenuItem<FilterList>(
                    value: FilterList.CNN, child: Text('CNN News')),
                PopupMenuItem<FilterList>(
                    value: FilterList.ViceNews, child: Text('Vice News')),
              ])
        ],
      ),

      // Navigation Drawer

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Text('Category',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500))),
              ),
              SizedBox(height: 20),
              Divider(indent: 14, endIndent: 14),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: CategoryList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          Get.back();
                          Get.to(() =>
                              CategoryNewsPage(
                                categoryName: CategoryList[index],
                              ));
                        },
                        title: Text(CategoryList[index]));
                  },
                ),
              )
            ],
          ),
        ),
      ),

      // Body

      body: FutureBuilder(
        future: newsHeadlineModelController.fetchnewsheadlinecontroller(name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: SpinKitCubeGrid(color: Colors.blueGrey));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error..'));
          }
          return Obx(
                () {
              print('GetX Controller Called');
              var newsHeadlineData =
                  newsHeadlineModelController.newsHeadlineControllerList;
              if (newsHeadlineData.isEmpty) {
                return Center(child: Text('No Data..'));
              }

              // Page of whole News

              return SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                'Top Headlines..',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(currentDate, style: TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: newsHeadlineData.length,
                            itemBuilder: (context, index) {
                              var newsData = newsHeadlineData[index];
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        Detailsnewsscreen(
                                            author: '${newsData.author}',
                                            title: '${newsData.title}',
                                            description: '${newsData
                                                .description}',
                                            url: '${newsData.url}',
                                            urlToImage: '${newsData
                                                .urlToImage}'));
                                  },

                                  // Image of News

                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 180,
                                        width: 310,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            newsData.urlToImage != null
                                                ? '${newsData.urlToImage}'
                                                : '',
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) {
                                              return const Center(
                                                  child:
                                                  CircularProgressIndicator(
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
                                      const SizedBox(height: 20),

                                      // News title and Author

                                      SizedBox(
                                        height: 90,
                                        width: 310,
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                                child: Text('${newsData.title}',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                        FontWeight.w500))),
                                            SizedBox(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                  newsData.author != null
                                                      ? '${newsData.author}'
                                                      : '',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blue)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width,
                            child: Text('Today News..',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        const SizedBox(height: 10),

                        // Navigate data form NewsPage

                        Newspage()
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

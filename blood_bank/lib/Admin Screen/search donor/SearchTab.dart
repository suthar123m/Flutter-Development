import 'package:blood_bank/Admin%20Screen/search%20donor/searchBloodBankList.dart';
import 'package:blood_bank/Admin%20Screen/search%20donor/searchDonerList.dart';
import 'package:flutter/material.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({super.key});

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Blood Bank and Doner Detail'),
          bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue[900],
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text('Donner'),
                ),
                Tab(
                  child: Text('Blood bank'),
                )
              ]),
        ),
        body: TabBarView(
            children: [SearchDonerListScreen(), SearchBloodBankListScreen()]),
      ),
    );
  }
}

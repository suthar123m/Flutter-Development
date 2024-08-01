import 'package:blood_bank/User%20Screen/screen/RequestScreen.dart';
import 'package:blood_bank/Admin%20Screen/search%20donor/SearchTab.dart';
import 'package:blood_bank/User%20Screen/screen/ShowRequest.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Text(
                'User Page',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text(
                              'This Option Only for Admin\nWho add Doner Detail'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'))
                          ],
                        );
                      },
                    );
                  },
                  child: const Card(
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add,
                          size: 50,
                          color: Color.fromARGB(255, 10, 42, 90),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Add Doner',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchTabScreen(),
                        ));
                  },
                  child: const Card(
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 50,
                          color: Color.fromARGB(255, 10, 42, 90),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Search Doner',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestScreen(),
                        ));
                  },
                  child: const Card(
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop_rounded,
                          size: 50,
                          color: Color.fromARGB(255, 10, 42, 90),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Request Add',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowRequestScreen(),
                        ));
                  },
                  child: const Card(
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_damage_outlined,
                          size: 50,
                          color: Color.fromARGB(255, 10, 42, 90),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'show Request',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

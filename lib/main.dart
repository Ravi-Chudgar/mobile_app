import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_1/Search.dart';
import 'package:test_1/addDetailes.dart';
import 'package:test_1/final_search.dart';

import 'databasehelper.dart';

import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
    );
  }
}

// ignore: camel_case_types
class homepage extends StatefulWidget {
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  final dbhelper = Databasehelper.instance;

  @override
  void initState() {
    super.initState();
  }

  _getr() async {
    var data = await dbhelper.getK();
    for (int i = 0; i < data.length; i++) {
      print(data[i]);
    }
  }

  @override
  Widget build(BuildContext zcontext) {
    // return Scaffold(
    //   body: Container(
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: new Container(
    //             padding: EdgeInsets.fromLTRB(80.0, 80.0, 45.0, 0.0),
    //             child: Column(
    //               children: [
    //                 Row(
    //                   children: [
    //                     Material(
    //                       elevation: 10.0,
    //                       color: Colors.blue,
    //                       shadowColor: Colors.greenAccent,
    //                       borderRadius: BorderRadius.circular(20.0),
    //                       child: GestureDetector(
    //                         onTap: () {
    //                           // _getr();
    //                           // getData();
    //                           // getData1();
    //                           // DeleteData();
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => AddDetailes()));
    //                         },
    //                         child: Icon(
    //                           Icons.add_circle_outline,
    //                           size: 90,
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 60.0,
    //                     ),
    //                     Expanded(
    //                       child: Container(
    //                         // padding: EdgeInsets.all(4.0),
    //                         child: Text(
    //                           "NEW CUSTOMER",
    //                           style: TextStyle(
    //                               fontSize: 30.0, fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 20.0,
    //                     ),
    //                     Material(
    //                       elevation: 10.0,
    //                       color: Colors.blue,
    //                       shadowColor: Colors.blueAccent,
    //                       borderRadius: BorderRadius.circular(20.0),
    //                       child: GestureDetector(
    //                         onTap: () {
    //                           // ListView.builder(itemBuilder: dbhelper.getName("name"));

    //                           Navigator.pushAndRemoveUntil(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => final_search()),
    //                               (route) => false);
    //                         },
    //                         child: Container(
    //                           child: Column(
    //                             children: [
    //                               Icon(
    //                                 Icons.search,
    //                                 size: 90.0,
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Text(
    //                         "SEARCH",
    //                         style: TextStyle(
    //                             fontSize: 30.0, fontWeight: FontWeight.bold),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           child: new Container(
    //             padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
    //             child: Column(
    //               children: [
    //                 SizedBox(
    //                   height: 60.0,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                // padding: EdgeInsets.fromLTRB(10.0, 120.0, 10.0, 10.0),
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage("assets/jay.jpeg"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GridTile(
                          child: Container(
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.add_box_outlined,
                                      size: 60.0,
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => AddDetailes()),
                                          (route) => false);
                                    }),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Text(
                                  "NEW CUSTOMER",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: GridTile(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.search,
                                size: 70.0,
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => final_search()),
                                    (route) => false);
                              }),
                          SizedBox(
                            width: 50.0,
                          ),
                          Text(
                            "SEARCH........",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

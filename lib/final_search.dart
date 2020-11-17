import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_1/detailes.dart';
import 'package:test_1/main.dart';

import 'databasehelper.dart';

final dbhelper = Databasehelper.instance;

class final_search extends StatefulWidget {
  final_searchState createState() => final_searchState();
}

class final_searchState extends State<final_search> {
  final name = new TextEditingController();
  List<Map> res;
  List<Map> nameF;
  List customer = [];
  List<Customer> c;
  List filterName = [];
  var nam;
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 90.0, 10.0, 10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20.0)),
                fillColor: Colors.white,
                hintText: "Search with First Letter",
                labelText: "SEARCH.........",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  nam = value;
                });
              },
              controller: name,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                child: FutureBuilder(
                  future: dbhelper.search(nam),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      c = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: c == null ? 0 : c.length,
                        itemBuilder: (context, index) {
                          Customer c1 = c[index];
                          var r = c1.name;
                          return SingleChildScrollView(
                            child: Card(
                              elevation: 10.0,
                              child: ListTile(
                                title: Text(c1.name),
                                trailing: IconButton(
                                    icon: Icon(
                                      Icons.forward,
                                      size: 40.0,
                                      color: Colors.blue[700],
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => detailes(
                                                    name: c1.name,
                                                  )),
                                          (route) => false);
                                    }),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
          padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 1.0),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 10.0,
            shadowColor: Colors.grey,
            color: Colors.grey[300],
            child: IconButton(
              icon: Icon(
                Icons.home,
                size: 40.0,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                    (route) => false);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<Widget> getData(String name) async {}

// Widget getData(String name) {
//   print(name);
//   return ListView.builder(
//     itemCount: name.length,
//     itemBuilder: (context, index) {
//       return Text(
//         name[index],
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//       );
//     },
//   );
// return ListView.builder(
//   itemCount: n.length,
//   itemBuilder: (context, index) {
//     return Card(
//       child: ListTile(
//         title: Text(n[index]),
//         trailing: IconButton(
//           icon: Icon(Icons.forward),
//           onPressed: (null),
//         ),
//       ),
//     );
//   },
// );
// }

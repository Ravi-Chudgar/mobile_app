import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_1/detailes.dart';

// import 'package:measurement_app/detailes.dart';
// import 'package:measurement_app/main.dart';
import 'databasehelper.dart';
import 'package:test_1/main.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class Search extends StatefulWidget {
  _searchState createState() => _searchState();
}

class _searchState extends State<Search> {
  final dbhelper = Databasehelper.instance;
  final name = new TextEditingController();
  // List<Customer> cn;
  var allNmaes = [];
  var items = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper.GetDname(name.text).then((value) {
      setState(() {
        allNmaes = value;
        items = allNmaes;
      });
    });
  }

  // void FilterSearch(String q) async {
  //   var dummySearchList = allNmaes;
  //   if (q.isEmpty) {
  //     var DummyListData = List();
  //     DummyListData.forEach((element) {
  //       var n = dbhelper.GetDname(q.toLowerCase());
  //       DummyListData.add(n);
  //     });
  //     setState(() {
  //       items = [];
  //       items.addAll(items);
  //     });
  //   }
  // }

  void getData() async {
    var dat = await dbhelper.getCustomer(name.text.toLowerCase());
    if (dat.length == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => detailes(
                    name: name.text,
                  )),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "NAME ALERT ",
                style: TextStyle(fontSize: 30.0, color: Colors.yellow),
              ),
              content: Text(
                "NO DATA WITH  NAME ${name.text}",
                style: TextStyle(fontSize: 40.0),
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    print("clicked ");

                    Navigator.pop(context);
                  },
                  child: Text("RETRY "),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List d = dbhelper.check(name.text);
    // print(d);
    // TODO: implement build
    // return Scaffold(
    //     body: Container(
    //   padding: EdgeInsets.fromLTRB(10.0, 150.0, 20.0, 10.0),
    //   child: Column(
    //     children: <Widget>[
    //       TextField(
    //         onChanged: (value) {
    //           setState(() {
    //             return dbhelper.GetDname(name.text);
    //           });
    //         },
    //         controller: name,
    //         decoration: InputDecoration(
    //             hintText: "SEARCH WIHT LETTER ",
    //             labelText: "Search..........",
    //             prefixIcon: Icon(Icons.search),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(20.0),
    //             )),
    //       ),
    //       Expanded(
    //           child: FutureBuilder(
    //         future: dbhelper.GetDname(name.text),
    //         builder: (context, snapshot) {
    //           if (!snapshot.hasData) {
    //             return CircularProgressIndicator();
    //           } else {
    //             List cn = snapshot.data;
    //             return ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: cn == null ? 0 : cn.length,
    //               itemBuilder: (context, index) {
    //                 Customer d = cn[index];
    //                 return Card(
    //                   child: ListTile(
    //                     title: Text(d.name),
    //                     trailing: Column(
    //                       children: [
    //                         Expanded(
    //                           child: IconButton(
    //                               icon: Icon(
    //                                 Icons.forward,
    //                                 size: 20.0,
    //                               ),
    //                               onPressed: null),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               },
    //             );
    //           }
    //         },
    //       ))
    //     ],
    //   ),
    // ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                child: Column(
                  children: [
                    Form(
                        child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER NAME"),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          // Expanded(
                          //   child: ListView.builder(
                          //     itemCount: allNmaes.length,
                          //     itemBuilder: (context, index) {
                          //       Customer c = allNmaes[index];
                          //       return Card(
                          //         child: ListTile(
                          //           title: Text(c.name),
                          //           trailing: Column(
                          //             children: [
                          //               Expanded(
                          //                   child: Icon(
                          //                 Icons.forward,
                          //                 size: 20,
                          //               ))
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            height: 60.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blueAccent,
                              color: Colors.blue,
                              elevation: 10.0,
                              child: GestureDetector(
                                onTap: () async {
                                  getData();
                                  print("CLICK");
                                },
                                child: Text(
                                  "SEARCH",
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 0.0),
                      // color: Colors.blueGrey,
                      // height: 20.0,
                      child: Material(
                        elevation: 10.0,
                        color: Colors.blue,
                        shadowColor: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homepage()),
                                (route) => false);
                          },
                          child: Icon(
                            Icons.home,
                            size: 90.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

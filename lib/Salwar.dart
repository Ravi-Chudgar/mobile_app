import 'package:flutter/material.dart';
import 'package:test_1/databasehelper.dart';
import 'package:test_1/main.dart';

// ignore: camel_case_types
class salwar extends StatefulWidget {
  final String name;
  salwar({Key key, this.name}) : super(key: key);
  _salwarState createState() => _salwarState();
}

// ignore: camel_case_types
class _salwarState extends State<salwar> {
  Pant pant;
  final dbhelper = Databasehelper.instance;
  final length = new TextEditingController();
  final waist = new TextEditingController();
  final seat = new TextEditingController();
  final thigh = new TextEditingController();
  final knee = new TextEditingController();
  final bottom = new TextEditingController();
  final fock = new TextEditingController();
  // String nam = widget.name;

  _addData() async {
    if (pant == null) {
      Pant pt = new Pant(
          sname: widget.name.toLowerCase(),
          slength: length.text,
          swaist: waist.text,
          sseat: seat.text,
          thigh: thigh.text,
          knee: knee.text,
          bottom: bottom.text,
          fock: fock.text);

      dbhelper.insertPant(pt).then((value) {
        print("DATA INSETERD ");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => homepage()),
            (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 20.0),
          child: Column(
            children: [
              Text(
                "ENTER TEH DETAILES FOR THE PANT ${widget.name}",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: length,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER LENGTH"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: waist,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER WAIST"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: seat,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER SEAT"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: thigh,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER THIGH"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: knee,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER KNEE"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: bottom,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER BOTTOM"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: fock,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER FOCK"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    height: 80.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          print("CLCIK");
                          _addData();
                        },
                        child: Center(
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

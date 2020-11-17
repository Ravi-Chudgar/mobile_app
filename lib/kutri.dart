import 'package:flutter/material.dart';
import 'package:test_1/Salwar.dart';
import 'package:test_1/databasehelper.dart';

// ignore: camel_case_types
class kurta extends StatefulWidget {
  final String name;
  kurta({Key key, this.name}) : super(key: key);
  _kurtaState createState() => _kurtaState();
}

class _kurtaState extends State<kurta> {
  final dbhelper = Databasehelper.instance;
  KurtiDetails kurtidetails;
  final tucks = new TextEditingController();
  final waistLength = new TextEditingController();
  final length = new TextEditingController();
  final chest = new TextEditingController();
  final upper_chest = new TextEditingController();
  final waist = new TextEditingController();
  final seat = new TextEditingController();
  final halfsleeve = new TextEditingController();
  final sleeve34 = new TextEditingController();
  final fullsleeve = new TextEditingController();
  final neck = new TextEditingController();
  final sideslit = new TextEditingController();
  final shoulder = new TextEditingController();
  final arms = new TextEditingController();
  _addData() async {
    if (kurtidetails == null) {
      KurtiDetails kd = new KurtiDetails(
          name: widget.name.toLowerCase(),
          tuck: tucks.text,
          waistLen: waistLength.text,
          length: length.text,
          chest: chest.text,
          upper_chest: upper_chest.text,
          waist: waist.text,
          seat: seat.text,
          sleee_half: halfsleeve.text,
          sleeve_34: sleeve34.text,
          sleev_full: fullsleeve.text,
          neck: neck.text,
          shoulder: shoulder.text,
          arms: arms.text,
          sideslit: sideslit.text);
      dbhelper.insertKurti(kd).then((value) {
        print("DATA INSERTED ");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => salwar(name: widget.name)),
            (route) => false);
      });
    }
  }

  Widget build(BuildContext context) {
    var nam = widget.name;
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 30.0),
        child: Column(
          children: [
            Text(
              "ENTER THE DETAILES FOR THE ${widget.name}",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: tucks,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER TUCK's POINT "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: waistLength,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER WAIST LENGTH "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: length,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER  LENGTH "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: chest,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER CHEST "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: upper_chest,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER UPPER CHEST "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
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
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: seat,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER SEAT "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: shoulder,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER SHOULDER "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: arms,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER ARMS HOLDER "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: neck,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER NECK "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: sideslit,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER SIDE SLIT "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(150.0, 0.0, 0.0, 0.0),
                              child: Column(
                                children: [
                                  Text(
                                    "SLEEVE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: halfsleeve,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER HALF "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: sleeve34,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER 3/4 "),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: fullsleeve,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        labelText: "ENTER FULL "),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(80.0, 0.0, 0.0, 0.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        _addData();
                      },
                      child: Center(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                "SAVE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "ADD SALWAR DETAILS",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_1/Search.dart';
import 'package:test_1/databasehelper.dart';
// import 'package:measurement_app/kutri.dart';

import 'package:sqflite/sqflite.dart';
import 'package:test_1/kutri.dart';

class AddDetailes extends StatefulWidget {
  _AddDetailesState createState() => _AddDetailesState();
}

class _AddDetailesState extends State<AddDetailes> {
  final dbhelper = Databasehelper.instance;

  void _ShowDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "NAME ALERT",
            style: TextStyle(color: Colors.yellow),
          ),
          content: new Text(
            "RETRY WITH DIFFERENT NAME",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("RETRY"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  Customer customer;
  List<Customer> c1;

  @override
  Widget build(BuildContext context) {
    final nam = new TextEditingController();
    final addres = new TextEditingController();
    final dat = new TextEditingController();
    final phonenumber = new TextEditingController();
    final note = new TextEditingController();

    _addDetails() async {
      // if (formKey.currentState.validate()) {
      if (customer == null) {
        Customer cus = new Customer(
            name: nam.text,
            address: addres.text,
            date: dat.text,
            phone: phonenumber.text,
            notes: note.text);
        var res = await dbhelper.check(nam.text.toLowerCase());
        if (res.length == 1) {
          showDialog(
              context: context,
              child: AlertDialog(
                title: Text(
                  "NAME ALERT",
                  style: TextStyle(color: Colors.yellow, fontSize: 30.0),
                ),
                content: Text(
                  "NAME ALLREADY THEIR IN DATABASE SO RETRY WITH DIFFERENT NAME",
                  style: TextStyle(fontSize: 30.0),
                ),
                actions: [
                  Material(
                    elevation: 10.0,
                    color: Colors.blue,
                    shadowColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "RETRY",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  )
                ],
              ));
        } else {
          dbhelper.insertCustomer(cus);
          print("DATA ADDED TO TABLE ");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => kurta(name: nam.text)),
              (route) => false);
        }
      }
      // }
    }

    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            new Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nam,
                            validator: (val) => val.isNotEmpty
                                ? null
                                : " NAME CAN NOT BE EMPTY",
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER NAME "),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: addres,
                            validator: (value) => value.isNotEmpty
                                ? null
                                : "ADDRESS CAN NOT BE EMPTY",
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER ADDDRESS"),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: dat,
                            validator: (value) => value.isNotEmpty
                                ? null
                                : "DATE CAN NOT BE EMPTY",
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER DATE"),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: phonenumber,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER PHONE NUMBER"),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              var phone = phonenumber.text;

                              if (phone.length != 10) {
                                return "Enter 10 digit monile number";
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: note,
                            validator: (value) => value.isNotEmpty
                                ? null
                                : "NOTES CAN NOT BE EMPTY",
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER NOTES"),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            height: 40.0,
                            // width: 30.0,
                            child: Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.green,
                              child: GestureDetector(
                                onTap: () async {
                                  // insertData();
                                  _addDetails();
                                  print("CLCIK");
                                },
                                child: Text("ADD KURTI DETAILS ",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

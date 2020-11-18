import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_1/Search.dart';
import 'package:test_1/databasehelper.dart';
import 'package:test_1/final_search.dart';
import 'package:test_1/main.dart';

import 'package:sqflite/sqflite.dart';

class detailes extends StatefulWidget {
  final String name;
  detailes({Key key, this.name}) : super(key: key);
  _detailesState createState() => _detailesState();
}

class _detailesState extends State<detailes> {
  final db = Databasehelper.instance;
  Future getData;
  List<Customer> customer;
  List<KurtiDetails> kd;
  List<Pant> pt;
  Customer c;
  Pant p;
  KurtiDetails k;
  List cu, pd, ku;
  final dbref = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // db = Databasehelper.instance;
    // Databasehelper db = Databasehelper.instance.Databse;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 50.0, 10.0, 10.0),
            child: Column(children: [
              SizedBox(
                height: 30.0,
              ),
              Text(
                "DETAILES OF CUSTOMER ARE ",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              // _getData(),
              // ignore: missing_required_param
              //getting name details
              SingleChildScrollView(
                child: FutureBuilder(
                  future: db.getCustomer(widget.name.toLowerCase()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      customer = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: customer == null ? 0 : customer.length,
                        itemBuilder: (context, index) {
                          c = customer[index];
                          // cu.add(c);
                          // cu.add(customer[index]);
                          return SingleChildScrollView(
                            child: Card(
                              elevation: 5.0,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "NAME IS   :${c.name}",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "ADDRESS IS   :${c.address}",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "DATE         :${c.date}",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "PHONE NUMBER   :${c.phone}",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "NOTES   :${c.notes}",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Material(
                                      elevation: 10.0,
                                      color: Colors.blue,
                                      shadowColor: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          TextEditingController note;
                                          note = TextEditingController(
                                              text: c.notes);
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "EDIT RECORD ",
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                content: Container(
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller: note,
                                                        // initialValue: c.notes,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER NOTES"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  Material(
                                                    elevation: 10.0,
                                                    color: Colors.blue,
                                                    shadowColor:
                                                        Colors.blueAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Customer ctp =
                                                            new Customer(
                                                                name: c.name,
                                                                address:
                                                                    c.address,
                                                                date: c.date,
                                                                phone: c.phone,
                                                                notes:
                                                                    note.text);
                                                        var res =
                                                            db.uodateCustomer(
                                                                ctp);
                                                        dbref
                                                            .child("/" +
                                                                "${widget.name}/0")
                                                            .update(
                                                                ctp.toMap());

                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Text("UPDATE"),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "UPDATE ",
                                          style: TextStyle(fontSize: 20.0),
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
                    }
                    return new CircularProgressIndicator();
                  },
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              // getting kurti details
              SingleChildScrollView(
                child: FutureBuilder(
                  future: db.getKurit(widget.name.toLowerCase()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      kd = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: kd == null ? 0 : kd.length,
                        itemBuilder: (context, index) {
                          k = kd[index];
                          return Card(
                            elevation: 5.0,
                            child: Container(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("KURTI DETAIL",
                                      style: TextStyle(
                                        fontSize: 30.0,
                                      )),
                                  Text(
                                    "Tuck's Point      :${k.tuck}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Waist Length      :${k.waistLen}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Length            :${k.length}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Upper Chest             :${k.upper_chest}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Chest             :${k.chest}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Waist             :${k.waist}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Seat              :${k.seat}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Arm Holder         :${k.arms}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Shoulder         :${k.shoulder}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Neck             :${k.neck}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Side Slit       :${k.sideslit}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 120.0,
                                      ),
                                      Center(
                                        child: Text(
                                          "SLEEVE ",
                                          style: TextStyle(fontSize: 20.0),
                                          // textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "HALF    :${k.sleee_half}",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "3/4     :${k.sleeve_34}",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "FULL    :${k.sleev_full}",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Material(
                                    elevation: 10.0,
                                    color: Colors.blue,
                                    shadowColor: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        TextEditingController tuck,
                                            wl,
                                            l,
                                            c,
                                            w,
                                            s,
                                            sh,
                                            shalf,
                                            s34,
                                            sfull,
                                            n,
                                            side,
                                            up_ch,
                                            arm_holder;
                                        arm_holder =
                                            TextEditingController(text: k.arms);
                                        up_ch = TextEditingController(
                                            text: k.upper_chest);
                                        tuck =
                                            TextEditingController(text: k.tuck);
                                        wl = TextEditingController(
                                            text: k.waistLen);
                                        l = TextEditingController(
                                            text: k.length);
                                        c = TextEditingController(
                                            text: k.chest);
                                        w = TextEditingController(
                                            text: k.waist);
                                        s = TextEditingController(text: k.seat);
                                        sh = TextEditingController(
                                            text: k.shoulder);
                                        shalf = TextEditingController(
                                            text: k.sleee_half);
                                        s34 = TextEditingController(
                                            text: k.sleeve_34);
                                        sfull = TextEditingController(
                                            text: k.sleev_full);
                                        n = TextEditingController(text: k.neck);
                                        side = TextEditingController(
                                            text: k.sideslit);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                "EDIT RECOD ",
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              content: SingleChildScrollView(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller: tuck,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER TUCK's POINT "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: wl,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER WAIST LENGTH "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: l,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER  LENGTH "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: up_ch,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "UPPER CHEST "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: c,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER CHEST "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: w,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER WAIST"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: s,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER SEAT "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: arm_holder,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER ARM HOLDER "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: sh,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER SHOULDER "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: n,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER NECK "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      TextFormField(
                                                        controller: side,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER SIDE SLIT "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
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
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          150.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        "SLEEVE",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                30.0),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            30.0,
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
                                                        controller: shalf,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER HALF "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: s34,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER 3/4 "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: sfull,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER FULL "),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                Material(
                                                  elevation: 10.0,
                                                  color: Colors.blue,
                                                  shadowColor:
                                                      Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KurtiDetails kdup =
                                                          new KurtiDetails(
                                                              name: widget.name,
                                                              tuck: tuck.text,
                                                              waistLen: wl.text,
                                                              length: l.text,
                                                              upper_chest:
                                                                  up_ch.text,
                                                              chest: c.text,
                                                              waist: w.text,
                                                              seat: s.text,
                                                              arms: arm_holder
                                                                  .text,
                                                              shoulder: sh.text,
                                                              sleee_half:
                                                                  shalf.text,
                                                              sleeve_34:
                                                                  s34.text,
                                                              sleev_full:
                                                                  sfull.text,
                                                              neck: n.text,
                                                              sideslit:
                                                                  side.text);
                                                      db.uodateKurti(kdup);
                                                      dbref
                                                          .child("/" +
                                                              "${widget.name}/1")
                                                          .update(kdup.toMap());

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "UPDATE",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "UPDATE ",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return new CircularProgressIndicator();
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // getting pant details
              SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: FutureBuilder(
                  future: db.getPant(widget.name.toLowerCase()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      pt = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: pt == null ? 0 : pt.length,
                        itemBuilder: (context, index) {
                          p = pt[index];
                          return Card(
                            elevation: 5.0,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "PANT DETAILS",
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Length         :${p.slength}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Waist         :${p.swaist}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Seat         :${p.sseat}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Thigh         :${p.thigh}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Knee         :${p.knee}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Bottom         :${p.bottom}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Fock         :${p.fock}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Material(
                                    elevation: 10.0,
                                    color: Colors.blue,
                                    shadowColor: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        TextEditingController l,
                                            w,
                                            s,
                                            t,
                                            k,
                                            b,
                                            f;

                                        l = TextEditingController(
                                            text: p.slength);
                                        w = TextEditingController(
                                            text: p.swaist);
                                        s = TextEditingController(
                                            text: p.sseat);
                                        t = TextEditingController(
                                            text: p.thigh);
                                        k = TextEditingController(text: p.knee);
                                        b = TextEditingController(
                                            text: p.bottom);
                                        f = TextEditingController(text: p.fock);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                "EDIT RECORD ",
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              content: SingleChildScrollView(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller: l,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER LENGTH"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: w,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER WAIST"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: s,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER SEAT"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: t,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER THIGH"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: k,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER KNEE"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: b,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER BOTTOM"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      TextFormField(
                                                        controller: f,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    new OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(25),
                                                                ),
                                                                labelText:
                                                                    "ENTER FOCK"),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      SizedBox(
                                                        height: 50.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                Material(
                                                  elevation: 10.0,
                                                  color: Colors.blue,
                                                  shadowColor:
                                                      Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Pant ptud = new Pant(
                                                          sname: widget.name,
                                                          slength: l.text,
                                                          swaist: w.text,
                                                          sseat: s.text,
                                                          thigh: t.text,
                                                          knee: k.text,
                                                          bottom: b.text,
                                                          fock: f.text);
                                                      db.uodatePnt(ptud);
                                                      dbref
                                                          .child("/" +
                                                              "${widget.name}/2")
                                                          .update(ptud.toMap());
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("UPDATE",
                                                        style: TextStyle(
                                                            fontSize: 20.0)),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "UPDATE ",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return new CircularProgressIndicator();
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  Material(
                    elevation: 10.0,
                    color: Colors.blue,
                    shadowColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => homepage()),
                            (route) => false);
                      },
                      child: Icon(
                        Icons.home,
                        size: 60.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Material(
                    elevation: 10.0,
                    color: Colors.blue,
                    shadowColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => final_search()),
                            (route) => false);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 60.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Material(
                    elevation: 10.0,
                    color: Colors.blue,
                    shadowColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text(
                                "DATABASE ALERT",
                                style: TextStyle(color: Colors.yellow),
                              ),
                              content: new Text(
                                "ARE YOU SURE WANT TO ADD TO CLOUD ",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog

                                Row(
                                  children: [
                                    Material(
                                        elevation: 10.0,
                                        color: Colors.blue,
                                        shadowColor: Colors.blueAccent,
                                        child: GestureDetector(
                                          onTap: () {
                                            // dbref
                                            //     .child("/" + "${widget.name}")
                                            //     .set({
                                            //       c.toMap(),
                                            //       k.toMap(),
                                            //       p.toMap()
                                            //     }.toList());
                                            setState(() {
                                              dbref
                                                  .child("/" + "${widget.name}")
                                                  .set({
                                                    c.toMap(),
                                                    k.toMap(),
                                                    p.toMap()
                                                  }.toList());
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "YES",
                                            style: TextStyle(fontSize: 30.0),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Material(
                                        elevation: 10.0,
                                        color: Colors.blue,
                                        shadowColor: Colors.blueAccent,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "NO",
                                            style: TextStyle(fontSize: 30.0),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                        // print(c.toMap());

                        // dbref
                        //     .child("/" + widget.name)
                        //     .set({c.toMap(), k.toMap(), p.toMap()});
                        // print(p.toMap());
                        // print(c.toMap());
                        // print(k.toMap());
                      },
                      child: (Icon(
                        Icons.cloud_done,
                        size: 60.0,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Material(
                    elevation: 10.0,
                    color: Colors.blue,
                    shadowColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  children: [
                                    Text(
                                      "DELETE ALERT ",
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.yellow),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Icon(Icons.add_alert_sharp)
                                  ],
                                ),
                                content: Text(
                                  "ARE YOU SURE WANT TO DELETE DATA OF ${widget.name}",
                                  style: TextStyle(fontSize: 40.0),
                                ),
                                actions: [
                                  Row(
                                    children: [
                                      Material(
                                        elevation: 10.0,
                                        color: Colors.blue,
                                        shadowColor: Colors.blueAccent,
                                        child: GestureDetector(
                                          onTap: () {
                                            dbhelper.deletec(widget.name);
                                            dbhelper.deletep(widget.name);
                                            dbhelper.deletek(widget.name);
                                            dbref
                                                .child("/" + "${widget.name}")
                                                .remove()
                                                .then((value) {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          final_search()),
                                                  (route) => false);
                                            });
                                          },
                                          child: Text(
                                            "YES",
                                            style: TextStyle(fontSize: 30.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Material(
                                        elevation: 10.0,
                                        color: Colors.blue,
                                        shadowColor: Colors.blueAccent,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "NO",
                                            style: TextStyle(fontSize: 30.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.delete_forever,
                        size: 60.0,
                      ),
                    ),
                  )
                ],
              )
            ])),
      ),
    );
  }
}

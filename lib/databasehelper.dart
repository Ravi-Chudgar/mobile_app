import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databasehelper {
  static final _dbname = "p2.db";
  static final _dbversion = 1;
  static final table = "details";

  static final name = 'name';
  static final ph = 'phone';
  static final add = 'address';
  static final date = 'date';
  static final note = 'notes';

  static final table1 = 'kurti';

  static final table2 = 'salwar';
  static final pname = 'sname';
  static final plength = 'slength';
  static final pwaist = 'swaist';
  static final pseat = 'sseat';
  static final thigh = 'thigh';
  static final knee = 'knee';
  static final bottom = 'bottom';
  static final fock = 'fock';

  static Database _database;
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();
  Future<Database> get Databse async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory doc = await getApplicationDocumentsDirectory();
    String path = join(doc.path, _dbname);
    return await openDatabase(path, version: _dbversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      
      $name TEXT PRIMARY KEY NOT NULL ,
      $add TEXT NOT NULL,
      $ph TEXT NOT NULL,
      $date TEXT NOT NULL,
      $note TEXT NOT NULL
    )''');
    await db.execute('''
    CREATE TABLE kurti (
      
      name  TEXT  ,
      tuck TEXT ,
      waistLen TEXT ,
      length TEXT ,
      chest TEXT ,
      upper_chest TEXT,
      waist TEXT ,
      seat TEXT ,
      shoulder TEXT ,
      arms TEXT ,
      neck TEXT ,
      sideslit TEXT ,
      sleee_half TEXT ,
      sleeve_34 TEXT ,
      sleev_full TEXT 
     
    )
    ''');
    await db.execute('''
    CREATE TABLE $table2 (
      
      $pname TEXT PRIMARY KEY NOT NULL,
      $plength TEXT ,
      $pwaist TEXT ,
      $pseat TEXT ,
      $thigh TEXT ,
      $knee TEXT ,
      $bottom TEXT ,
      $fock TEXT 
    )
    ''');
  }

  //insert in to table  al 3 table query
  Future<int> insertPant(Pant pant) async {
    Database db = await instance.Databse;
    return await db.insert('salwar', pant.toMap());
  }

  Future<int> insertKurti(KurtiDetails kd) async {
    Database db = await instance.Databse;
    return await db.insert('kurti', kd.toMap());
  }

  Future<int> insertCustomer(Customer customer) async {
    Database db = await instance.Databse;
    return await db.insert("details", customer.toMap());
  }

  check(String name) async {
    Database db = await instance.Databse;
    return await db.rawQuery("SELECT name FROM details WHERE name=?", [name]);
  }

  getK() async {
    Database db = await instance.Databse;
    return await db.rawQuery("SELECT * FROM kurti WHERE name =?", ["t"]);
  }

  // Future<List<Customer>> check(String name) async {
  //   Database db = await instance.Databse;
  //   final List<Map<String, dynamic>> maps =
  //       await db.rawQuery("SELECT name FROM details WHERE name =?", [name]);
  //   return List.generate(maps.length, (i) {
  //     return Customer(name: maps[i]['name']);
  //   });
  // }
//retrriving data from database
  Future<List<Customer>> getName(String name) async {
    Database db = await instance.Databse;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT name FROM details WHERE name =?", [name]);
    return List.generate(maps.length, (i) {
      return Customer(name: maps[i]['name']);
    });
  }

  Future<List<Map>> GetDname(String name) async {
    Database db = await instance.Databse;
    return await db
        .rawQuery("SELECT name FROM details WHERE name LIKE '${name}%'");
  }

  Future<List<Customer>> getCustomer(String name) async {
    Database db = await instance.Databse;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM details WHERE name =?", [name]);
    return List.generate(maps.length, (i) {
      return Customer(
          name: maps[i]['name'],
          address: maps[i]['address'],
          date: maps[i]['date'],
          phone: maps[i]['phone'],
          notes: maps[i]['notes']);
    });
  }

  Future<List<Customer>> search(String name) async {
    Database db = await instance.Databse;

    var res = await db
        .rawQuery("SELECT name FROM details WHERE name LIKE  '%$name%'");
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT name FROM details WHERE name LIKE  '$name%'");
    return List.generate(maps.length, (i) {
      return Customer(name: maps[i]['name']);
    });
  }

  Future<List<KurtiDetails>> getKurit(String name) async {
    Database db = await instance.Databse;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kurti WHERE name =?", [name]);
    return List.generate(maps.length, (i) {
      return KurtiDetails(
          name: maps[i]['name'],
          tuck: maps[i]['tuck'],
          waistLen: maps[i]['waistLen'],
          length: maps[i]['length'],
          chest: maps[i]['chest'],
          upper_chest: maps[i]['upper_chest'],
          waist: maps[i]['waist'],
          seat: maps[i]['seat'],
          shoulder: maps[i]['shoulder'],
          arms: maps[i]['arms'],
          neck: maps[i]['neck'],
          sleee_half: maps[i]['sleee_half'],
          sideslit: maps[i]['sideslit'],
          sleeve_34: maps[i]['sleeve_34'],
          sleev_full: maps[i]['sleev_full']);
    });
  }

  Future<List<Pant>> getPant(String name) async {
    Database db = await instance.Databse;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM salwar WHERE sname=?", [name]);
    return List.generate(maps.length, (i) {
      return Pant(
          sname: maps[i]['sname'],
          slength: maps[i]['slength'],
          swaist: maps[i]['swaist'],
          sseat: maps[i]['sseat'],
          thigh: maps[i]['thigh'],
          knee: maps[i]['knee'],
          bottom: maps[i]['bottom'],
          fock: maps[i]['fock']);
    });
  }

  deletec(String name) async {
    Database db = await instance.Databse;
    await db.rawQuery("DELETE FROM details WHERE name =?", [name]);
  }

  deletek(String name) async {
    Database db = await instance.Databse;
    await db.rawQuery("DELETE FROM kurti WHERE name =?", [name]);
  }

  deletep(String name) async {
    Database db = await instance.Databse;
    await db.rawQuery("DELETE FROM salwar WHERE sname =?", [name]);
  }

  // updateing the customer
  Future<int> uodateCustomer(Customer customer) async {
    Database db = await instance.Databse;
    return await db.update("details", customer.toMap(),
        where: "name =?", whereArgs: [customer.name]);
  }

  Future<int> uodateKurti(KurtiDetails kurtiDetails) async {
    Database db = await instance.Databse;
    return await db.update("kurti", kurtiDetails.toMap(),
        where: "name =?", whereArgs: [kurtiDetails.name]);
  }

  Future<int> uodatePnt(Pant pant) async {
    Database db = await instance.Databse;
    return await db.update("salwar", pant.toMap(),
        where: "sname =?", whereArgs: [pant.sname]);
  }
}

class Customer {
  int id;
  String name;
  String address;
  String date;
  String phone;
  String notes;

  Customer(
      {@required this.name,
      this.address,
      this.date,
      this.notes,
      this.phone,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'date': date,
      'notes': notes,
      'phone': phone
    };
  }
}

class KurtiDetails {
  String name,
      tuck,
      waistLen,
      length,
      chest,
      upper_chest,
      waist,
      seat,
      shoulder,
      arms,
      neck,
      sideslit,
      sleee_half,
      sleeve_34,
      sleev_full;
  KurtiDetails(
      {@required this.name,
      this.tuck,
      this.waistLen,
      this.length,
      this.chest,
      this.upper_chest,
      this.waist,
      this.seat,
      this.shoulder,
      this.arms,
      this.neck,
      this.sideslit,
      this.sleee_half,
      this.sleeve_34,
      this.sleev_full});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tuck': tuck,
      'waistLen': waistLen,
      'length': length,
      'chest': chest,
      'upper_chest': upper_chest,
      'waist': waist,
      'seat': seat,
      'shoulder': shoulder,
      'arms': arms,
      'neck': neck,
      'sideslit': sideslit,
      'sleee_half': sleee_half,
      'sleeve_34': sleeve_34,
      'sleev_full': sleev_full
    };
  }
}

class Pant {
  //  static final table2 = 'salwar';
  // static final pname = 'sname';
  // static final plength = 'slength';
  // static final pwaist = 'swaist';
  // static final pseat = 'sseat';
  // static final thigh = 'thigh';
  // static final knee = 'knee';
  // static final bottom = 'bottom';
  // static final fock = 'fock';
  String sname, slength, swaist, sseat, thigh, knee, bottom, fock;
  Pant(
      {@required this.sname,
      this.slength,
      this.swaist,
      this.sseat,
      this.thigh,
      this.knee,
      this.bottom,
      this.fock});
  Map<String, dynamic> toMap() {
    return {
      'sname': sname,
      'slength': slength,
      'swaist': swaist,
      'sseat': sseat,
      'thigh': thigh,
      'knee': knee,
      'bottom': bottom,
      'fock': fock
    };
  }
}

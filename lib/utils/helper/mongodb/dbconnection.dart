import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../models/users.dart';
import '../networks/internet_checker/internet_connection_checker.dart';
import 'dbconstants.dart';

class ninavn_dbconnection  {
  static var ninadb, ninadb_collection;

  static connect(BuildContext context) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('Contenting');
      ninadb = await Db.create(DB_STR_CONTNECT);
      await ninadb.open();
    //  ninadb_collection = ninadb.collection(USER_COLLECTION);
      print("Conenected");
    } else {
      print('No internet');

    }
  }
 static closeConnect(){
    print("closing");
    ninadb.close();
    print("CloseConnect");
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {

     // final users = await ninadb_collection.find(where.eq("_id",22)).toList();
      final coll=ninadb.collection('users_group');
       final users=await coll.find().toList();

      return users;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  static insert(Users user) async {
    await ninadb_collection.insertAll([user.toMap()]);
  }

  static update(Users user) async {
    var u = await ninadb_collection.findOne({"_id": user.iId});

    u["email"] = user.email;
    u["password"] = user.password;
    u["token"] = user.token;
    u["status"] = user.status;
    await ninadb_collection.save(u);
  }

  static delete(Users user) async {
   // await ninadb_collection.remove(where.id(user.iId));
  }
}

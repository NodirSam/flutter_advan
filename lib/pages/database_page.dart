import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/member_model.dart';
import 'package:flutter_advanced/service/HiveService.dart';
import 'package:flutter_advanced/service/get_service.dart';
import 'package:flutter_advanced/service/log_service.dart';

class DatabasePage extends StatefulWidget {
  static final String id = "database_page";
  const DatabasePage({Key? key}) : super(key: key);

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {

  @override
  void initState() {
    super.initState();
    //Use Hive Service
    var user = Member("1112", "adad@gmail.com", "adasdasdad");

    GetService.storeUser(user);
    var user2 = GetService.loadUser();

    // HiveService.storeUser(user);
    // var user2 = HiveService.loadUser();
    LogService.i(user2.toJson().toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database"),
      ),
      body: Center(
        child: Text("Local Database") ,
      ),
    );
  }
}

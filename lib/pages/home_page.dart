import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/api_model.dart';
import 'package:flutter_advanced/model/post_model.dart';
import 'package:flutter_advanced/model/member_model.dart';
import 'package:flutter_advanced/pages/database_page.dart';
import 'package:flutter_advanced/pages/network_page.dart';
import 'package:flutter_advanced/service/HTTP_Service.dart';
import 'package:flutter_advanced/service/log_service.dart';
import 'package:flutter_advanced/service/secure_service.dart';
import 'package:flutter_advanced/service/utils_ervice.dart';

import '../service/prefs_ervice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // @override
  // void initState() {
  //   super.initState();
  //
  //  _apiPostList();
  //   var post1 = APISERVICE(id: 1, employee_name: "Kamol", employee_age: 23.toString(), employee_salary: 23333.toString());
  //   _apiPostCreate(post1);
  //   //_apiPostUpdate(post);
  //  //_apiPostDelete(post);
  //   // PrefService.storeName("Nodirbek");
  //   // PrefService.loadName().then((value) => {
  //   //   LogService.d(value.toString())
  //   // });
  //
  //   // var user = User("111", "dwdsdsdasd.com@gmail.com", "1133qsas");
  //   // PrefService.storeUser(user);
  //   // PrefService.loadUser().then((value) => {
  //   //   LogService.d(value!.toJson().toString())
  //   // });
  //
  //   // SecureService.storeApiKey("a1b2c33d4e5f6g7h8i9jakblc");
  //   // SecureService.loadApiKey().then((value) => {
  //   //   LogService.w(value.toString()),
  //   // });
  //
  //
  // }
  //
  // void _apiPostList(){
  //   Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
  //     LogService.i(response.toString()),
  //   });
  // }
  //
  // void _apiPostCreate(APISERVICE apiservice){
  //   Network.POST(Network.API_CREATE, Network.paramsCreate(apiservice)).then((response) => {
  //     LogService.i(response.toString()),
  //   });
  // }
  //
  // // void _apiPostUpdate(Post post){
  // //   Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsCreate(post)).then((response) => {
  // //     LogService.i(response.toString()),
  // //   });
  // // }
  //
  // void _apiPostDelete(Post post){
  //   Network.DEL( Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
  //     LogService.i(response.toString()),
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Module 6"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text("str_packages").tr(),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text("str_localization").tr(),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, DatabasePage.id);
              },
              child: Text("str_local_database").tr(),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, NetworkPage.id);
              },
              child: Text("str_networking").tr(),
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.orange,
                    onPressed: (){
                      context.setLocale(Locale("en", "US")); 
                    },
                    child: Text("English"),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: (){
                      context.setLocale(Locale("ru", "RU"));
                    },
                    child: Text("Russian"),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: MaterialButton(
                    color: Colors.green,
                    onPressed: (){
                      context.setLocale(Locale("uz", "UZ"));
                    },
                    child: Text("Uzbek"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_advanced/model/member_model.dart';
import 'package:get_storage/get_storage.dart';

class GetService{
  static var box =GetStorage();

  static void storeUser(Member user) async {
    box.write("user", user.toJson());
  }

  static Member loadUser(){
    var user = Member.fromJson(box.read("user"));
    return user;
  }

  static void removeUser() async {
    box.remove("user");
  }
}
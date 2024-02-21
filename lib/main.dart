import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/SignUpPage.dart';
import 'package:flutter_advanced/pages/database_page.dart';
import 'package:flutter_advanced/pages/home_page.dart';
import 'package:flutter_advanced/pages/main_page.dart';
import 'package:flutter_advanced/pages/network_page.dart';
import 'package:flutter_advanced/pages/signin_page.dart';
import 'package:flutter_advanced/pages/splash_page.dart';
import 'package:flutter_advanced/service/HTTP_Service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox("pdp_online");
  await GetStorage.init();
   

  runApp(
     EasyLocalization(
       //support qilinadigan tillar ro'yhati
       supportedLocales: const [
         Locale("en", "US"),
         Locale("ru", "RU"),
         Locale("uz", "UZ")
       ],
        path: "assets/translations",
        fallbackLocale: const    Locale("en", "US"), //default language
        child: const MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: {
        DatabasePage.id : (context) => DatabasePage(),
        NetworkPage.id : (context) => NetworkPage(),
        SplashPage.id : (context) => SplashPage(),
        SignInPage.id : (context) => SignInPage(),
        SignUpPage.id : (context) => SignUpPage(),
        MainPage.id : (context) => MainPage(),
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
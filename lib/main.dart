import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meya/pages/CategoryPage.dart';
import 'package:meya/pages/HomePage.dart';
import 'package:meya/pages/UpComing.dart';
import 'package:meya/pages/profilePage.dart';
import 'package:meya/pages/Allpages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0F111D),
      ),
      routes: {
        "/": (context) => Homepage(),
        "categoriesPage": (context) => CategoryPage(),
        "profilePage": (context) => ProfilePage(),
        "UpcomingImagesPage": (context) => UpcomingImagesPage(),
        "allPage": (context) => AllPages(),

        //  "allPage": (context) => AllPages(),
      },
    );
  }
}

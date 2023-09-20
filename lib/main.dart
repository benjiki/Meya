import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meya/pages/Allpages.dart';
import 'package:meya/pages/CategoryPage.dart';
import 'package:meya/pages/HomePage.dart';
import 'package:meya/pages/UpComing.dart';
import 'package:meya/pages/profilePage.dart';
<<<<<<< HEAD
import 'package:meya/pages/Allpages.dart';
=======
>>>>>>> 49c6e0ac03c999d6a76036f91dd971a0aaa040be

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
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
<<<<<<< HEAD
        "catagoiresPage": (context) => CategoryPage(),
        "profilepage": (context) => ProfilePage(),
        "allvideos": (context) => Allvideos(),
=======
        "catagoiresPage":(context)=> CategoryPage(),
        "profilepage":(context)=> ProfilePage(),
        "UpcomingImagesPage": (context) => UpcomingImagesPage(),
        "allpage": (context) => AllPages(),

>>>>>>> 49c6e0ac03c999d6a76036f91dd971a0aaa040be
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meya/pages/CategoryPage.dart';
import 'package:meya/pages/HomePage.dart';
import 'package:meya/pages/profilePage.dart';
import 'package:meya/pages/Allpages.dart;
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
  void initState(){
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
        "catagoiresPage":(context)=> CategoryPage(),
        "profilepage":(context)=> ProfilePage(),
         "allvideos":(context)=> Allvideos(),
      },
    );
  }
}

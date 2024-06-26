import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF292B37),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
               InkWell(
                 onTap:(){
                   Navigator.pushNamed(context, "/");
                 },
                 child: Icon(Icons.home,
                   size: 35,
                   color: Colors.white,
                 ),
               ),
         InkWell(
           onTap:(){
             Navigator.pushNamed(context,"catagoiresPage");
           },
           child: Icon(Icons.play_arrow,
             size: 35,
             color: Colors.white,
           ),
         ),InkWell(
           onTap:(){
             Navigator.pushNamed(context, "UpcomingImagesPage");
           },
           child: Icon(Icons.upcoming,
             size: 35,
             color: Colors.white,
           ),
         ),InkWell(
           onTap:(){
             Navigator.pushNamed(context, "allpage");

           },
           child: Icon(Icons.add,
             size: 35,
             color: Colors.white,
           ),
         ),InkWell(
           onTap:(){
             Navigator.pushNamed(context, "profilepage");
           },
           child: Icon(Icons.person,
             size: 35,
             color: Colors.white,
           ),
         )

     ],),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meya/widgets/CustomNavBar.dart';

class Allpages extends StatelessWidget {
  const Allpages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meya/widgets/CustomNavBar.dart';

class Allvideos extends StatelessWidget {
  const Allvideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

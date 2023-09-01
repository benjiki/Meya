import 'package:flutter/material.dart';
import 'package:meya/widgets/CustomNavBar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

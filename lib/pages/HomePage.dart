import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meya/pages/AllPages.dart';
import 'package:meya/pages/CategoryPage.dart';
import 'package:meya/pages/UpComing.dart';
import 'dart:typed_data';
import 'dart:convert';
import '../constants.dart';
import '../widgets/CustomNavBar.dart';
import '../widgets/NewVideosWidget.dart';
import '../widgets/UpcomingWidget.dart';
import 'Search.dart';

class Homepage extends StatelessWidget {
  final imageName = 'named.png';

  Homepage({Key? key}) : super(key: key);

  String get imageUrl => 'http://$ipAddress/n7/meya/feach_user_img.php?image_name=$imageName';

  Future<Uint8List> fetchImageData() async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final imageDataJson = json.decode(response.body);
      final imageData = base64.decode(imageDataJson['image_data']);
      return Uint8List.fromList(imageData);
    } else {
      throw Exception('Failed to load image');
    }
  }

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello benji",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "What to watch?",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<Uint8List>(
                      future: fetchImageData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error loading image');
                        } else if (!snapshot.hasData) {
                          return Text('No image data');
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.memory(
                              snapshot.data!,
                              height: 60,
                              width: 60,
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF292B37),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white54,
                      size: 30,
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: searchController,
                        focusNode: searchFocusNode,
                        style: TextStyle(color: Colors.white54),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54),
                        ),
                        onFieldSubmitted: (query) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpcomingImagesPage()),
                  );
                },
                child: UpcomingWidget(),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryPage ()),
                  );
                },
                child: NewVideosWidget(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

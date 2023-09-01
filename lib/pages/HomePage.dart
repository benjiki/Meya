import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
import '../constants.dart';
import '../widgets/CustomNavBar.dart';
import '../widgets/NewVideosWidget.dart';
import '../widgets/UpcomingWidget.dart';
class Homepage extends StatelessWidget {
  final imageName = 'named.png'; // Update this to the actual image name
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello benji",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text("what to wacth?",
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
                            borderRadius: BorderRadius.circular(30), // Rounded shape
                            child: Image.memory(snapshot.data!,height: 60,width: 60,),
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
              margin: EdgeInsets.symmetric(horizontal:10),
              decoration: BoxDecoration(
                color: Color(0xFF292B37),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Icon(Icons.search,
                color: Colors.white54,
                  size: 30,
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white54),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                )
              ],),
            ),
            SizedBox(height: 30,),
            UpcomingWidget(),
            SizedBox(height: 40,),
            NewVideosWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

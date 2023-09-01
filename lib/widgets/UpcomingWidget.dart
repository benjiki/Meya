import 'package:flutter/material.dart';
import 'package:meya/constants.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
class UpcomingWidget extends StatelessWidget {
  final imageName = 'named.png'; // Update this to the actual image name

  const UpcomingWidget({super.key});
  String get imageUrl => 'http://$ipAddress/n7/meya/feach_user_img.php?image_name=$imageName';

  Future<List<Uint8List>> fetchImageData() async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final imageDataJson = json.decode(response.body);
      final imageData = base64.decode(imageDataJson['image_data']);
      List<Uint8List> imageList = List.generate(10, (_) => Uint8List.fromList(imageData));
      return imageList;
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming videos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "see all",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        FutureBuilder<List<Uint8List>>(
          future: fetchImageData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading images');
            } else {
              final imageList = snapshot.data;
              if (imageList == null || imageList.isEmpty) {
                return Text('No images available');
              }
              return Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.memory(
                          imageList[index],
                          height: 180,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}

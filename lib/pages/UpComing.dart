import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../widgets/CustomNavBar.dart';  // Required import to use CustomNavBar

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcoming Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpcomingImagesPage(),
    );
  }
}

class UpcomingImagesPage extends StatefulWidget {
  @override
  _UpcomingImagesPageState createState() => _UpcomingImagesPageState();
}

class _UpcomingImagesPageState extends State<UpcomingImagesPage> {
  List<String> imageNames = [];

  @override
  void initState() {
    super.initState();
    fetchAllImageNames();
  }

  Future<void> fetchAllImageNames() async {
    final response = await http.get(Uri.parse('http://$ipAddress/n7/meya/single_page_upcoming.php'));
    if (response.statusCode == 200) {
      List<String> fetchedNames;
      try {
        fetchedNames = List<String>.from(json.decode(response.body));
      } catch (e) {
        print("Error decoding JSON: $e");
        return;
      }

      setState(() {
        imageNames = fetchedNames;
      });
    } else {
      throw Exception('Failed to load image names with status code ${response.statusCode}');
    }
  }

  Future<String?> fetchBase64Image(String imageName) async {
    final response = await http.get(Uri.parse('http://$ipAddress/n7/meya/feach_user_img.php?image_name=$imageName'));
    if (response.statusCode == 200) {
      try {
        final imageData = ImageData.fromJson(json.decode(response.body));
        return imageData.data;
      } catch (e) {
        print("Error decoding JSON: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Images'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: imageNames.length,
        itemBuilder: (context, index) {
          return FutureBuilder<String?>(
            future: fetchBase64Image(imageNames[index]),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Image.memory(
                    base64Decode(snapshot.data!),
                    fit: BoxFit.cover,
                  );
                } else {
                  return Center(child: Text("Failed to load image."));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      bottomNavigationBar: CustomNavBar(),  // Added the CustomNavBar here
    );
  }
}

class ImageData {
  final String data;

  ImageData({required this.data});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      data: json['image_data'] ?? '',
    );
  }
}

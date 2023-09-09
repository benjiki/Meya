import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meya/constants.dart';

import '../widgets/NewVideosWidget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<VideoData> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search videos',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _performSearch(_searchController.text);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index].title),
                    subtitle: Text(searchResults[index].category),
                    leading: Image.network(
                      searchResults[index].imageUrl,
                      width: 50,
                      height: 50,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performSearch(String query) async {
    final response = await http.get(Uri.parse('http://$ipAddress/n7/meya/search_videos.php?query=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<VideoData> searchResultsData = responseData
          .map((videoMap) => VideoData(
        imageUrl: videoMap['imageUrl'],
        title: videoMap['title'],
        category: videoMap['category'],
      ))
          .toList();

      setState(() {
        searchResults = searchResultsData;
      });
    } else {
      throw Exception('Failed to perform the search');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}

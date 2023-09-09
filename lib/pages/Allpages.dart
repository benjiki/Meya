import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meya/widgets/CustomNavBar.dart';
import 'package:meya/constants.dart';

class AllPages extends StatefulWidget {
  final String? searchQuery; // Optional search query parameter

  AllPages({this.searchQuery});

  @override
  _AllPagesState createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  List<Film> films = [];

  @override
  void initState() {
    super.initState();
    fetchFilms();
  }

  Future<void> fetchFilms() async {
    // Check if there's a search query, if so, append it to the URL
    final url = widget.searchQuery != null
        ? 'http://$ipAddress/n7/meya/feach_New_videos.php?query=${widget.searchQuery}'
        : 'http://$ipAddress/n7/meya/feach_New_videos.php';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        films = jsonResponse.map((film) => Film(
            title: film['title'],
            imageUrl: film['imageUrl'],
            category: film['category']
        )).toList();
      });
    } else {
      throw Exception('Failed to load films');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL videos'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: films.length,
        itemBuilder: (context, index) {
          return FilmCard(film: films[index]);
        },
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class FilmCard extends StatelessWidget {
  final Film film;

  FilmCard({required this.film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilmDetail(film: film),
        ));
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                film.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${film.title} (${film.category})'), // Displaying category with the title
            ),
          ],
        ),
      ),
    );
  }
}

class FilmDetail extends StatelessWidget {
  final Film film;

  FilmDetail({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              film.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${film.title} (${film.category})', // Displaying category with the title
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This is a placeholder description for ${film.title}.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class Film {
  final String title;
  final String imageUrl;
  final String category;

  Film({required this.title, required this.imageUrl, required this.category});
}

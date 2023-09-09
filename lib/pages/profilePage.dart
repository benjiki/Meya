import 'package:flutter/material.dart';
import 'package:meya/widgets/CustomNavBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Profile Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0, // Remove shadow
      ),
      body: ListView(
        children: <Widget>[
          UserInformation(),
          _buildTile(context, Icons.edit, 'Edit Profile'),
          _buildTile(context, Icons.settings, 'Settings'),
          _buildTile(context, Icons.credit_card, 'Billing Details'),
          _buildTile(context, Icons.account_circle, 'Profile Management'),
          _buildTile(context, Icons.logout, 'Logout'),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  ListTile _buildTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        // TODO: Handle onTap
      },
    );
  }
}

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundImage: NetworkImage('https://example.com/path/to/user/profile/image.jpg'),
          ),
          SizedBox(height: 20.0),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'johndoe@example.com',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

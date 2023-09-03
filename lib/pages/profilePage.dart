import 'package:flutter/material.dart';
import 'package:meya/widgets/CustomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          UserInformation(),  // Widget to display user's photo, name, and email
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            onTap: () {
              // Handle edit profile functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Billing Details'),
            onTap: () {
              // Handle billing details functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile Management'),
            onTap: () {
              // Handle profile management functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality here
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage('https://example.com/path/to/user/profile/image.jpg'),
          ),
          SizedBox(height: 20.0),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'johndoe@example.com',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

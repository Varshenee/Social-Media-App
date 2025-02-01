import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 10),
            Text('Username', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Bio: This is a short bio about the user.'),
            SizedBox(height: 20),
            Text('Your Posts:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example for 5 posts
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Post Title $index'),
                    subtitle: Text('Post Description $index'),
                    leading: Icon(Icons.image),
                    onTap: () {
                      // Navigate to the full post page
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


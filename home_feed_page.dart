import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'post_page.dart';

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Row(
          children: [
            // Heart Icon on the left of the title
            Icon(Icons.favorite, color: Colors.white),
            SizedBox(width: 8),

            Text(
              'Hearts',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          // Profile Icon
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.person, color: Colors.pink[400]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5, // Card shadow
            color: Colors.pink[50],
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username and post details
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.pinkAccent,
                        child: Text('U$index', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Username $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a sample post $index. It can contain text and images. Enjoy the pink-themed design!',
                    style: TextStyle(fontSize: 14, color: Colors.pink[800]),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://via.placeholder.com/300', // Example image
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Icon row for likes, comments, and share
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite_border_outlined, color: Colors.pinkAccent),
                          SizedBox(width: 5),
                          Text('123', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.comment, color: Colors.pinkAccent),
                          SizedBox(width: 5),
                          Text('45 comments', style: TextStyle(color: Colors.pink[800])),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.share, color: Colors.pinkAccent),
                          SizedBox(width: 5),
                          Text('Share', style: TextStyle(color: Colors.pink[800])),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          );
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add), // Create Post Icon
      ),
    );
  }
}

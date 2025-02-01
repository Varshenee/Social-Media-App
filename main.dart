import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_feed_page.dart';
import 'profile_page.dart';
import 'post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeFeedPage(), // Home feed route
        '/profile': (context) => ProfilePage(), // Profile page route
        '/create-post': (context) => CreatePostPage(), // Create Post route
      },
    );
  }
}

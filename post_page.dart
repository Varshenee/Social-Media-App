import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(hintText: 'What\'s on your mind?'),
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print('Post: ${_textController.text}');
                Navigator.pop(context); // Go back after posting
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
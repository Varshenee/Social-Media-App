import 'package:flutter/material.dart';
import 'home_feed_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map<String, Map<String, String>> users = {};
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isSignUp = false;

  void handleAuth() {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isSignUp) {
      if (users.containsKey(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User already exists!')),
        );
      } else {
        users[email] = {'username': username, 'password': password};
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-up successful! Please log in.')),
        );
        setState(() {
          isSignUp = false;
        });
        clearFields();
      }
    } else {
      if (users.containsKey(email) && users[email]?['password'] == password) {
        clearFields();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeFeedPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials!')),
        );
      }
    }
  }

  void clearFields() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isSignUp ? 'Sign Up' : 'Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.pink[400],
              ),
            ),
            // Box for form
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSignUp)
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleAuth,
                    child: Text(isSignUp ? 'Sign Up' : 'Login'),
                  ),
                  TextButton(
                    onPressed: () => setState(() => isSignUp = !isSignUp),
                    child: Text(
                      isSignUp
                          ? 'Already have an account? Login'
                          : 'Don\'t have an account? Sign Up',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

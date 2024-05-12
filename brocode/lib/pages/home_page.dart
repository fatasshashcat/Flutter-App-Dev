import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center, // Aligns row content to the center horizontally
              children: [
                Icon(Icons.code), // Displays a code icon
                 SizedBox(width: 8), // Adds horizontal spacing between the icon and text
                 Text(
                  'BroCode',
                  style: TextStyle(fontSize: 20), // Sets font size to 20
                ),
              ],
            ),
            const SizedBox(height: 20), // Adds vertical space between the row and the button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Pops current route off the navigator
              },
              child: const Text('Go back to intro page'),
            ),
          ],
        ),
      ),
    );
  }
}

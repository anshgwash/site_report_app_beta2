import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Improvements for next update:',
              textScaleFactor: 1.5,
            ),
            Text(
              '[-] File Explorer (browse recent reports)',
              textScaleFactor: 1.2,
            ),
            Text(
              '[-] Google Sign In with Firebase',
              textScaleFactor: 1.2,
            ),
            Text(
              '[-] Drive Integration for projects & reports',
              textScaleFactor: 1.2,
            ),
            Text(
              '[-] Use better state mangament technique',
              textScaleFactor: 1.2,
            ),
          ],
        ),
      ),
    );
  }
}

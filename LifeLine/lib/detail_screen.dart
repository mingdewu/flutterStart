import 'package:flutter/material.dart';

import 'package:lifeline/note.dart';

class DetailScreen extends StatelessWidget {
  final Note note;
  const DetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Text(
                note.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(note.content),
            ],
          ),
        ),
      ),
    );
  }
}
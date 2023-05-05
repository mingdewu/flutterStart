import 'package:flutter/material.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/friendList.dart';
import 'package:lifeline/achievment.dart';
import 'package:lifeline/note.dart';
import 'package:lifeline/detail_screen.dart';
class projectPage extends StatelessWidget {
  const projectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProjectList(),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}


class ProjectList extends StatelessWidget{
  final List<Note> _noteList = [
    Note(
        title:"Project 1",
        content:"project 1",
    ),
    Note(
      title:"project 2",
      content:"project 2",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _noteList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _noteList[index].title,
              ),
              subtitle: Text(
                _noteList[index].content,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(note: _noteList[index]),
                  ),
                );
              },
            );
          }),
    );
  }
}


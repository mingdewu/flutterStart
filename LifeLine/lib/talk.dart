import 'package:flutter/material.dart';
import 'package:lifeline/achienvement.dart';
import 'package:lifeline/friendList.dart';
import 'package:lifeline/project.dart';
import 'package:lifeline/quit.dart';
class talkPage extends StatefulWidget{
  @override
  talkpageState createState() => talkpageState();
}

class talkpageState extends State<talkPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    // achievementPage(),
    friendsListPage(),
    achievementPage(),
    projectPage(),
  ];

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Life Line"),
      ),
      body: Center(
        // child: Column(
        //   children: [
        //     talkButton(context),
        //     friendListButton(context),
        //     achievementButton(context),
        //     projectButton(context),
        //     quitButton(context),
        //   ],
        // )
          child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'friend_List'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: ('achivment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: ('project'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_hospital),
          //   label: ('School'),
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

ElevatedButton talkButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> talkPage()),
    );
  }, child: const Text("talk Page"));
}
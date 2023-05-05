import 'package:flutter/material.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/project.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/friendList.dart';
class achievementPage extends StatelessWidget {
  const achievementPage({super.key});
  static const List<Tab> myTabs = <Tab>[
    Tab(text:'world'),
    Tab(text:"me"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const TabBar(tabs: myTabs,)
              ],
            )
          // bottom: const TabBar(
          //   tabs: myTabs,
          // ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String label = tab.text!.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


ElevatedButton achievementButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const achievementPage()),
    );
    }, child: const Text("achievment Page"));
}

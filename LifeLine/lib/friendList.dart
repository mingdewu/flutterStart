import 'package:flutter/material.dart';
import 'package:lifeline/project.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/achievment.dart';
class friendsListPage extends StatelessWidget {
  const friendsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            alignment:Alignment.bottomLeft,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            height: 50.0,
            child:yearsList(context),
          ),
          Column(
           children:  <Widget>[
             Card(child:ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))),
             Card(child:ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))),
             Card(child:ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))),
             Card(child:ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))),
             Card(child:ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))),
             Card(child:ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star)))

           ],
          )
        ]
      )
    );
  }
}

Column myFriendListPage(BuildContext context) {
  return Column(
    children: [
      Container(
        alignment:Alignment.bottomLeft,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        height: 50.0,
        child:yearsList(context),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListView(
          children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ]
        )
      ),
    ],
  );
}

ElevatedButton friendListButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const friendsListPage(),
      )
    );
    }, child: const Text("friendListButton Page"));
}

ListView yearsList(BuildContext context){
  return ListView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
        width: 160.0,
        color:Colors.red,
        child: yearlabel(context,"2021"),
      ),
      Container(
        width: 160.0,
        color:Colors.blue,
        child: yearlabel(context,"2022"),
      ),
      Container(
        width: 160.0,
        color:Colors.yellow,
        child: yearlabel(context,"2023"),
      ),
      Container(
        width: 160.0,
        color:Colors.black,
      ),
    ],
  );
}

Stack yearlabel(BuildContext context,String _thisyear){
  return Stack(
    children: [
      ListTile(title: Text(_thisyear),)
    ],
  );
}

SliverList thisYearFriends(BuildContext context){
  return SliverList(
    delegate: SliverChildBuilderDelegate(
        (BuildContext context,int index){
          return ListTile(
            title: Text('Item $index'),
          );
        },
      childCount: 5,
    ),
  );
}
ListView friends2023(BuildContext context){
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.map),
        title: Text('Map'),
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Album'),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text('Phone'),
      ),
      ListTile(
        leading: Icon(Icons.contacts),
        title: Text('Contact'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Setting'),
      ),
    ],
  );
}

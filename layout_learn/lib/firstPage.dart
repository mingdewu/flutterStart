// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';
void main() {
  runApp(MyApp(
    items: List<String>.generate(100, (i) => 'Item $i'),
  ),);
}

class MyApp extends StatelessWidget {
  final List<String> items;
  const MyApp({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fakerLine',
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text('fakerLine'),
        ),
        body:  Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children:[
                buildHeader(),
                buildUserInfo(),
                buildSearch(),
                buildColumn(),
                buildService(),
                buildListView(),
                buildRow(),
            ]
          ),
        ),
      ),
    );
  }
  Widget buildRow() =>
    Container(
      alignment: Alignment.bottomCenter,
      color: Colors.black,
      height: 40,
      padding:const EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.house,color: Colors.white),
          Icon(Icons.speaker_notes,color: Colors.white),
          Icon(Icons.play_arrow_outlined,color: Colors.white),
          Icon(Icons.newspaper,color: Colors.white),
          Icon(Icons.wallet,color: Colors.white)
        ],
      ),
    );


  Widget showList() {
    return Scaffold(
      appBar: AppBar(title: Text("リストサンプル")),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Text("👇ここからリスト👇"),
          ),
          Flexible(
            flex: 1,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return (Text("リストNo, $index"));
              },
            ),
          ),
          Flexible(
            flex: 2,
            child: Text("👆ここまでリスト👆"),
          ),
        ],
      ),
    );
  }
  Widget buildHeader()=>
    Container(
      alignment: Alignment.topRight,
      color: Colors.black,
      height: 40,
      padding:const EdgeInsets.all(7),
      child: Wrap(
        alignment: WrapAlignment.end,
        spacing: 20,
        children:[
          Icon(Icons.bookmark_border,color: Colors.white),
          Icon(Icons.notifications,color: Colors.white),
          Icon(Icons.person_add_alt_1,color: Colors.white),
          Icon(Icons.settings,color: Colors.white),
        ]
      ),
    );
  Widget buildUserInfo() =>
    Container(
      margin: const EdgeInsets.only(left:15.0,top:0,right: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black
      ),
      alignment: Alignment.topRight,
      padding:const EdgeInsets.all(10),

      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration :BoxDecoration(
                      border: Border.all(color: Colors.green
                    ),
                  ),child: Text('BGMを設定',style: TextStyle(
                      fontSize: 10,
                    color: Colors.white
                  ),),
                  ),
                  Text(
                      "set state",
                    style: TextStyle(
                      fontSize: 25,
                        color: Colors.white
                    ),
                  )
                ],
              )
          )
        ,buildStack()],
      ),
    );
  Widget buildSearch()=>
    Container(
      margin:const EdgeInsets.all(20),
      child: const TextField(
        decoration:InputDecoration(
        fillColor: Colors.grey,
        filled: true,
        border:OutlineInputBorder(),
        labelText: 'Search',
        )
      ),
    );
  Widget buildStack()=>
      Container(
        alignment: Alignment.topRight,
        color: Colors.black,
        height: 100,
        width: 200,
        padding:const EdgeInsets.all(7),
        child: const CircleAvatar(backgroundColor: Colors.lightGreenAccent,
            backgroundImage:AssetImage('images/119.jpg'),
            child: Text('MH'))
      );
  Widget buildColumn() =>
      // #docregion Column
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:EdgeInsets.all(15),
        child: const Text(
          "FriendList",
          style: TextStyle(color: Colors.white),
        ),
      ),

      buildFriendView(),
      buildGroupView()
    ],
  );
  Widget  buildFriendView() =>(
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.lightGreen,
          backgroundImage:AssetImage('images/119.jpg'),
        ),
        Icon(Icons.person,color: Colors.white),
        const Text(
        'friends',
        style: TextStyle(color: Colors.white),
        ),
      ],
    )
  );
  Widget buildGroupView() =>(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.lightGreen,
            backgroundImage:AssetImage('images/119.jpg'),
          ),
          Icon(Icons.groups,color: Colors.white),
          const Text(
            'groups',
            style: TextStyle(color: Colors.white),
          ),
        ],
      )
  );
  // var stars = Row(
  //   mainAxisSize: MainAxisSize.min,
  //   children: [
  //     const Icon(Icons.star, color: Colors.black),
  //     const Icon(Icons.star, color: Colors.black),
  //   ],
  // );
  Widget buildService()=>(
      Container(
        height: 40,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.mood, color: Colors.white,size: 50.0,),
            const Icon(Icons.brush, color: Colors.white,size: 50.0,),
            const Icon(Icons.card_giftcard, color: Colors.greenAccent,size: 50.0,),
            const Icon(Icons.place, color: Colors.white,size: 50.0,),
            const Icon(Icons.add, color: Colors.white,size: 50.0,),
          ],
        ),
      )
  );
  Widget buildListView() => (
      Container(
        height: 40,
        child:ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
        itemBuilder:(context,index){
            return ListTile(
              title: Text(items[index]),
            );
        },
      ),
          )
      );
// #enddocregion Column
}
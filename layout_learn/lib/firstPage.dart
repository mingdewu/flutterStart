// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fakerLine',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('fakerLine'),
        ),
        body:  Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
                buildHeader(),
                buildUserInfo(),
                buildColumn(),
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
      margin: const EdgeInsets.only(left:15.0,right: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
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
                      'Milk',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                      "set state",
                    style: TextStyle(
                      fontSize: 25
                    ),
                  )
                ],
              )
          )
        ],
      ),
    )


  ;
  Widget buildColumn() =>
      // #docregion Column
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('images/pic1.jpg'),
      Image.asset('images/pic2.jpg'),
      Image.asset('images/pic3.jpg'),
    ],
  );
// #enddocregion Column
}
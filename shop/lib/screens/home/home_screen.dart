

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/screens/home/components/body.dart';
import 'package:shop/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      // elevation:1,
      leading:
      IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: kTextColor,
          onPressed: (){}
      ),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: const Icon(Icons.search),color: kTextColor,),
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart),color: kTextColor,),
        SizedBox(width:kDefaultPadding/2),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constants.dart';
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Bag1","Bag2","Bag3","Bag4"];
  int seletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index)=>buildCategory(index),
          )
      ),
    );
  }
  Widget buildCategory(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          seletedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: seletedIndex == index? kTextColor:kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:kDefaultPadding/4),
              height: 2,
              width: 30,
              color: seletedIndex ==index? Colors.black:Colors.transparent,
            )
          ],
        ),

      ),
    );
  }
}

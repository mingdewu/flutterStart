import 'package:flutter/material.dart';
import 'package:shop/models/Product.dart';

import '../../../constants.dart';
import 'Category.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:kDefaultPadding),
          child: Text("Women",
            style:Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        Categories(),
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
              color: products[0].color,
              borderRadius: BorderRadius.circular(16)
          ),

        )
      ],
    );
  }
}

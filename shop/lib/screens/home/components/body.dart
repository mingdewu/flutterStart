import 'package:flutter/material.dart';
import 'package:shop/models/Product.dart';

import '../../../constants.dart';
import 'Category.dart';
import 'item_card.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal:kDefaultPadding),
          child: Text("Women",
            style:Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        const Categories(),
       Expanded(child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
         child: GridView.builder(
             itemCount: products.length,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 0.75,
                 mainAxisSpacing: kDefaultPadding,
                 crossAxisSpacing: kDefaultPadding
             ),
             itemBuilder: (context,index)=>ItemCard(
               product: products[index],
             )
         ),
       )
       )

      ],
    );
  }
}
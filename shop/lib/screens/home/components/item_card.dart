import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';

class ItemCard extends StatelessWidget {
final Product product;
final Function? press;
const ItemCard({Key? key, required this.product, this.press,}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          // height: 180,
          // width: 160,
          decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(product.image),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/4),
        child: Text(product.title,style: const TextStyle(color: Colors.black)),
      ),
      Text("${product.price}"),
    ],
  );
}
}

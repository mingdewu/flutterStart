import 'package:flutter/material.dart';

class Product{
  final String image,title,description;
  final int price,size,id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
});
}

List<Product> products =[
  Product(
    id:1,
    title:"offoce Code",
    price:234,
    size:12,
    description: "dummyText",
    image: "assets/images/bag1.png",
    color: Color(0xFF3D82AE)
  ),
  Product(
      id: 2,
      image: "assets/images/bag2.png",
      title: "Office Code1",
      price: 433,
      description: "dummyText",
      size: 13,
      color: Color(0xFF1D32EE)),
  Product(
      id: 3,
      image: "assets/images/bag2.png",
      title: "Office Code2",
      price: 123,
      description: "dummyText",
      size: 13,
      color: Color(0xFF1D32EE)),
  Product(
      id: 4,
      image: "assets/images/bag2.png",
      title: "Office Code3",
      price: 3233,
      description: "dummyText",
      size: 13,
      color: Color(0xFF1D32EE)),
  Product(
      id: 5,
      image: "assets/images/bag2.png",
      title: "Office Code4",
      price: 3313,
      description: "dummyText",
      size: 13,
      color: Color(0xFF1D32EE)),
];
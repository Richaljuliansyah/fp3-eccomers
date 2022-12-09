import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/download.jpg",
      "assets/images/download1.jpg",
      "assets/images/download2.jpg",
      "assets/images/download3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "SEPATU VANS",
    price: 12.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    // hero:,
    id: 2,
    images: [
      "assets/images/Fuck Yeah Nike Shoes.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/a6b68eaa8f8f954b5628509f87d69a44.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "dorcmart",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/69a35c6437aed3c28e27ccc26c394d0e.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ALL STAR",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "SEPATU KU SEPATUMU";
// const String descriptionPS4 =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
// const String descriptionNike =
//     "Breathable pants, good for running and gym when you sweating it out …";
// const String descriptionGloves =
//     "Built for the adventure and extreme sports …";
// const String descriptionHeadphones =
//     "Wireless headphones for PC/PS4™ gives you precision surround sound whether your gaming or working …";

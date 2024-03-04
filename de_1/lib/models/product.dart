import 'package:flutter/material.dart';

class Product {
  final String title;
  final String type;
  final String imageUrl;
  final double price;
  final List<Color> colors;
  final String description;

  Product({
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.price,
    required this.colors,
    required this.description,
  });
}

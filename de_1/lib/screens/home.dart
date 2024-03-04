import 'package:flutter/material.dart';

import '../hex_color.dart';
import '../models/product.dart';
import 'detail_screen.dart';

class Home extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      imageUrl: 'images/product01.jpeg',
      price: 10.0,
      colors: [Color(0xFFFF5733),Color(0xFF3366FF)],
      type: 'Type 1',
      description: 'Description of Product 1',
    ),
    Product(
      title: 'Product 2',
      imageUrl: 'images/product02.png',
      price: 20.0,
      colors: [Color(0xFF3366FF)],
      type: 'Type 2',
      description: 'Description of Product 2',
    ),
    Product(
      title: 'Product 3 jsjdk',
      imageUrl: 'images/product03.jpeg',
      price: 10.0,
      colors: [Color(0xFFFF5733)],
      type: 'Type 3',
      description: 'Description of Product 3',
    ),
    Product(
      title: 'Product 4 sdg',
      imageUrl: 'images/product04.png',
      price: 20.0,
      colors: [Color(0xFF3366FF)],
      type: 'Type 4',
      description: 'Description of Product 4',
    ),
    Product(
      title: 'Product fdg',
      imageUrl: 'images/product05.png',
      price: 10.0,
      colors: [Color(0xFFFF5733)],
      type: 'Type 5',
      description: 'Description of Product 5',
    ),
    Product(
      title: 'Product stgdg',
      imageUrl: 'images/product06.png',
      price: 20.0,
      colors: [Color(0xFF3366FF)],
      type: 'Type 6',
      description: 'Description of Product 6',
    ),
    Product(
      title: 'Product dtgd',
      imageUrl: 'images/product07.png',
      price: 10.0,
      colors: [Color(0xFFFF5733)],
      type: 'Type 7',
      description: 'Description of Product 7',
    ),
  ];


  Home ({super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: products[index]),
                    ),
                  );
                },
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(products[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Text('\$${products[index].price.toString()}'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
            ],
          );
        },
      ),

    );
  }
}



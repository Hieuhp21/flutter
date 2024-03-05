import 'package:flutter/material.dart';
import '../models/product.dart';

class ShowAllProductsScreen extends StatelessWidget {
  final List<Product> products; // List of products

  const ShowAllProductsScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                title: Text(products[index].name),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Text(' ${products[index].code}'),
                    ),
                    Expanded(
                      child: Text(' \$${products[index].price}'),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: _getColor(products[index].color),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Yellow':
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }
}

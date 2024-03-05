import 'package:add_pr/screens/show_all_product.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import 'add_product_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> products =sampleProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Navigate to AddProductScreen and wait for result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductScreen()),
                );
                // Add new product to the list if result is not null
                if (result != null) {
                  setState(() {
                    products.add(result);
                  });
                }
              },
              child: Text('ADD NEW PRODUCT'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowAllProductsScreen(products: products)),
                );
              },
              child: Text('SHOW ALL PRODUCT'),
            ),
          ],
        ),
      ),
    );
  }
}
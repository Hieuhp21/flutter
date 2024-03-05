import 'package:flutter/material.dart';

import '../models/product.dart';

class AddProductScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String selectedColor = 'Red'; // Default color
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: codeController,
              decoration: InputDecoration(labelText: 'Code'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Row(
              children: [
                Text('Color:'),
                SizedBox(width: 30),
                DropdownButton<String>(
                  value: selectedColor,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      // Update selectedColor when dropdown value changes
                      selectedColor = newValue;
                    }
                  },
                  items: <String>['Red', 'Green', 'Blue', 'Yellow'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save product
                Product newProduct = Product(
                  code: codeController.text,
                  name: nameController.text,
                  color: selectedColor,
                  price: double.parse(priceController.text),
                );
                // Return the new product to the previous screen
                Navigator.pop(context, newProduct);
              },
              child: Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }
}
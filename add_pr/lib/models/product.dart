class Product {
  final String code;
  final String name;
  final String color;
  final double price;

  Product({required this.code, required this.name, required this.color, required this.price});
}
List<Product> sampleProducts = [
  Product(code: '001', name: 'Product 1', color: 'Red', price: 10.0),
  Product(code: '002', name: 'Product 2', color: 'Green', price: 15.0),
  Product(code: '003', name: 'Product 3', color: 'Blue', price: 20.0),
  Product(code: '004', name: 'Product 4', color: 'Yellow', price: 25.0),
];
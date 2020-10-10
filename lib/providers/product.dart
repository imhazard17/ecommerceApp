import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Product {
  final String id;
  String title, content;
  bool isFav;
  int price;

  Product({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.isFav,
    @required this.price,
  });
}

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(content: '', id: '1', isFav: false, price: 179, title: 'Shirt'),
    Product(content: '', id: '2', isFav: false, price: 5499, title: 'mic'),
    Product(content: '', id: '3', isFav: false, price: 399, title: 'sd card'),
  ];
  bool _showImpOnly = false;
  List<Product> get products => !_showImpOnly
      ? [..._products]
      : _products.where((product) => product.isFav).toList();
  bool get showImpOnly => _showImpOnly;

  void changeShowImpOnly() {
    _showImpOnly = !_showImpOnly;
    notifyListeners();
  }

  void addProduct(String title, String content, int price) {
    _products.add(Product(
      id: UniqueKey().toString(),
      title: title,
      content: content,
      price: price,
      isFav: false,
    ));
    notifyListeners();
  }

  void removeProduct(String id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void updateProduct(String id, String title, String content, int price) {
    _products.forEach((product) {
      if (product.id == id) {
        product.title = title;
        product.content = content;
        product.price = price;
      }
      notifyListeners();
    });
  }

  void changeFavStatus(String id) {
    _products.forEach((product) {
      if (product.id == id) product.isFav = !product.isFav;
    });
    notifyListeners();
  }
}

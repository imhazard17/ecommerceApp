import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/product.dart';

class WishlistedProduct {
  final Product product;
  int count;

  WishlistedProduct({@required this.product, @required this.count});
}

class CartProvider with ChangeNotifier {
  Map<String, WishlistedProduct> _wishListedProds = {};
  Map<String, WishlistedProduct> get wishListedProds => _wishListedProds;
  bool productInCart(String id) => _wishListedProds.containsKey(id);

  void addToCart(Product product) {
    if (_wishListedProds.containsKey(product.id))
      incrementCount(product.id);
    else
      _wishListedProds[product.id] =
          WishlistedProduct(product: product, count: 0);
    notifyListeners();
  }

  void incrementCount(String prodId) {
    _wishListedProds[prodId].count++;
    notifyListeners();
  }

  void decrementCount(String prodId) {
    _wishListedProds[prodId].count--;
    notifyListeners();
  }
}

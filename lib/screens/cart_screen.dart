import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final Map<String, WishlistedProduct> wlProds = cartProvider.wishListedProds;

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: wlProds.length,
        itemBuilder: (context, index) => Card(
          elevation: 4,
          child: ListTile(
            title: Text(wlProds.keys.toList()[index]),
            subtitle: Text('Count ${wlProds.values.toList()[index].count}'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';

class ProductTile extends StatelessWidget {
  final ProductProvider prodProvider;
  final Product product;
  const ProductTile({@required this.prodProvider, @required this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Text('image de ekhane'),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: product.isFav
              ? Icon(Icons.favorite, color: Colors.deepOrange)
              : Icon(Icons.favorite_border),
          onPressed: () => prodProvider.changeFavStatus(product.id),
        ),
        title: Text(product.title),
        trailing: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            print(product.id);
            return Icon(
              Icons.shopping_cart,
              color: cartProvider.productInCart(product.id)
                  ? Colors.deepOrangeAccent
                  : Colors.grey[500],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sys_test/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    // print([cart]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            title: Text(
              cartItem["title"] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem["imageUrl"] as String),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () => {
                showDialog(
                  barrierDismissible: false,
                  context: (context),
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text("Are You sure to delete this product"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "No",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeProducts(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                )
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
            subtitle: Text("Size : ${cartItem["size"].toString()}"),
          );
        },
      ),
    );
  }
}

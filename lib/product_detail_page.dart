import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sys_test/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late int selectedSize = 0;
  @override
  initState() {
    super.initState();
    selectedSize = 0;
  }

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProducts({
        "id": widget.product["id"],
        "title": widget.product["title"],
        "price": widget.product["price"],
        "imageUrl": widget.product["imageUrl"],
        "company": widget.product["company"],
        "size": selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Added to cart!"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a Size!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              widget.product["title"] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                "${widget.product["imageUrl"]}",
                alignment: Alignment.bottomLeft,
              ),
            ),
            const Spacer(),
            Container(
              width: 1000,
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "\$${widget.product["price"]} Only",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product["sizes"] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product["sizes"] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                              label: Text(
                                size.toString(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(
                          double.infinity,
                          50,
                        ),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

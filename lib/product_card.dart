import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color? backgroundColor;

  const ProductCard({
    super.key,
    required this.backgroundColor,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      // color: const Color.fromARGB(255, 152, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Image(
              height: 160,
              image: AssetImage("$image"),
            ),
          ),
        ],
      ),
    );
  }
}

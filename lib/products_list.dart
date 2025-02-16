import 'package:flutter/material.dart';
import 'package:sys_test/global_variables.dart';
import 'package:sys_test/home_page.dart';
import 'package:sys_test/product_card.dart';
import 'package:sys_test/product_detail_page.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});
  static const border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 220, 220, 0.5),
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(
        50,
      ),
    ),
  );

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> filters = const ["All", "Addiadas", "Nike", "Bata"];
  late String selectedFilter;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Shoes Shop",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: ProductsList.border,
                    enabledBorder: ProductsList.border,
                    focusedBorder: ProductsList.border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                String filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      backgroundColor: selectedFilter == filter
                          // ? Colors.amber
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(
                              80,
                              158,
                              158,
                              158,
                            ),
                      label: Text(
                        filter,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailPage(
                            product: product,
                          );
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product["title"] as String,
                    price: product["price"] as double,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(158, 158, 158, 0.835)
                        : const Color.fromRGBO(0, 188, 212, 1),
                    // image: "assets/images/shoes_1.png",
                    image: product["imageUrl"] as String,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

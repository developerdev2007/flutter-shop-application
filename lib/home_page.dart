import 'package:flutter/material.dart';
import 'package:sys_test/global_variables.dart';
import 'package:sys_test/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ["All", "Addiadas", "Nike", "Bata"];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      border: HomePage.border,
                      enabledBorder: HomePage.border,
                      focusedBorder: HomePage.border,
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
                        // print("object");
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
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product["title"] as String,
                    price: product["price"] as double,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(158, 158, 158, 0.835)
                        : const Color.fromRGBO(0, 188, 212, 1),
                    // image: "assets/images/shoes_1.png",
                    image: product["imageUrl"] as String,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

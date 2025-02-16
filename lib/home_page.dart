import 'package:flutter/material.dart';
import 'package:sys_test/cart_page.dart';
import 'package:sys_test/products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 0;
  }

  final List<Widget> pages = const [
    ProductsList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[currentPage],
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (val) {
          setState(() {
            currentPage = val;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            label: "data",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Dev",
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}

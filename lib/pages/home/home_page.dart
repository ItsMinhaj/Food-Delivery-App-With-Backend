import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart/cart_item_list.dart';
import 'package:food_delivery/pages/favorite/favortie_item_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utlis/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  var pages = [
    const MainFoodPage(),
    FavoriteItemPage(),
    CartItemListScreen(),
    const SizedBox(child: Center(child: Text("Profile Page"))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}

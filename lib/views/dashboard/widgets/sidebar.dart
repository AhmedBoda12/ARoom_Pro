import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'menu_tile.dart';

class Sidebar extends StatelessWidget {
  final String activeMenu;
  final Function(String) setActiveMenu;

  const Sidebar({
    super.key,
    required this.activeMenu,
    required this.setActiveMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/aroom_logo.png'),
            const Divider(),
            MenuTile(
              title: "Home",
              icon: Icons.home_rounded,
              isActive: activeMenu == 'Home',
              onPressed: () => setActiveMenu('Home'),
            ),
            const SizedBox(
              height: 8,
            ),
            MenuTile(
              title: 'Shop',
              icon: Icons.store_mall_directory_rounded,
              isActive: activeMenu == 'Shop',
              onPressed: () => setActiveMenu('Shop'),
            ),
            MenuTile(
              title: 'Add Product',
              icon: Icons.add_box_rounded,
              isActive: activeMenu == 'Add Product',
              onPressed: () => setActiveMenu('Add Product'),
            ),
            const SizedBox(
              height: 8,
            ),
            MenuTile(
              title: 'Customers',
              icon: Icons.people,
              isActive: activeMenu == 'Customers',
              onPressed: () => setActiveMenu('Customers'),
            ),
            const SizedBox(
              height: 8,
            ),
            MenuTile(
              title: 'Orders',
              icon: Icons.shopping_bag_rounded,
              isActive: activeMenu == 'Orders',
              onPressed: () => setActiveMenu('Orders'),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

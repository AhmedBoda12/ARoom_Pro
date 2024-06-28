import 'package:aroom_pro/views/dashboard/widgets/menu_list.dart';
import 'package:aroom_pro/views/dashboard/widgets/menu_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String activeMenu = 'Home';

  void setActiveMenu(String menu) {
    setState(() {
      activeMenu = menu;
    });
  }

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
            MenuList(
              title: 'Products',
              icon: Icons.category_rounded,
              children: [
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
              ],
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
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

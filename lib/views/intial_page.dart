import 'package:aroom_pro/cubits/category_cubit/cubit/category_cubit.dart';
import 'package:aroom_pro/cubits/product_cubit/cubit/product_cubit.dart';
import 'package:aroom_pro/views/home_page.dart';
import 'package:aroom_pro/views/notification_page.dart';
import 'package:aroom_pro/views/user_profile_page.dart';
import 'package:aroom_pro/views/wishlist_page.dart';
import 'package:aroom_pro/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class IntialPage extends StatefulWidget {
  const IntialPage({super.key});
  static const String routeName = 'HomePage';

  @override
  State<IntialPage> createState() => _IntialPageState();
}

class _IntialPageState extends State<IntialPage> {
  int selected = 0;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
          ),
          iconSize: 30,
        ),
        // title: Image.asset(
        //   'assets/aroom_logo.png',
        //   width: 100,
        //   height: 100,
        // ),
        // centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, UserProfilePage.routeName),
              child: CircleAvatar(
                radius: 20,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            selectedColor: Theme.of(context).primaryColor,
            title: const Text('Home'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.favorite_outline_rounded,
              ),
              selectedIcon: const Icon(
                Icons.favorite_rounded,
              ),
              selectedColor: Theme.of(context).primaryColor,
              title: const Text('Favorites')),
          BottomBarItem(
            icon: const Icon(Icons.notifications_none_rounded),
            selectedIcon: const Icon(Icons.notifications_rounded),
            selectedColor: Theme.of(context).primaryColor,
            title: const Text('Notifications'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              selectedIcon: const Icon(
                Icons.shopping_cart,
              ),
              selectedColor: Theme.of(context).primaryColor,
              title: const Text('Cart')),
        ],
        option: AnimatedBarOptions(
          iconSize: 25,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
        ),
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.circle,
        onTap: (index) {
          if (index == selected) return;
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FloatingActionButton(
                onPressed: () {},
                shape: const CircleBorder(),
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.view_in_ar_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: CategoryCubit()..loadCategories(),
                ),
                BlocProvider.value(
                  value: ProductCubit()..getAllProducts(),
                ),
              ],
              child: const HomePage(),
            ),
            const WishlistPage(),
            const NotificationPage(),
            const EmptyWidget(
                text: 'Your cart is empty', image: 'assets/aroom_logo.png'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      appBar: AppBar(),
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
                Icons.person_outline_rounded,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              selectedColor: Theme.of(context).primaryColor,
              title: const Text('Profile')),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: FloatingActionButton(
          onPressed: () {},
          // shape: const CircleBorder(),
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
          children: const [
            Center(child: Text('Home')),
            Center(child: Text('Star')),
            Center(child: Text('Style')),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}

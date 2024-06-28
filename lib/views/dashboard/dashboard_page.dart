import 'package:aroom_pro/views/dashboard/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:aroom_pro/views/dashboard/widgets/home_dashboard_widgets/overview.dart';
import 'package:aroom_pro/views/dashboard/widgets/home_dashboard_widgets/popular_products.dart';
import 'package:aroom_pro/views/dashboard/widgets/home_dashboard_widgets/recent_feedback.dart';
import 'package:aroom_pro/views/dashboard/widgets/sidebar.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String activeMenu = 'Home';

  void setActiveMenu(String menu) {
    setState(() {
      activeMenu = menu;
    });
    _drawerKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (activeMenu) {
      case 'Home':
        content = ListView(
          children: const [
            Overview(),
            SizedBox(height: 16),
            PopularProducts(),
            SizedBox(height: 16),
            RecentFeedback(),
          ],
        );
        break;
      case 'Shop':
        content = const Center(child: Text('Shop Page'));
        break;
      case 'Add Product':
        content = const AddProductPage();
        break;
      case 'Customers':
        content = const Center(child: Text('Customers Page'));
        break;
      case 'Orders':
        content = const Center(child: Text('Orders Page'));
        break;
      default:
        content = const Center(child: Text('Page not found'));
        break;
    }

    return Scaffold(
      key: _drawerKey,
      drawer: Sidebar(
        activeMenu: activeMenu,
        setActiveMenu: setActiveMenu,
      ),
      appBar: AppBar(
        title: Text(activeMenu),
        leading: IconButton(
          onPressed: () {
            _drawerKey.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: content,
    );
  }
}

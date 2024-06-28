import 'package:aroom_pro/constants/ghaps.dart';
import 'package:aroom_pro/views/dashboard/widgets/overview.dart';
import 'package:aroom_pro/views/dashboard/widgets/popular_products.dart';
import 'package:aroom_pro/views/dashboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Dashboard'),
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
              )),
          // IconButton(
          //   icon: Icon(
          //     Icons.logout,
          //     color: Theme.of(context).primaryColor,
          //   ),
          //   onPressed: () {
          //     FirebaseAuth.instance.signOut();
          //   },
          // ),
        ],
      ),
      body: ListView(
        children: const [
          Overview(),
          gapH16,
          PopularProducts(),
        ],
      ),
    );
  }
}

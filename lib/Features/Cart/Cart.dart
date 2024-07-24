import 'package:aroom_pro/Features/Cart/widgets/cartitem.dart';
import 'package:aroom_pro/Features/confirmation/confirmation_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const String routeName = 'CartPage';
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem('claire 40" lamp', 799, 'assets/chair.png', 1),
    CartItem('claire 40" lamp', 799, 'assets/chair.png', 1),
  ];

  int get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void updateQuantity(int index, int quantity) {
    setState(() {
      cartItems[index].quantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  onQuantityChanged: (quantity) =>
                      updateQuantity(index, quantity),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grand Total',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$totalAmount LE',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, ConfirmPage.routeName),
                  child: Text(
                    'Check Out Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

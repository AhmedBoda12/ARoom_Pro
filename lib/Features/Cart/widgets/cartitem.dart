import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final int price;
  final String imageUrl;
  int quantity;

  CartItem(this.name, this.price, this.imageUrl, this.quantity);
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final ValueChanged<int> onQuantityChanged;

  const CartItemWidget(
      {super.key, required this.cartItem, required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 130,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 35.0),
                      child: Text(
                        cartItem.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 35.0),
                      child: Text(
                        '${cartItem.price} LE',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.remove_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              onQuantityChanged(cartItem.quantity - 1);
                            }
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartItem.quantity}',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            onQuantityChanged(cartItem.quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5),
              child: Image.asset(
                cartItem.imageUrl,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
    // ListTile(
    //   leading:
    //   Image.asset(cartItem.imageUrl),
    //   title: Text(cartItem.name),
    //   subtitle: Text('${cartItem.price}LE'),
    //   trailing: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       IconButton(
    //         icon: const Icon(Icons.remove),
    //         onPressed: () {},
    //       ),
    //       const Text('1'),
    //       IconButton(
    //         icon: const Icon(Icons.add),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    // ),
  }
}

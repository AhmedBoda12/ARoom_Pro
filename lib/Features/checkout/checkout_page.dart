import 'package:aroom_pro/Features/checkout/LocationSelectionPage.dart';
import 'package:aroom_pro/Features/checkout/widgets/PaymentBottomSheet.dart';
import 'package:aroom_pro/Features/checkout/widgets/address_item.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const String routeName = 'CheckoutPage';

  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 240),
                  TextButton(
                    onPressed: () {},
                    child: Text('Edit',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ],
              ),
              addressitem(
                location:
                    '5482 Adobe Falls Rd #15\nSan Diego, California(CA), 92120',
                onpressed: () {
                  Navigator.pushNamed(context, LocationSelectionPage.routeName);
                },
                image: const AssetImage('assets/hqdefault.jpg'),
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Method',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  elevation: 0,
                  color: const Color(0xFfF1F4F8),
                  child: ListTile(
                      leading: Icon(Icons.credit_card,
                          color: Theme.of(context).primaryColor),
                      title: const Text('Master Card'),
                      subtitle: const Text('**** **** **** 1234'),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const PaymentMethodBottomSheet();
                          },
                        );
                      }),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Voucher Code',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  color: const Color(0xFfF1F4F8),
                  elevation: 0,
                  child: ListTile(
                    leading: Icon(Icons.local_offer,
                        color: Theme.of(context).primaryColor),
                    title: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter voucher code',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping cost', style: TextStyle(fontSize: 16)),
                  Text('750 LE', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub total', style: TextStyle(fontSize: 16)),
                  Text('15000 LE', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('15750 LE',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    // Handle checkout button press
                  },
                  child: const Text('Checkout Now',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:aroom_pro/Features/checkout/newpaymentpage.dart';
import 'package:flutter/material.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet,
                  color: Theme.of(context).primaryColor),
              title: Text('Paypal'),
              subtitle: Text('sask****@mail.com'),
              trailing: Radio(
                value: 'Paypal',
                groupValue: 'selectedPaymentMethod',
                onChanged: (value) {
                  // Handle radio button selection
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.credit_card,
                  color: Theme.of(context).primaryColor),
              title: const Text('Mastercard'),
              subtitle: const Text('4827 8472 7424 ****'),
              trailing: Radio(
                value: 'Mastercard',
                groupValue: 'selectedPaymentMethod',
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.add, color: Theme.of(context).primaryColor),
              title: Text('Add Payment Method'),
              onTap: () {
                Navigator.pushNamed(context, AddCardPage.routeName);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Apply payment method',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddCardPage extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();

  AddCardPage({super.key});
  static const String routeName = 'AddCardPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Card'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  labelText: 'Card Number',
                  hintText: 'Enter Card Number',
                  prefixIcon: Icon(
                    Icons.credit_card,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: cardHolderNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  labelText: 'Card Holder Name',
                  hintText: 'Enter Holder Name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: expiryDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  labelText: 'Expired',
                  hintText: 'MM/YY',
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: cvvCodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  labelText: 'CVV Code',
                  hintText: 'CCV',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add Card',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 2,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            hintText: 'What are you looking for?',
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      //  SearchBar(
      //   hintText: 'What are you looking for?',
      //   hintStyle: const WidgetStatePropertyAll(
      //     TextStyle(color: Colors.grey),
      //   ),
      //   leading: Icon(
      //     Icons.search,
      //     color: Theme.of(context).colorScheme.secondary,
      //   ),
      //   backgroundColor:
      //       WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
      //   elevation: const WidgetStatePropertyAll(1),
      // ),
    );
  }
}

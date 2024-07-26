import 'package:flutter/material.dart';

class LocationSelectionPage extends StatefulWidget {
  const LocationSelectionPage({super.key});
  static const String routeName = 'LocationSelectionPage';
  @override
  _LocationSelectionPageState createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  String selectedLocation = 'San Diego, CA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's find your unforgettable event. Choose a location below to get started.",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select location',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.orange),
              title: Text('San Diego, CA'),
              selected: selectedLocation == 'San Diego, CA',
              onTap: () {
                setState(() {
                  selectedLocation = 'San Diego, CA';
                });
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.orange),
                    title: Text('Los Angeles, United States'),
                    selected: selectedLocation == 'Los Angeles',
                    onTap: () {
                      setState(() {
                        selectedLocation = 'Los Angeles';
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on,
                        color: Theme.of(context).primaryColor),
                    title: const Text('Los Angeles, United States'),
                    selected: selectedLocation == 'Los Angeles',
                    onTap: () {
                      setState(() {
                        selectedLocation = 'Los Angeles';
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on,
                        color: Theme.of(context).primaryColor),
                    title: const Text('Los Angeles, United States'),
                    selected: selectedLocation == 'Los Angeles',
                    onTap: () {
                      setState(() {
                        selectedLocation = 'Los Angeles';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Perform confirm action
                },
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

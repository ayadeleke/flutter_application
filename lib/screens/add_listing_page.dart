import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_navigation_bar_widget.dart';
import 'main_layout.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddListingPageState createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name of Property',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Add Listing'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 2,
        onTap: (index) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => MainLayout(initialIndex: index)),
          );
        },
      ),
    );
  }
}

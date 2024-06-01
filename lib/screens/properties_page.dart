import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_navigation_bar_widget.dart';
import 'main_layout.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PropertiesPageState createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  final List<Map> properties = [
    {
      'name': 'Beachside Condo',
      'location': 'Miami, FL',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Urban Flat',
      'location': 'New York, NY',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Marina Condo',
      'location': 'Washington DC',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Home with Pool',
      'location': 'Minneapolis, MN',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Beach House',
      'location': 'Ontario, TX',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Home kind',
      'location': 'London, UK',
      'image': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PropertySearch(properties),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          var property = properties[index];
          return Card(
            child: ListTile(
              leading: Image.network(property['image']),
              title: Text(property['name']),
              subtitle: Text(property['location']),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 1,
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

class PropertySearch extends SearchDelegate<String> {
  final List<Map> properties;

  PropertySearch(this.properties);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = properties
        .where((p) => p['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var property = results[index];
        return ListTile(
          leading: Image.network(property['image']),
          title: Text(property['name']),
          subtitle: Text(property['location']),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = properties
        .where((p) => p['name'].toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        var property = suggestions[index];
        return ListTile(
          leading: Image.network(property['image']),
          title: Text(property['name']),
          subtitle: Text(property['location']),
        );
      },
    );
  }
}

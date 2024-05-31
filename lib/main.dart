// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Airbnb Update',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    //more properties
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
                  context: context, delegate: PropertySearch(properties));
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
              leading: Image.network(property['image']), // image URL
              title: Text(property['name']),
              subtitle: Text(property['location']),
            ),
          );
        },
      ),

      // Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          print('Add button pressed');
        },
        child: const Icon(Icons.add),
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            showSearch(context: context, delegate: PropertySearch(properties));
          }
        },
      ),
      Chip(
           label: Text('Tag'),
            backgroundColor: Colors.blue,
          ),
      // Menu  Items
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
          ],
        ),
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
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, ''));
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

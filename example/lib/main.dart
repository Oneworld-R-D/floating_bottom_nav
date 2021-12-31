import 'package:example/explorer.dart';
import 'package:example/favorites.dart';
import 'package:example/home.dart';
import 'package:example/profile.dart';
import 'package:floating_bottom_nav/floating_bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating NavBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final PageController _pageController = PageController(initialPage: 0);

  int _selectedIndex = 0;

  @override
  void initState() {
    setState(() {
      _selectedIndex = _pageController.initialPage;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating NavBar'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomePage(),
          ExplorePage(),
          FavoritesPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            _selectedIndex,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutQuad,
          );
        },
        items: const [
          Icons.home,
          Icons.explore,
          Icons.favorite,
          Icons.person,
        ],
      ),
    );
  }
}

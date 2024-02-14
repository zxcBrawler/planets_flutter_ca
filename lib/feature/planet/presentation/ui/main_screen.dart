import 'package:books_api/core/route/router.dart';
import 'package:books_api/core/route/router_utils.dart';
import 'package:books_api/feature/planet/presentation/widget/custom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final String location;
  final Widget child;
  const MainScreen({super.key, required this.location, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planets app')),
      body: SafeArea(child: widget.child),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: Text('Planets'),
              accountName: Text(
                'Planets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                router.go(Pages.home.screenPath);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favourite Planets'),
              onTap: () {
                Navigator.pop(context);
                router.go(Pages.favourite.screenPath);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Planets categories'),
              onTap: () {
                Navigator.pop(context);
                router.go(Pages.categories.screenPath);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          goOtherTab(context, value);
        },
        items: tabs,
        currentIndex: widget.location == Pages.home.screenPath
            ? 0
            : widget.location == Pages.favourite.screenPath
                ? 1
                : widget.location == Pages.categories.screenPath
                    ? 2
                    : -1,
      ),
    );
  }

  void goOtherTab(BuildContext context, int index) {
    if (index == _currentPage) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;

    setState(() {
      _currentPage = index;
    });
    router.go(location);
  }

  static List<CustomBottomNavItem> tabs = [
    CustomBottomNavItem(
      icon: const Icon(Icons.home),
      label: Pages.home.screenName,
      initialLocation: Pages.home.screenPath,
    ),
    CustomBottomNavItem(
      icon: const Icon(Icons.favorite_outline),
      label: Pages.favourite.screenName,
      initialLocation: Pages.favourite.screenPath,
    ),
    CustomBottomNavItem(
      icon: const Icon(Icons.book),
      label: Pages.categories.screenName,
      initialLocation: Pages.categories.screenPath,
    ),
  ];
}

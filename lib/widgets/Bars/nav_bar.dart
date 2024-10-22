import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/CINIMATEScreen/cinimate_screen.dart';
import 'package:movie_app/Screens/DownloadScreen/download_screen.dart';
import 'package:movie_app/Screens/HomeScreen/home_screen.dart';
import 'package:movie_app/Screens/Search/search_screen.dart';
import 'package:movie_app/Screens/Subscription/subscription_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CinimateScreen(),
    SubscriptionScreen(),
    DownloadScreen(),
    SearchScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 52, 53, 53).withOpacity(0.5),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: NavigationBar(
              height: 60,
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              backgroundColor: Colors.transparent,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_filled, color: Colors.white),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.movie, color: Colors.white),
                  label: 'CINIMATE',
                ),
                NavigationDestination(
                  icon: Icon(Icons.subscriptions, color: Colors.white),
                  label: 'Subcription',
                ),
                NavigationDestination(
                  icon: Icon(Icons.download, color: Colors.white),
                  label: 'Download',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'search',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projects/screens/home_screen.dart';
import 'package:projects/screens/post_screen.dart';
import 'package:projects/screens/settings_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  static const tabs = [
    HomeScreen(),
    PostScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(addListener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void addListener() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _tabController.animateTo(index);
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            label: 'Fav',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabNavigator(Navigator.of(context), const HomeScreen()),
          _buildTabNavigator(Navigator.of(context), const PostScreen()),
        ],
      ),
    );
  }

  Widget _buildTabNavigator(NavigatorState navigator, Widget page) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == "/settings") {
          return MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          );
        }
        if (settings.name == "/posts") {
          return MaterialPageRoute(
            builder: (context) => const PostScreen(),
          );
        }
        return MaterialPageRoute(
          builder: (context) => page,
        );
      },
    );
  }
}

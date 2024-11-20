import 'package:flutter/material.dart';
import 'components/color_button.dart';
import 'components/theme_button.dart';
import 'constants.dart';
import 'screens/explore_page.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.appTitle,
    required this.changeThemeMode,
    required this.changeColor,
    required this.colorSelected,
  });

  final String appTitle;
  final ColorSelection colorSelected;
  final void Function(bool useLightMode) changeThemeMode;
  final void Function(int value) changeColor;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Explore',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: 'Orders',
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined),
      label: 'Account',
      selectedIcon: Icon(Icons.person),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final pages = [
      ExplorePage(),
      const Center(
        child: Text(
          'Orders',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      const Center(
        child: Text(
          'Account',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(changeThemeMode: widget.changeThemeMode),
          ColorButton(
              changeColor: widget.changeColor,
              colorSelected: widget.colorSelected),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        destinations: appBarDestinations,
      ),
    );
  }
}

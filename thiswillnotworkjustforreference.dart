import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                    items: [
                      NavigationRailItem(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailItem(
                        icon: Icon(Icons.settings),
                        label: Text('Settings'),
                      ),
                    ],
                    onDestinationSelected: (int index) {
                      setState(() {
                        // Change the body of the screen depending on the selected item.
                        switch (index) {
                          case 0:
                            body = HomeScreen();
                            break;
                          case 1:
                            body = SettingsScreen();
                            break;
                        }
                      });
                    },
                  ),
                Flexible(child: body),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Responsive Layout'),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Home'),
                    onTap: () {
                      setState(() {
                        body = HomeScreen();
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Settings'),
                    onTap: () {
                      setState(() {
                        body = SettingsScreen();
                      });
                    },
                  ),
                ],
              ),
            ),
            body: body,
          );
        }
      },
    );
  }

  // The body of the screen that will be shown.
  Widget body = HomeScreen();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the Home Screen'),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the Settings Screen'),
    );
  }
}

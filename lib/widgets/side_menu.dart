import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const SideMenu({super.key, required this.scaffoldkey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  void navegate(BuildContext context, int index) {
    final menuItem = appMenuItems[index];
    context.push(menuItem.link);
    widget.scaffoldkey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          navegate(context, value);
          setState(() {
            navDrawerIndex = value;
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Main'),
          ),
          ...appMenuItems.map((menu) => NavigationDrawerDestination(
              icon: Icon(menu.icon), label: Text(menu.title)))
        ]);
  }
}

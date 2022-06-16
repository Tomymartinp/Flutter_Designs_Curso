import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart_outline, onPressed: () {}),
    PinterestButton(icon: Icons.search, onPressed: () {}),
    PinterestButton(icon: Icons.notifications_active, onPressed: () {}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {}),
  ];

  PinterestMenu({this.show = true});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: (show) ? 1 : 0,
        child: _PinterestMenuBackground(
            child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, spreadRadius: -5, blurRadius: 10)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButtons(index, menuItems[index])));
  }
}

class _PinterestMenuButtons extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButtons(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final selectedIcon = Provider.of<_MenuModel>(context).selectedIcon;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedIcon = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon,
            size: (selectedIcon == index) ? 30 : 25,
            color: (selectedIcon == index) ? Colors.pink : Colors.blueGrey),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _selectedIcon = 0;

  int get selectedIcon => _selectedIcon;

  set selectedIcon(int index) {
    _selectedIcon = index;
    notifyListeners();
  }
}


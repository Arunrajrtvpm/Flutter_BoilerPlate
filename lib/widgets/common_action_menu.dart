import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<CustomPopupMenuItem> items;

  const CustomPopupMenuButton({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        for (var item in items) {
          if (item.value == value) {
            item.onPress();
            break;
          }
        }
      },
      itemBuilder: (BuildContext context) {
        return items.map<PopupMenuEntry<String>>((item) {
          return PopupMenuItem<String>(
            value: item.value,
            child: Row(
              children: [
                Icon(item.icon),
                const SizedBox(width: 8),
                Text(item.title),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}

class CustomPopupMenuItem {
  final String value;
  final String title;
  final IconData icon;
  final Function onPress;

  CustomPopupMenuItem({
    required this.value,
    required this.title,
    required this.icon,
    required this.onPress,
  });
}

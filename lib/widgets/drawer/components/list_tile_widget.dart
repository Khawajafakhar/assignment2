import 'package:flutter/material.dart';
import '../../../consts/app_colors_strings.dart';

class DrawerListTileWidget extends StatelessWidget {
  const DrawerListTileWidget(
      {super.key, required this.title, required this.leading});
  final Widget? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading: leading,
        title: title,
      ),
    );
  }
}
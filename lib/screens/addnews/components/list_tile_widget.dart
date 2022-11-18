import 'package:flutter/material.dart';
import '../../../consts/app_colors_strings.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, this.leading, this.title, this.subTitle, this.trailing});
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.blackishGradient,
        ),
        child: ListTile(
          tileColor: Colors.black,
          leading: leading,
          title: title,
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: subTitle,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../res/consts/app_colors_strings.dart';
import '../../../../res/components/text_widget.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, this.leading, this.title, this.subTitle, this.trailing});
  final String? leading;
  final String? title;
  final String? subTitle;
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
          leading: CircleAvatar(
            child: Image.asset(leading!),
          ),
          title: TextWidget(
            txt: title,
            color: AppColors.colorWhite,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextWidget(
              txt: title,
              color: AppColors.colorWhite,
              fontSize: 12,
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}

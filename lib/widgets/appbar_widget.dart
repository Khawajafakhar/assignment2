import 'package:flutter/material.dart';
import './text_widget.dart';
import '../consts/app_colors_strings.dart';
import '../consts/app_img_strings.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget(
      {super.key,
      this.txt,
      this.islogo = false,
      this.isLeading = false,
      this.isTrailing = false,
      this.trailingIcon});
  final String? txt;
  final bool islogo;
  final bool isLeading;
  final bool isTrailing;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: isLeading
          ? IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(
                Icons.notes_rounded,
                size: 30,
              ))
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
      title: islogo
          ? SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                AppImages.imgLogo,
                fit: BoxFit.cover,
              ))
          : TextWidget(
              txt: txt,
              color: AppColors.colorWhite,
            ),
      actions: [
        isTrailing
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: trailingIcon ?? const SizedBox()),
              )
            : const SizedBox(),
      ],
      centerTitle: true,
      backgroundColor: AppColors.backGroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import '../../../consts/app_colors_strings.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
    setState(() {
      _value = !_value;
    });
        },
        child: Container(
    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,),
    child: _value
        ? const Icon(
            Icons.check_circle_outline,
            size: 30.0,
            color: AppColors.richTextBtnColor,
          )
        : Icon(
            Icons.circle_outlined,
            size: 30.0,
            color: AppColors.richTextBtnColor.withOpacity(0.5),
          ),
        ),
      );
    
  }
}
import 'package:flutter/material.dart';
import '../consts/app_text_strings.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, this.height, this.width, this.txt});
  double? width;
  double? height;
  String? txt;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: width,
              height: height,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(txt!),
              )),
        ));
  }
}

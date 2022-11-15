import 'package:assigment2/widgets/textfields/textfield_widget.dart';

import '../../consts/app_colors_strings.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../consts/app_text_strings.dart';
import '../../consts/ui_helper.dart';
import '../../consts/app_img_strings.dart';

class SignUpScreen extends StatelessWidget {
  static const routename = 'sign-up-screen';
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const AppBarWidget(txt: AppStrings.txtSignUp),
          body: SingleChildScrollView(
              child: Column(
            children: [
              UiHelper.verticalMedium,
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Image.asset(AppImages.imgLogo),
              ),
              UiHelper.verticalSmall,
              Form(
                  child: Column(
                children: [
                  TextFieldWidget(
                    textController: nameController,
                  hint: AppStrings.hintTxtName,
                  prefix: Icon(Icons.person),)
                ],
              ))
            ],
          )),
        ));
  }
}

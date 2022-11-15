import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../consts/app_text_strings.dart';
import '../../consts/app_colors_strings.dart';
import '../../consts/ui_helper.dart';
import '../../widgets/app_logo_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../consts/app_img_strings.dart';
import '../../widgets/buttons/elevated_button_widget.dart';
import '../../widgets/rich_text_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'forgot-pass-screen';
  ForgotPasswordScreen({super.key});
  final TextEditingController emailcont = TextEditingController();
  final GlobalKey<FormState> resetFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const AppBarWidget(txt: AppStrings.txtForgotPass),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  UiHelper.verticalMedium,
                  const AppLogoWidget(),
                  UiHelper.verticalSmall1,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextWidget(
                      txt: AppStrings.txtForgotScreen,
                      textAlign: TextAlign.center,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  UiHelper.verticalSmall1,
                  Form(
                      key: resetFormKey,
                      child: TextFieldWidget(
                        textController: emailcont,
                        prefix: Image.asset(AppImages.imgEmailIcon),
                        hint: AppStrings.hintTxtEmailOrPhone,
                      )),
                  UiHelper.verticalSmall1,
                  ButtonWidget(
                    height: 40,
                    width: double.infinity,
                    txt: AppStrings.txtSignIn,
                    fontSize: 18,
                  ),
                  UiHelper.verticalLarge,
                  const RichTextWidget(
                    txt: AppStrings.txtNewAcc,
                    txt2: AppStrings.txtSignUp,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

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
import '../../screens/resetpassword/reset_pass_screen.dart';
import '../signup/sign_up_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'forgot-pass-screen';
  ForgotPasswordScreen({super.key});
  final TextEditingController emailcont = TextEditingController();
  final GlobalKey<FormState> resetFormKey = GlobalKey();
  BuildContext? ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
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
                    txt: AppStrings.txtResetPass,
                    fontSize: 18,
                    onPressed: onResetPassPressed,
                  ),
                  UiHelper.verticalLarge,
                  RichTextWidget(
                    txt: AppStrings.txtNewAcc,
                    txt2: AppStrings.txtSignUp,
                    onPressed: onSignUpPressed,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void onResetPassPressed() {
    Navigator.of(ctx!).pushNamed(ResetPasswordScreen.routeName);
  }

  void onSignUpPressed() {
    Navigator.of(ctx!).pushNamed(SignUpScreen.routename);
  }
}

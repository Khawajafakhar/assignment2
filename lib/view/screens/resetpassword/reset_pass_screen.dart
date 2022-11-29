import 'package:flutter/material.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../consts/app_text_strings.dart';
import '../../../consts/app_colors_strings.dart';
import '../../../widgets/app_logo_widget.dart';
import '../../../consts/ui_helper.dart';
import '../../../widgets/text_widget.dart';
import '../../../widgets/textfields/password_textfield.dart';
import '../../../widgets/buttons/elevated_button_widget.dart';
import '../../../widgets/rich_text_widget.dart';
import '../signin/sign_in_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = 'resetpass-screen';
  ResetPasswordScreen({super.key});
  final TextEditingController passController = TextEditingController();
  final TextEditingController cnfrmPassController = TextEditingController();
  BuildContext? ctx;

  final GlobalKey<FormState> resetFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    FocusNode cnfrmPassFocus = FocusNode();
    ctx = context;
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const AppBarWidget(txt: AppStrings.txtResetPass),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                UiHelper.verticalMedium,
                const AppLogoWidget(),
                UiHelper.verticalSmall1,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextWidget(
                    txt: AppStrings.txtResetScreen,
                    textAlign: TextAlign.center,
                    color: AppColors.colorWhite,
                  ),
                ),
                UiHelper.verticalSmall1,
                Form(
                  key: resetFormKey,
                  child: Column(
                    children: [
                      PasswordTextField(
                        inputAction: TextInputAction.next,
                        controller: passController,
                        hint: AppStrings.hintTxtPass,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(cnfrmPassFocus),
                      ),
                      UiHelper.verticalXSmall,
                      PasswordTextField(
                        inputAction: TextInputAction.done,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).unfocus(),
                        focusNode: cnfrmPassFocus,
                        controller: cnfrmPassController,
                        hint: AppStrings.hintTxtCnfrmPass,
                      ),
                      UiHelper.verticalSmall1,
                      ButtonWidget(
                        height: 40,
                        width: double.infinity,
                        txt: AppStrings.txtSignUp,
                        fontSize: 18,
                      )
                    ],
                  ),
                ),
                UiHelper.verticalMedium,
                RichTextWidget(
                  txt: AppStrings.backToTxt,
                  txt2: AppStrings.txtSignIn,
                  onPressed: onSignInPressed,
                )
              ],
            ),
          )),
        ));
  }

  void onSignInPressed() {
    Navigator.of(ctx!).popAndPushNamed(SignInScreen.routeName);
  }
}

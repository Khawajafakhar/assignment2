import 'package:assigment2/widgets/buttons/elevated_button_widget.dart';
import 'package:assigment2/widgets/textfields/textfield_widget.dart';
import '../../consts/app_colors_strings.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../consts/app_text_strings.dart';
import '../../consts/ui_helper.dart';
import '../../consts/app_img_strings.dart';
import '../../widgets/textfields/password_textfield.dart';
import '../../widgets/rich_text_widget.dart';
import '../signin/sign_in_screen.dart';
import '../../widgets/app_logo_widget.dart';

class SignUpScreen extends StatelessWidget {
  static const routename = 'sign-up-screen';
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cnfrmPassController = TextEditingController();
  BuildContext? ctx;

  @override
  Widget build(BuildContext context) {
    ctx=context;
    FocusNode emailFocus=FocusNode();
    FocusNode passFocus=FocusNode();
    FocusNode cnfrmPassFocus = FocusNode();
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const AppBarWidget(txt: AppStrings.txtSignUp),
          body: SingleChildScrollView(
              child: Column(
            children: [
              UiHelper.verticalMedium,
             const AppLogoWidget(),
              UiHelper.verticalSmall1,
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(emailFocus),
                      textController: nameController,
                      inputAction: TextInputAction.next,
                      hint: AppStrings.hintTxtName,
                      prefix: Image.asset(AppImages.imgIconUser),
                    ),
                    UiHelper.verticalXSmall,
                    TextFieldWidget(
                      focusNode: emailFocus,
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(passFocus),
                      textController: emailController,
                      inputAction: TextInputAction.next,
                      hint: AppStrings.hintTxtEmail,
                      prefix: Image.asset(AppImages.imgEmailIcon),
                    ),
                    UiHelper.verticalXSmall,
                    PasswordTextField(
                      focusNode: passFocus,
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(cnfrmPassFocus),
                      controller: passController,
                      hint: AppStrings.hintTxtPass,
                      inputAction: TextInputAction.next,
                    ),
                    UiHelper.verticalXSmall,
                     PasswordTextField(
                      focusNode: cnfrmPassFocus,
                      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                      controller: cnfrmPassController,
                      hint: AppStrings.hintTxtCnfrmPass,
                      inputAction: TextInputAction.done,
                    ),
                    UiHelper.verticalSmall,
                     ButtonWidget(
                        height: 40,
                        width: double.infinity,
                        txt: AppStrings.txtSignUp,
                        fontSize: 18,
                      )
                  ],
                ),
              )),
              UiHelper.verticalMedium,
               RichTextWidget(
              txt: AppStrings.haveAccTxt,
              txt2: AppStrings.txtSignIn,
              onPressed: onPressed,
            ),
            ],
          )),
        ));
  }
  void onPressed(){
    Navigator.of(ctx!).pushNamed(SignInScreen.routeName);
  }
}

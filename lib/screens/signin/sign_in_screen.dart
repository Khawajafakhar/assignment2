import 'package:assigment2/widgets/buttons/elevated_button_widget.dart';
import '../../widgets/buttons/text_button.dart';
import '../../consts/app_colors_strings.dart';
import '../../consts/app_img_strings.dart';
import 'package:flutter/material.dart';
import '../../consts/app_text_strings.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../consts/ui_helper.dart';
import '../../widgets/textfields/password_textfield.dart';
import './components/social_accounts.dart';
import './components/rich_text_widget.dart';
import '../../widgets/appBar_widget.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = 'signin-screen';
  SignInScreen({super.key});
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        appBar: const AppBarWidget(txt: AppStrings.txtSignIn),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            UiHelper.verticalMedium,
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Image.asset(AppImages.imgLogo),
            ),
            UiHelper.verticalSmall1,
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      TextFieldWidget(
                        textController: emailController,
                        hint: AppStrings.hintTxtEmail,
                        prefix: Image.asset(AppImages.imgEmailIcon),
                        inputAction: TextInputAction.next,
                      ),
                      UiHelper.verticalSmall,
                      PasswordTextField(
                        controller: passController,
                        hint: AppStrings.hintTxtPass,
                      ),
                      UiHelper.verticalXSmall,
                      const TextButtonwidget(
                          txt: AppStrings.btnTxtForgotPass,
                          align: Alignment.topRight),
                      ButtonWidget(
                        height: 40,
                        width: double.infinity,
                        txt: AppStrings.txtSignIn,
                        fontSize: 18,
                      )
                    ],
                  ),
                )),
            UiHelper.verticalXSmall,
            const SocialAccountWidget(),
            UiHelper.verticalMedium,
            const RichTextWidget(
              txt: AppStrings.txtNewAcc,
              txt2: AppStrings.txtSignUp,
            ),
          ]),
        ),
      ),
    );
  }
}

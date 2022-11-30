import 'package:assigment2/res/components/buttons/elevated_button_widget.dart';
import '../../../res/components/buttons/text_button.dart';
import '../../../res/consts/app_colors_strings.dart';
import '../../../res/consts/app_img_strings.dart';
import 'package:flutter/material.dart';
import '../../../res/consts/app_text_strings.dart';
import '../../../res/components/textfields/textfield_widget.dart';
import '../../../res/consts/ui_helper.dart';
import '../../../res/components/textfields/password_textfield.dart';
import './components/social_accounts.dart';
import '../../../res/components/rich_text_widget.dart';
import '../../../res/components/appBar_widget.dart';
import '../../../res/components/app_logo_widget.dart';
import '../../../api/models/signin_model.dart';
import '../../../validation/loc_validation.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  BuildContext? ctx;
  bool isLoading = false;
  SignInData data = SignInData(
    email: null,
    pass: null,
  );

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        appBar: const AppBarWidget(
          txt: AppStrings.txtSignIn,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UiHelper.verticalMedium,
                      const AppLogoWidget(),
                      UiHelper.verticalSmall1,
                      Form(
                          key: formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  textController: emailController,
                                  hint: AppStrings.hintTxtEmail,
                                  prefix: Image.asset(AppImages.imgEmailIcon),
                                  inputAction: TextInputAction.next,
                                  inputType: TextInputType.emailAddress,
                                  validator: (value) =>
                                      Validation.isEmailValid(value!),
                                  onSave: (value) => data.email = value,
                                ),
                                UiHelper.verticalXSmall,
                                PasswordTextField(
                                  controller: passController,
                                  hint: AppStrings.hintTxtPass,
                                  inputAction: TextInputAction.done,
                                  inputType: TextInputType.visiblePassword,
                                  validator: (value) =>
                                      Validation.isPasswordValid(value!),
                                  onSave: (value) => data.pass = value,
                                ),
                                UiHelper.verticalXSmall,
                                TextButtonwidget(
                                  txt: AppStrings.btnTxtForgotPass,
                                  align: Alignment.topRight,
                                  onPressed: onForgotPressed,
                                ),
                                ButtonWidget(
                                  height: 40,
                                  width: double.infinity,
                                  txt: AppStrings.txtSignIn,
                                  fontSize: 18,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = !isLoading;
                                      });
                                      formKey.currentState!.save();

                                      await context.read<AuthViewProvider>().loginApi(
                                          data, context);
                                      setState(() {
                                        isLoading = !isLoading;
                                      });
                                    }
                                  },
                                )
                              ],
                            ),
                          )),
                      UiHelper.verticalXSmall,
                      const SocialAccountWidget(),
                      UiHelper.verticalMedium,
                      RichTextWidget(
                        txt: AppStrings.txtNewAcc,
                        txt2: AppStrings.txtSignUp,
                        onPressed: onSignUpPressed,
                      ),
                    ]),
              ),
      ),
    );
  }

  void onSignUpPressed() {
    Navigator.pushNamed(ctx!, RoutesName.signUp);
  }

  void onForgotPressed() {
    Navigator.pushNamed(ctx!, RoutesName.forgotPassword);
  }
}

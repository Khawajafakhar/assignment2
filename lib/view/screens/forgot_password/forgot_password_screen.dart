import 'package:assigment2/view_model/auth_provider.dart';
import 'package:flutter/material.dart';
import '../../../res/components/appbar_widget.dart';
import '../../../res/consts/app_text_strings.dart';
import '../../../res/consts/app_colors_strings.dart';
import '../../../res/consts/ui_helper.dart';
import '../../../res/components/app_logo_widget.dart';
import '../../../res/components/text_widget.dart';
import '../../../res/components/textfields/textfield_widget.dart';
import '../../../res/consts/app_img_strings.dart';
import '../../../res/components/buttons/elevated_button_widget.dart';
import '../../../res/components/rich_text_widget.dart';
import '../../../validation/loc_validation.dart';
import '../../../utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailcont = TextEditingController();

  final GlobalKey<FormState> resetFormKey = GlobalKey();

  BuildContext? ctx;
  bool isLoading = false;
  String? email;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const AppBarWidget(txt: AppStrings.txtForgotPass),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
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
                              validator: (val) => Validation.isEmailValid(val!),
                            )),
                        UiHelper.verticalSmall1,
                        ButtonWidget(
                          height: 40,
                          width: double.infinity,
                          txt: AppStrings.txtResetPass,
                          fontSize: 18,
                          onPressed: () async {
                            if (resetFormKey.currentState!.validate()) {
                              setState(() {
                                isLoading = !isLoading;
                              });
                              email = emailcont.text;
                              await context
                                  .read<AuthViewProvider>()
                                  .forgotPasswordApi(
                                    email,
                                    context,
                                  );
                              setState(() {
                                isLoading = !isLoading;
                              });
                            }
                          },
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

  // void onResetPassPressed() async {
  //   if (resetFormKey.currentState!.validate()) {
  //     setState(() {
  //       isLoading = !isLoading;
  //     });
  //     email = emailcont.text;
  //     await AuthApiService.forgotPassword(email!).then((response) {
  //       if (response == true) {
  //         setState(() {
  //           isLoading = !isLoading;
  //         });

  //         Navigator.pushNamed(ctx!, RoutesName.resetPassword);
  //       } else {
  //         setState(() {
  //           isLoading = !isLoading;
  //         });
  //         Utils.showToast('unable to reset password');
  //       }
  //     });
  //   }
  // }

  void onSignUpPressed() {
    Navigator.pushNamed(ctx!, RoutesName.signUp);
  }
}

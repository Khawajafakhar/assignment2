import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
import '../../validation/loc_validation.dart';
import 'package:provider/provider.dart';
import '../../api/api_service/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = 'forgot-pass-screen';
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
                              validator: (val) =>
                                  Validation.isEmailValid(val!),
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

  void onResetPassPressed() async {
    if (resetFormKey.currentState!.validate()) {
      setState(() {
        isLoading = !isLoading;
      });
      email = emailcont.text;
      final auth = Provider.of<AuthApiService>(ctx!,listen: false);
      await auth.forgotPassword(email!).then((response) {
        if (response == true) {
          setState(() {
            isLoading = !isLoading;
          });
          Fluttertoast.showToast(
                  msg: auth.restResponse.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  textColor: AppColors.colorWhite)
              .then((_) {
            Navigator.of(ctx!).pushNamed(ResetPasswordScreen.routeName);
          });
        } else {
          setState(() {
            isLoading = !isLoading;
          });
          Fluttertoast.showToast(
              msg: auth.error.toString(),
              toastLength: Toast.LENGTH_LONG,
              textColor: AppColors.colorWhite);
        }
      });
    }
  }

  void onSignUpPressed() {
    Navigator.of(ctx!).pushNamed(SignUpScreen.routename);
  }
}

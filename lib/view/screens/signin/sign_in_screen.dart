import 'package:assigment2/widgets/buttons/elevated_button_widget.dart';
import '../../../widgets/buttons/text_button.dart';
import '../../../consts/app_colors_strings.dart';
import '../../../consts/app_img_strings.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_text_strings.dart';
import '../../../widgets/textfields/textfield_widget.dart';
import '../../../consts/ui_helper.dart';
import '../../../widgets/textfields/password_textfield.dart';
import './components/social_accounts.dart';
import '../../../widgets/rich_text_widget.dart';
import '../../../widgets/appBar_widget.dart';
import '../../screens/signup/sign_up_screen.dart';
import '../../../widgets/app_logo_widget.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import '../../../api/api_service/auth_service.dart';
import '../../../api/models/signin_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../validation/loc_validation.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = 'signin-screen';
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
  SignInData data = SignInData(email: null, pass: null);

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
                                  onPressed: onSignInPressed,
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
    Navigator.of(ctx!).pushNamed(SignUpScreen.routename);
  }

  void onForgotPressed() {
    Navigator.of(ctx!).pushNamed(ForgotPasswordScreen.routeName);
  }

  void onSignInPressed() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = !isLoading;
      });
      formKey.currentState!.save();
      try {
        final response = await AuthApiService.logIn(data);
        if (response == true) {
          await Navigator.of(ctx!).pushNamed(DashBoardScreen.routeName);
          setState(() {
            isLoading = !isLoading;
          });
        } else if (response == false) {
          setState(() {
            isLoading = !isLoading;
          });
          Fluttertoast.showToast(
              msg: 'Unable to login',
              toastLength: Toast.LENGTH_LONG,
              textColor: AppColors.colorWhite);
        }
      } catch (error) {
        setState(() {
          isLoading = !isLoading;
        });
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_LONG,
            textColor: AppColors.colorWhite);
      }
    }
  }
}

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
import '../../api/models/signup_model.dart';
import '../../validation/loc_validation.dart';
import '../../api/api_service/auth_service.dart';
import '../dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  static const routename = 'sign-up-screen';
 const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cnfrmPassController = TextEditingController();
  final GlobalKey<FormState> signUpKey = GlobalKey();

  BuildContext? ctx;

  SignUpData data = SignUpData(
    firstName: null,
    lastname: null,
    email: null,
    pass: null,
    cnfrmPass: null,
  );

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    FocusNode emailFocus = FocusNode();
    FocusNode passFocus = FocusNode();
    FocusNode cnfrmPassFocus = FocusNode();
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const AppBarWidget(txt: AppStrings.txtSignUp),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    UiHelper.verticalMedium,
                    const AppLogoWidget(),
                    UiHelper.verticalSmall1,
                    Form(
                        key: signUpKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            children: [
                              TextFieldWidget(
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(emailFocus),
                                validator: (val) =>
                                    Validation.isUserNameValid(val!),
                                onSave: (val) {
                                  var splitted = val!.split(' ');
                                  data.firstName = splitted[0];
                                  data.lastname = splitted[1];
                                },
                                textController: nameController,
                                inputAction: TextInputAction.next,
                                hint: AppStrings.hintTxtName,
                                prefix: Image.asset(AppImages.imgIconUser),
                              ),
                              UiHelper.verticalXSmall,
                              TextFieldWidget(
                                focusNode: emailFocus,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(passFocus),
                                validator: (val) =>
                                    Validation.isEmailValid(val!),
                                onSave: (val) => data.email = val,
                                textController: emailController,
                                inputAction: TextInputAction.next,
                                hint: AppStrings.hintTxtEmail,
                                prefix: Image.asset(AppImages.imgEmailIcon),
                              ),
                              UiHelper.verticalXSmall,
                              PasswordTextField(
                                focusNode: passFocus,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(cnfrmPassFocus),
                                validator: (val) =>
                                    Validation.isPasswordValid(val!),
                                onSave: (val) => data.pass = val,
                                controller: passController,
                                hint: AppStrings.hintTxtPass,
                                inputAction: TextInputAction.next,
                              ),
                              UiHelper.verticalXSmall,
                              PasswordTextField(
                                focusNode: cnfrmPassFocus,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context).unfocus(),
                                validator: (val) =>
                                    Validation.isCnfrmPasswordValid(
                                        val!, passController),
                                onSave: (val) => data.cnfrmPass = val,
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
                                onPressed: onSignUpPressed,
                              )
                            ],
                          ),
                        )),
                    UiHelper.verticalMedium,
                    RichTextWidget(
                      txt: AppStrings.haveAccTxt,
                      txt2: AppStrings.txtSignIn,
                      onPressed: onSignInPressed,
                    ),
                  ],
                )),
        ));
  }

  void onSignInPressed() {
    Navigator.of(ctx!).pushNamed(SignInScreen.routeName);
  }

  Future<void> onSignUpPressed() async {
    if (signUpKey.currentState!.validate()) {
      setState(() {
        isLoading = !isLoading;
      });
      signUpKey.currentState!.save();
      try{final auth = Provider.of<AuthApiService>(context, listen: false);
      final response = await auth.signUp(data);
      if (response == true) {
        Navigator.of(ctx!).pushNamed(DashBoardScreen.routeName);
        
      } else if (response == false) {
        
        Fluttertoast.showToast(
            msg: auth.error.toString(),
            toastLength: Toast.LENGTH_LONG,
            textColor: AppColors.colorWhite);
      }}catch(error){
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_LONG,
            textColor: AppColors.colorWhite);
      }
      setState(() {
          isLoading = !isLoading;
        });
    }
  }
}

import 'package:assigment2/consts/app_colors_strings.dart';
import 'package:flutter/material.dart';
import './textfield_widget.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputAction? inputAction;
  final void Function(dynamic)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String?)? onSave;
  final TextInputType? inputType;
  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.inputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.onSave,
    this.inputType
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      inputType: widget.inputType,
      validator: widget.validator,
      onSave: widget.onSave,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textController: widget.controller,
      isObscure: isObscure,
      hint: widget.hint,
      inputAction: widget.inputAction,
      prefix:const  Icon(Icons.lock_outline,color: AppColors.colorWhite,),
      suffix: GestureDetector(
        child: Icon(
          isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.colorWhite,
        ),
        onTap: () {
          setState(() => isObscure = !isObscure);
        },
      ),
    );
  }
}

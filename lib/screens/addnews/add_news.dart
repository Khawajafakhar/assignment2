import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../consts/app_text_strings.dart';
import '../../consts/app_colors_strings.dart';
import '../../consts/ui_helper.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../widgets/text_widget.dart';

class AddNewsScreen extends StatelessWidget {
  static const routeName = 'add-news-screen';
  AddNewsScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode detailsFocus=FocusNode();
    FocusNode titleFocus=FocusNode();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        appBar:  AppBarWidget(txt: AppStrings.addNewstxt,isTrailing: true,trailingIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.add)),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UiHelper.verticalSmall,
                const TextWidget(
                  txt: AppStrings.titleTxt,
                  textAlign: TextAlign.left,
                  color: AppColors.colorWhite,
                  fontSize: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFieldWidget(
                    focusNode: titleFocus,
                    textController: titleController,
                    inputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(detailsFocus),
                  ),
                ),
                UiHelper.verticalXSmall,
                const TextWidget(
                  txt: AppStrings.detailsTxt,
                  textAlign: TextAlign.left,
                  color: AppColors.colorWhite,
                  fontSize: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFieldWidget(
                    focusNode: detailsFocus,
                    textController: detailsController,
                    inputAction: TextInputAction.newline,
                    maxLines: 8,
                  ),
                ),
                UiHelper.verticalXSmall,
                const TextWidget(
                  txt: AppStrings.matchTxt,
                  textAlign: TextAlign.left,
                  color: AppColors.colorWhite,
                  fontSize: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFieldWidget(
                    textController: searchController,
                    inputAction: TextInputAction.done,
                    fillColor: AppColors.backGroundColor,
                    hint: AppStrings.searchTxt,
                    suffix: const Icon(Icons.search_outlined,color: AppColors.colorWhite,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

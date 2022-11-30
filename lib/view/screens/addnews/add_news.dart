import 'package:flutter/material.dart';
import '../../../res/components/appbar_widget.dart';
import '../../../res/consts/app_text_strings.dart';
import '../../../res/consts/app_colors_strings.dart';
import '../../../res/consts/ui_helper.dart';
import '../../../res/components/textfields/textfield_widget.dart';
import '../../../res/components/text_widget.dart';
import './components/botom_sheet_content.dart';
import '../../../api/api_service/addnews_servics.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class AddNewsScreen extends StatefulWidget {
  static const routeName = 'add-news-screen';
  const AddNewsScreen({super.key});

  @override
  State<AddNewsScreen> createState() => _AddNewsScreenState();
}

class _AddNewsScreenState extends State<AddNewsScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController detailsController = TextEditingController();

  final TextEditingController searchController = TextEditingController();

  BuildContext? ctx;

  String? title;

  String? discription;

  int? matchId;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    FocusNode detailsFocus = FocusNode();
    FocusNode titleFocus = FocusNode();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBarWidget(
          txt: AppStrings.addNewstxt,
          isTrailing: true,
          trailingIcon:
              IconButton(onPressed: onAddPressed, icon: const Icon(Icons.add)),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(detailsFocus);
                            }),
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
                            inputAction: TextInputAction.none,
                            inputType: TextInputType.none,
                            fillColor: AppColors.backGroundColor,
                            hint: AppStrings.searchTxt,
                            borderSideColor: AppColors.colorWhite,
                            suffix: const Icon(
                              Icons.search_outlined,
                              color: AppColors.colorWhite,
                            ),
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              getBottomSheet();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void getBottomSheet() {
    showModalBottomSheet(
      context: ctx!,
      builder: (context) => const BottomSheetContent(),
    ).then((value) {
      matchId = value;
      searchController.text=value.toString();
    });
  }

  Future<void> onAddPressed() async {
    title = titleController.text;
    discription = detailsController.text;
    setState(() {
      isLoading = !isLoading;
    });
    try {
      final response = await AddNewsService.addNews(
          title: title, discription: discription, matchId: matchId);
      if (response == true) {
          Navigator.pushReplacementNamed(ctx!,RoutesName.dashBoaard);
        setState(() {
          isLoading = !isLoading;
        });
      } else {
        setState(() {
          isLoading = !isLoading;
        });
        Utils.showToast('Unable to add news');
      }
    } catch (error) {
      setState(() {
        isLoading = !isLoading;
      });
      Utils.showToast(error.toString());
    }
  }

}
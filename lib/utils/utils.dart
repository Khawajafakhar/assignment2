import 'package:fluttertoast/fluttertoast.dart';
import '../res/consts/app_colors_strings.dart';

class Utils{
static void showToast(String msg){
   Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_LONG,
            textColor: AppColors.colorWhite);
}
}
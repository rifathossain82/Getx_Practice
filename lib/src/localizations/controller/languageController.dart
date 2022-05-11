import 'package:get/get.dart';
import 'package:get_x_demo/src/localizations/language/bn.dart';
import 'package:get_x_demo/src/localizations/language/en.dart';

class LanguageController extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US' : enLang,
    'bn_BD' : bnLang
  };

}
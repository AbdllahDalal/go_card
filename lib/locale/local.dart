import 'package:get/get.dart';

import 'translations/ar_eg.dart';
import 'translations/de_de.dart';
import 'translations/en_us.dart';
import 'translations/fr_fr.dart';
import 'translations/ru_ru.dart';
import 'translations/zh_cn.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": arabicTranslation,
        "en": englishTranslation,
        "zh": chineseTranslation,
        "fr": frenchTranslation,
        "de": germanTranslation,
        "ru": russianTranslation
      };
}

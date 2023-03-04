import 'package:base_flutter/languages/locale/vi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'locale/base.dart';
import 'locale/en.dart';

enum SupportedLocales { english, vietnam }

extension SupportedLocalesX on SupportedLocales {
  Locale get locale {
    switch (this) {
      case SupportedLocales.english:
        return const Locale('en');
      case SupportedLocales.vietnam:
        return const Locale('vi');
    }
  }
}

final _mapLanguages = {
  SupportedLocales.english.locale: LanguageEn(),
  SupportedLocales.vietnam.locale: LanguageVi(),
};

class L {
  static BaseLanguage get current {
    var languageCode = Get.deviceLocale?.languageCode;
    if (languageCode != null) {
      var language = _mapLanguages[Locale(languageCode)];
      if (language != null) return language;
    }

    var context = Get.context;
    if (context != null) {
      var language = Localizations.of<BaseLanguage>(context, BaseLanguage);
      if (language != null) return language;
    }
    throw Exception('No instance of L present');
  }

  static get delegate => AppLocalizationDelegate();
}

class AppLocalizationDelegate extends LocalizationsDelegate<BaseLanguage> {
  AppLocalizationDelegate();

  List<Locale> get supportedLocales => List.from(_mapLanguages.keys);

  bool _isSupported(Locale locale) => _mapLanguages.containsKey(locale);

  Future<BaseLanguage> _load(Locale locale) async {
    return LanguageEn();
    // var result = _mapLanguages[locale];
    // return result ?? LanguageEn();
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<BaseLanguage> load(Locale locale) => _load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

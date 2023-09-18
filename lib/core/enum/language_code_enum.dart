enum LanguageCodeEnum {
  tr("tr"),
  en("en");

  final String value;
  const LanguageCodeEnum(this.value);
}

extension LanguageCodeExtension on LanguageCodeEnum {
  LanguageCodeEnum stringToLanguageCode(String value) {
    switch (value) {
      case "tr":
        return LanguageCodeEnum.tr;
      case "Türkçe":
        return LanguageCodeEnum.tr;
      case "en":
        return LanguageCodeEnum.en;
      case "English":
        return LanguageCodeEnum.en;
      default:
        return LanguageCodeEnum.tr;
    }
  }
}

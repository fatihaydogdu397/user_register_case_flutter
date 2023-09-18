abstract class FieldValidator<T> {
  String errorText;
  FieldValidator(this.errorText);
  bool isValid(T value);
  String? call(T value) {
    return isValid(value) ? null : errorText;
  }
}

abstract class TextFieldValidator extends FieldValidator<String?> {
  TextFieldValidator(String errorText) : super(errorText);

  bool get ignoreEmptyValues => true;

  @override
  String? call(String? value) {
    return (ignoreEmptyValues && value!.isEmpty) ? null : super.call(value);
  }

  bool hasMatch(String pattern, String input, {bool caseSensitive = true}) => RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);
}

class MinLengthValidator extends TextFieldValidator {
  final int min;

  MinLengthValidator(this.min, {required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return (value ?? "").length >= min;
  }
}

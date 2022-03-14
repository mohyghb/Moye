// the different types of validation that we can run on an input
enum InputValidationMode { email, number, name }

class InputValidation {
  static final _emailRegex = RegExp(r'[\w-]+@([\w-]+\.)+[\w-]+');
  static final _numberRegex = RegExp(r'^[0-9]*$');
  static final _nameRegex = RegExp(r'^[a-zA-Z ]*$');

  static const emailValidator =
      InputValidation(mode: InputValidationMode.email);
  static const numberValidator =
      InputValidation(mode: InputValidationMode.number);
  static const nameValidator = InputValidation(mode: InputValidationMode.name);

  final InputValidationMode mode;

  /// specify min and max length for the input
  final int? minLen;
  final int? maxLen;

  const InputValidation({required this.mode, this.minLen, this.maxLen});

  /// return error message if input is not valid given the current [mode]
  /// otherwise return null, emphasising that there was no problem with the [input]
  String? validate(String? input,
      [String emptyInputErrorMessage = 'Please enter a value here',
      String generalError = 'The value provided is not correct']) {
    if (input == null || input.isEmpty) {
      return emptyInputErrorMessage;
    }

    String? message;
    switch (mode) {
      case InputValidationMode.email:
        message = _emailRegex.hasMatch(input) ? null : generalError;
        break;
      case InputValidationMode.number:
        message = _numberRegex.hasMatch(input) ? null : generalError;
        break;
      case InputValidationMode.name:
        message = _nameRegex.hasMatch(input) ? null : generalError;
        break;
    }

    return message;
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:moye/utils/input_validation.dart';

void main() {
  test('invalid emails', () {
    assertNonEmptyString(
        InputValidation.emailValidator.validate('something@@s.com'));
    assertNonEmptyString(InputValidation.emailValidator.validate('@gmail.com'));
    assertNonEmptyString(InputValidation.emailValidator.validate('something@.com'));
    assertNonEmptyString(InputValidation.emailValidator.validate('something.com'));
  });

  test('Valid emails', () {
    assertNull(
        InputValidation.emailValidator.validate('something@gaoijas.com'));
    assertNull(InputValidation.emailValidator.validate('adf@gaoijas.c'));
    assertNull(InputValidation.emailValidator.validate('vfs@s.coms'));
    assertNull(InputValidation.emailValidator.validate('sss3@gaoijas.com'));
  });

  test('name validation', (){
    var validator = InputValidation.nameValidator;
    assertNull(validator.validate('isw'));
    assertNull(validator.validate('dfgjflkl'));

    assertNonEmptyString(validator.validate('3lkfj'));
    assertNonEmptyString(validator.validate(''));
    assertNonEmptyString(validator.validate('234'));
  });

  test('number validation', (){
    var validator = InputValidation.numberValidator;

    assertNull(validator.validate('3223'));
    assertNull(validator.validate('123456789'));

    assertNonEmptyString(validator.validate('adsf233'));
    assertNonEmptyString(validator.validate(''));
    assertNonEmptyString(validator.validate('-234'));
  });
}

void assertNonEmptyString(String? input) {
  assert(input != null && input.isNotEmpty);
}

void assertNull(Object? o) {
  assert(o == null);
}

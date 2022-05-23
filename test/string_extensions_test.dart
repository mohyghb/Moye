import 'package:flutter_test/flutter_test.dart';
import 'package:moye/extensions/string_extensions.dart';

void main() {


  test('capitalize', () {
    expect('Hello', 'hello'.capitalize);
    expect('H', 'h'.capitalize);
    expect('', ''.capitalize);
  });

  test('title casing', () {
    expect('Hello World', 'hello world'.titleCase);
    expect('Hello World', 'Hello world'.titleCase);
    expect('Hello ', 'hello '.titleCase);
    expect('H', 'h'.titleCase);
    expect('', ''.titleCase);
  });


}

import 'package:flutter_test/flutter_test.dart';
import 'package:moye/moye.dart';

void main() {
  DateTime dt = DateTime(2022, 1, 7, 14, 26);
  test('Year month day', () {
    expect('2022,01,07', dt.getYearMonthDay());
  });

  test('Month Day Year', () {
    expect('January 7, 2022', dt.getMonthDayYear());
    expect('Jan 7, 2022', dt.getMonthDayYear(shortMonthName: true));
  });

  test('Day month year', () {
    expect('07,01,2022', dt.getDayMonthYear());
  });

  test('get time', () {
    expect('14:26', dt.getTime(is24Hours: true));
    expect('02:26 pm', dt.getTime(is24Hours: false));
  });

  test('get week day date', () {
    expect('Fri 7th', dt.getWeekDayDate(shortWeekDay: true, includeSuffix: true));
    expect('Fri 7', dt.getWeekDayDate(shortWeekDay: true, includeSuffix: false));
    expect('Friday 7th', dt.getWeekDayDate(shortWeekDay: false, includeSuffix: true));
    expect('Friday 7', dt.getWeekDayDate(shortWeekDay: false, includeSuffix: false));
  });
}
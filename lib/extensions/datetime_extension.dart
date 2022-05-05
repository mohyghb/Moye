import 'dart:collection';

const Map<int, String> months = <int, String>{
  DateTime.january : 'January',
  DateTime.february : 'February',
  DateTime.march : 'March',
  DateTime.april : 'April',
  DateTime.may : 'May',
  DateTime.june : 'June',
  DateTime.july : 'July',
  DateTime.august : 'August',
  DateTime.september : 'September',
  DateTime.october : 'October',
  DateTime.november : 'November',
  DateTime.december : 'December',
};

const Map<int, String> weekdays = <int, String> {
  DateTime.monday : 'Monday',
  DateTime.tuesday : 'Tuesday',
  DateTime.wednesday : 'Wednesday',
  DateTime.thursday : 'Thursday',
  DateTime.friday : 'Friday',
  DateTime.saturday : 'Saturday',
  DateTime.sunday : 'Sunday',
};

extension DateTimeExtension on DateTime {

  /// 2022, 02, 01 (YYYY,MM,DD)
  String getYearMonthDay({String splitter = ','}) {
    return '${this.year}$splitter${_getReadableValue(this.month)}$splitter${_getReadableValue(this.day)}';
  }

  /// November 3, 2022
  String getMonthDayYear() {
    return '${months[this.month]} ${this.day}, ${this.year}';
  }

  /// 02, 01 , 2022 (dd, mm, yyyy)
  String getDayMonthYear({String splitter = ','}) {
    return '${_getReadableValue(this.day)}$splitter${_getReadableValue(this.month)}$splitter${this.year}';
  }

  /// 19:02 or 7:02 pm depending on [is24Hours]
  String getTime({bool is24Hours = false}) {
    return '${is24Hours ? this.hour : this.hour > 12 ? this.hour - 12 : this.hour}:${this.minute}'
        '${is24Hours ? '' : this.hour >= 12 ? ' pm' : ' am'}';
  }

  /// Fri 18th or Friday 18th
  String getWeekDayDate({bool shortWeekDay = false, bool includeSuffix = false}) {
    String dayName = weekdays[this.weekday] ?? '';
    String date = includeSuffix ? _getValueWithSuffix(day) : '$day';

    if (shortWeekDay) {
      dayName = dayName.substring(0, 3);
    }

    return '$dayName $date';
  }

  /// returns [value] if it's greater than 10, otherwise returns 01 if value is 1,
  /// 02 if value is 2, and so on...
  String _getReadableValue(int value) {
    return value > 9 ? '$value' : '0$value';
  }

  /// returns [value] with the appropriate suffix
  /// e.g. 1st, 2nd, 3rd, 4th, 5th, ...
  String _getValueWithSuffix(int value) {
    int remainder = value % 10;
    String suffix = '';

    if (remainder == 1) {
      suffix = 'st';
    } else if (remainder == 2) {
      suffix = 'nd';
    } else if (remainder == 3) {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    return '$value$suffix';
  }

}